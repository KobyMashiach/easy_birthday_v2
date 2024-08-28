/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 50 (25 per locale)
///
/// Built on 2024-08-28 at 18:44 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	he(languageCode: 'he', build: _StringsHe.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// context enums

enum GenderContext {
	male,
	female,
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get hello => 'Hello';
	String get choose_own_sex => 'Choose your gender';
	String get choose_partner_sex => 'Choose partner\'s gender';
	String greeter({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return 'Welcome, ${name}';
			case GenderContext.female:
				return 'Welcome, ${name}';
		}
	}
	String get home_screen => 'Home Screen';
	String get settings => 'Settings';
	String get contact_us => 'Contact Us';
	String get pick_color => 'Pick a color';
	String get ok => 'OK';
	String get cancel => 'Cancel';
	String get recommand_drak_colors => 'Recommended dark colors';
	String get build_app => 'Building the app';
	String get build_app_description => 'The app is currently being built just for you!';
	String get change_color => 'Change color';
	String get change_sex => 'Change sex';
	String get choose_sex => 'Choose sex';
	String get male => 'male';
	String get female => 'female';
	String get app_info => 'App info';
	String get app_name => 'App name';
	String get app_version => 'App Version';
	String get event_id => 'Event id';
	String get change_language => 'Change language';
	String get choose_language => 'Choose Language';
}

// Path: <root>
class _StringsHe implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsHe.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.he,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <he>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsHe _root = this; // ignore: unused_field

	// Translations
	@override String get hello => 'שלום';
	@override String get choose_own_sex => 'בחירת המין שלך';
	@override String get choose_partner_sex => 'בחירת מין הבן/בת זוג';
	@override String greeter({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return 'ברוך הבא ${name}';
			case GenderContext.female:
				return 'ברוכה הבאה, ${name}';
		}
	}
	@override String get home_screen => 'מסך בית';
	@override String get settings => 'הגדרות';
	@override String get contact_us => 'יצירת קשר';
	@override String get pick_color => 'בחר צבע';
	@override String get ok => 'אישור';
	@override String get cancel => 'ביטול';
	@override String get recommand_drak_colors => 'מומלץ צבעים כהים';
	@override String get build_app => 'בונה את האפליקציה';
	@override String get build_app_description => 'האפליקציה נבנית כרגע במיוחד בשבילך!';
	@override String get change_color => 'שינוי צבע';
	@override String get change_sex => 'שינוי מין';
	@override String get choose_sex => 'בחר מין';
	@override String get male => 'זכר';
	@override String get female => 'נקבה';
	@override String get app_info => 'מידע על האפליקציה';
	@override String get app_name => 'שם האפליקציה';
	@override String get app_version => 'גרסת האפליקציה';
	@override String get event_id => 'מספר אירוע';
	@override String get change_language => 'שנה שפה';
	@override String get choose_language => 'בחר שפה';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'hello': return 'Hello';
			case 'choose_own_sex': return 'Choose your gender';
			case 'choose_partner_sex': return 'Choose partner\'s gender';
			case 'greeter': return ({required GenderContext context, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return 'Welcome, ${name}';
					case GenderContext.female:
						return 'Welcome, ${name}';
				}
			};
			case 'home_screen': return 'Home Screen';
			case 'settings': return 'Settings';
			case 'contact_us': return 'Contact Us';
			case 'pick_color': return 'Pick a color';
			case 'ok': return 'OK';
			case 'cancel': return 'Cancel';
			case 'recommand_drak_colors': return 'Recommended dark colors';
			case 'build_app': return 'Building the app';
			case 'build_app_description': return 'The app is currently being built just for you!';
			case 'change_color': return 'Change color';
			case 'change_sex': return 'Change sex';
			case 'choose_sex': return 'Choose sex';
			case 'male': return 'male';
			case 'female': return 'female';
			case 'app_info': return 'App info';
			case 'app_name': return 'App name';
			case 'app_version': return 'App Version';
			case 'event_id': return 'Event id';
			case 'change_language': return 'Change language';
			case 'choose_language': return 'Choose Language';
			default: return null;
		}
	}
}

extension on _StringsHe {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'hello': return 'שלום';
			case 'choose_own_sex': return 'בחירת המין שלך';
			case 'choose_partner_sex': return 'בחירת מין הבן/בת זוג';
			case 'greeter': return ({required GenderContext context, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return 'ברוך הבא ${name}';
					case GenderContext.female:
						return 'ברוכה הבאה, ${name}';
				}
			};
			case 'home_screen': return 'מסך בית';
			case 'settings': return 'הגדרות';
			case 'contact_us': return 'יצירת קשר';
			case 'pick_color': return 'בחר צבע';
			case 'ok': return 'אישור';
			case 'cancel': return 'ביטול';
			case 'recommand_drak_colors': return 'מומלץ צבעים כהים';
			case 'build_app': return 'בונה את האפליקציה';
			case 'build_app_description': return 'האפליקציה נבנית כרגע במיוחד בשבילך!';
			case 'change_color': return 'שינוי צבע';
			case 'change_sex': return 'שינוי מין';
			case 'choose_sex': return 'בחר מין';
			case 'male': return 'זכר';
			case 'female': return 'נקבה';
			case 'app_info': return 'מידע על האפליקציה';
			case 'app_name': return 'שם האפליקציה';
			case 'app_version': return 'גרסת האפליקציה';
			case 'event_id': return 'מספר אירוע';
			case 'change_language': return 'שנה שפה';
			case 'choose_language': return 'בחר שפה';
			default: return null;
		}
	}
}
