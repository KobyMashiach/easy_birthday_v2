import 'dart:async';
import 'dart:io';

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/di/injector.dart';
import 'package:easy_birthday/core/hive/adapters_controller.dart';
import 'package:easy_birthday/core/di/app_dependencies.dart';
import 'package:easy_birthday/core/di/bloc_providers.dart';
import 'package:easy_birthday/core/di/repository_providers.dart';
import 'package:easy_birthday/core/services/package_info_service.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/language_model.dart';
import 'package:easy_birthday/core/utils/i18n/slang_settings.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/app_router.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/widgets/design_kit/app_toast.dart';
import 'package:easy_birthday/features/wear_os/presentation/watch_login_listener.dart';
import 'package:easy_birthday/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // The font ships in assets/google_fonts, so never hit the network for it.
  GoogleFonts.config.allowRuntimeFetching = false;

  // Independent startup work runs in parallel to shorten time-to-first-frame.
  // The locale is awaited because Hebrew is a deferred library. Splash then
  // applies the saved language, defaulting to this same one.
  await Future.wait([
    changeLanguage(LanguageModel.getAppLocale(defaultLanguageCode())),
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    getAppFutureInfo(),
    _initHive(),
  ]);
  final deps = AppDependencies.create();
  await Injector().init(deps);
  _startWatchLoginListener();
  _applyPendingPurchasesWhenPossible();
  final blocProviders = buildBlocProviders(deps);

  runApp(
    TranslationProvider(
      child: MultiRepositoryProvider(
        providers: buildRepositoryProviders(deps),
        // MultiBlocProvider asserts on an empty list.
        child: blocProviders.isEmpty
            ? const MyApp()
            : MultiBlocProvider(providers: blocProviders, child: const MyApp()),
      ),
    ),
  );
}

/// The Wear OS companion asks the phone to log in; listen for the whole app
/// lifetime, not only while a particular page is open.
void _startWatchLoginListener() {
  if (kIsWeb || !Platform.isAndroid) return;
  final watch = Injector().watchConnectivity;
  WatchLoginListener(
    messages: watch.messageStream,
    sendMessage: watch.sendMessage,
    openLogin: (onResult) => appRouter.goNamed(
      Routing.login,
      extra: (loginWithWatch: onResult),
    ),
    currentEventId: () => SessionService().event?.eventId,
  ).start();
}

/// A plan paid for before the event existed (or while offline) is written as
/// soon as possible: the event is loaded/created on the way to a new screen
/// (login, splash, onboarding), so retry after each navigation, and when the
/// app returns to the foreground (often back online by then).
void _applyPendingPurchasesWhenPossible() {
  final purchases = Injector().purchaseService;
  void retry() => unawaited(purchases.applyPending());
  appRouter.routerDelegate.addListener(retry);
  // Lives as long as the app, like the router.
  AppLifecycleListener(onResume: retry);
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  await AdaptersController.registerAdapters();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      scaffoldMessengerKey: appScaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        canvasColor: AppColors.background,
        fontFamily: GoogleFonts.amaticSc(
          fontWeight: FontWeight.bold,
        ).fontFamily,
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.amaticSc(
            textStyle: const TextStyle(fontSize: 28),
          ),
          bodyMedium: GoogleFonts.amaticSc(
            textStyle: const TextStyle(fontSize: 24),
          ),
          bodySmall: GoogleFonts.amaticSc(
            textStyle: const TextStyle(fontSize: 20),
          ),
        ),
        // Same seed as before so Material buttons/dialogs keep their
        // original colors.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        // Light, modern surfaces: flat white cards with soft corners and
        // a hairline instead of heavy shadows.
        cardTheme: const CardThemeData(
          color: Colors.white,
          elevation: 0,
          margin: EdgeInsets.symmetric(vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(color: AppColors.hairline),
          ),
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: AppColors.inkSecondary,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.hairline,
          thickness: 1,
          space: 1,
        ),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.ink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: AppColors.accentOnLight,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          elevation: 2,
          shape: const StadiumBorder(),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.ink,
          elevation: 0,
          // Dark status-bar icons on the light background.
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        // iOS: no Material ink ripples (Apple uses highlight/press
        // feedback), native slide transitions with edge-swipe back, and
        // Cupertino controls tinted with the app color.
        splashFactory: _isApplePlatform ? NoSplash.splashFactory : null,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
          },
        ),
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: AppColors.primaryColor,
        ),
      ),
      // Honour the user's text size (Dynamic Type / font scale) while
      // keeping the fixed-size layouts from breaking at the extremes.
      builder: (context, child) => MediaQuery.withClampedTextScaling(
        maxScaleFactor: 1.6,
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}

bool get _isApplePlatform =>
    defaultTargetPlatform == TargetPlatform.iOS ||
    defaultTargetPlatform == TargetPlatform.macOS;
