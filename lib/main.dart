import 'package:easy_birthday/core/hive/adapters_controller.dart';
import 'package:easy_birthday/core/hive/app_settings_data_source.dart';
import 'package:easy_birthday/core/hive/category_model_data_source.dart';
import 'package:easy_birthday/core/hive/persona_data_source.dart';
import 'package:easy_birthday/firebase_options.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/repos/event_repo.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
import 'package:easy_birthday/screens/splash/bloc/splash_screen_bloc.dart';
import 'package:easy_birthday/screens/splash/splash_screen.dart';
import 'package:easy_birthday/services/package_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await getAppFutureInfo();
  LocaleSettings.useDeviceLocale();
  if (kIsWeb) {
    await Hive.initFlutter();
  } else {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDirectory.path);
  }
  AdaptersController.registerAdapters();
  runApp(TranslationProvider(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AppSettingsDataSource(),
        ),
        RepositoryProvider(
          create: (context) => PersonaDataSource(),
        ),
        RepositoryProvider(
          create: (context) => PersonaRepo(context.read<PersonaDataSource>()),
        ),
        RepositoryProvider(
          create: (context) => CategoryModelDataSource(),
        ),
        RepositoryProvider(
          create: (context) => EventRepo(),
        ),
      ],
      child: BlocProvider(
        create: (context) => SplashScreenBloc(
          appSettingsDB: context.read<AppSettingsDataSource>(),
          personaRepo: context.read<PersonaRepo>(),
          eventRepo: context.read<EventRepo>(),
        )..add(SplashScreenInitialized()),
        child: MaterialApp(
          navigatorKey: NavigationContextService.navigatorKey,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.grey[100],
            fontFamily:
                GoogleFonts.amaticSc(fontWeight: FontWeight.bold).fontFamily,
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
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}

class NavigationContextService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
