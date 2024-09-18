/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 118
///
/// Built on 2024-09-18 at 15:21 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.he;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.he) // set locale
/// - Locale locale = AppLocale.he.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.he) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	he(languageCode: 'he', build: Translations.build);

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
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get hello => 'שלום';
	String get choose_own_gender => 'בחירת המין שלך';
	String get choose_partner_gender => 'בחירת מין הבן/בת זוג';
	String greeter({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return 'ברוך הבא ${name}';
			case GenderContext.female:
				return 'ברוכה הבאה ${name}';
		}
	}
	String get home_screen => 'מסך בית';
	String get settings => 'הגדרות';
	String get contact_us => 'יצירת קשר';
	String get pick_color => 'בחר צבע';
	String get ok => 'אישור';
	String get cancel => 'ביטול';
	String get recommand_drak_colors => 'מומלץ צבעים כהים';
	String get build_app => 'בונה את האפליקציה';
	String get build_app_description => 'האפליקציה נבנית כרגע במיוחד בשבילך!';
	String get change_color => 'שינוי צבע';
	String get change_gender => 'שינוי מין';
	String get choose_gender => 'בחר מין';
	String get male => 'זכר';
	String get female => 'נקבה';
	String get app_info => 'מידע על האפליקציה';
	String get app_name => 'שם האפליקציה';
	String get app_version => 'גרסת האפליקציה';
	String get event_id => 'מספר אירוע';
	String get change_language => 'שינוי שפה';
	String get choose_language => 'בחר שפה';
	String get soon => 'בקרוב';
	String selected({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'נבחר';
			case GenderContext.female:
				return 'נבחרה';
		}
	}
	String get back => 'חזור';
	String get login_screen => 'מסך התחברות';
	String get login => 'התחברות';
	String get register_screen => 'מסך הרשמה';
	String get register => 'הרשמה';
	String get phone => 'טלפון';
	String get password => 'סיסמה';
	String get have_account => 'יש משתמש';
	String get no_account => 'אין משתמש';
	String get click_here => 'לחץ כאן';
	String get password_verification => 'אימות סיסמה';
	String get got_it => 'בסדר, הבנתי';
	String get short_password => 'סיסמה קצרה מידי';
	String get password_dont_match => 'הסיסמאות לא תואמות';
	String get phone_exist => 'טלפון קיים במערכת';
	String get phone_not_valid => 'מספר הטלפון לא חוקי';
	String get short_password_description => 'הסיסמה צריכה להיות 8 תווים לפחות';
	String get password_dont_match_description => '2 הסיסמאות שהזנת לא תואמות, נא נסה שוב';
	String get phone_exist_description => 'מספר הטלפון קיים במערכת שלנו, עבור למסך ההתחברות ונסה שנית';
	String get phone_not_valid_description => 'כנראה שטעית במספר הטלפון, נא נסה שנית';
	String get email => 'אימייל';
	String get email_exist => 'כתובת מייל קיימת במערכת';
	String get email_not_valid => 'כתובת המייל לא חוקית';
	String get email_exist_description => 'כתובת המייל קיימת במערכת שלנו, עבור למסך ההתחברות ונסה שנית';
	String get email_not_valid_description => 'כנראה שטעית בכתובת המייל, נא נסה שנית';
	String get wrong_password => 'הסיסמה לא נכונה, נא נסה שנית';
	String get user_not_found => 'לא נמצאה כתובת המייל הזו, נסה שוב';
	String get user_disabled => 'משתמש מושבת';
	String get too_many_requests => 'יותר מדי בקשות להתחבר לחשבון זה';
	String get operation_not_allowed => 'שגיאת שרת, אנא נסה שוב מאוחר יותר';
	String get default_error => 'ההתחברות או ההרשמה נכשלו. בבקשה נסה שוב';
	String get invalid_credential => 'כתובת המייל או הסיסמה לא נכונים, נא נסה שנית';
	String get forgot_password => 'שכחת סיסמה';
	String get password_recovery => 'שחזור סיסמה';
	String get send_mail => 'שלח מייל';
	String get send_code => 'שלח קוד';
	String get mail__recover_sent_title => 'מייל לשחזור סיסמה נשלח בהצלחה';
	String get mail__recover_sent_description => 'נא לחץ על הקישור במייל.\nאם אינך רואה את המייל נסה לחפש בתיקיית הספאם או נסה שנית';
	String get upload_dog_image => 'העלה תמונה של הכלב';
	String get add_notes => 'הוספת הערות';
	String get contact_phone => 'מספר טלפון ליצירת קשר';
	String get full_name => 'שם מלא';
	String get otp_code => 'קוד אימות';
	String get otp_code_description => 'קיבלת הודעת SMS עם קוד אימות.\nנא לרשום אותו וללחוץ אישור';
	String get send_again => 'שלח שוב';
	String get login_with_password => 'התחבר עם סיסמה';
	String get login_with_otp_code => 'התחבר עם קוד אימות';
	String get phone_not_exist_system => 'מספר הטלפון לא קיים במערכת';
	String get explanation_screen_title => 'המדריך ליצירת הפתעה מושלמת';
	String get continue_ => 'המשך';
	String get first_register => 'הרשמה ראשונית';
	String get date_of_birth => 'תאריך לידה';
	String get fill_your_details => 'מלא/י את הפרטים שלך';
	String get fill_partner_details => 'מלא/י את הפרטים של הבן/בת זוג שלך';
	String get first_password => 'בחר סיסמה התחלתית, הבן/בת זוג יוכלו לשנות את הסיסמה\nאם השדה ישאר ריק הסיסמה תהיה 123456';
	String get recommended_colors => 'צבעים מומלצים';
	String choose_color({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'בחר צבע מקשת צבעים';
			case GenderContext.female:
				return 'בחרי צבע מקשת צבעים';
		}
	}
	String skip({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'דלג';
			case GenderContext.female:
				return 'דלגי';
		}
	}
	String get continue_no_change => 'המשך ללא שינוי';
	String get selected_color => 'צבע נבחר';
	String get finish => 'סיום';
	String get relationship => 'מערכת יחסים';
	String married({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'בעלי';
			case GenderContext.female:
				return 'אשתי';
		}
	}
	String spouse({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'בן זוגי';
			case GenderContext.female:
				return 'בת זוגתי';
		}
	}
	String get soul_mate => 'נפש תאומה';
	String get got_full_app => 'אז קיבלת אפליקציה שלמה רק בשביל זה';
	String get title => 'כותרת';
	String celebrant({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'חוגג';
			case GenderContext.female:
				return 'חוגגת';
		}
	}
	String indicating({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'מציין';
			case GenderContext.female:
				return 'מציינת';
		}
	}
	String you({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'את';
			case GenderContext.female:
				return 'אתה';
		}
	}
	String my_deer({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'היקר';
			case GenderContext.female:
				return 'היקרה';
		}
	}
	String get display_result => 'הראה תוצאות';
	String get we_use => 'אנחנו נשתמש בטקסטים שבחרתם כדי לבנות את האפליקציה באופן אישי';
	String get description => 'תיאור';
	String get age => 'גיל';
	String get it => 'זה';
	String special_age({required Object age}) => 'גיל ${age} זה גיל מיוחד';
	String get fill_all_fields => 'מלא את כל השדות בבקשה';
	String get more_few_seconds => 'בעוד כמה שניות נוכל להתחיל לבנות את המתנה המושלמת!';
	String get logout => 'התנתקות';
	String sure_logout({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'אתה בטוח שאתה רוצה להתנתק?';
			case GenderContext.female:
				return 'את בטוחה שאת רוצה להתנתק?';
		}
	}
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'hello': return 'שלום';
			case 'choose_own_gender': return 'בחירת המין שלך';
			case 'choose_partner_gender': return 'בחירת מין הבן/בת זוג';
			case 'greeter': return ({required GenderContext context, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return 'ברוך הבא ${name}';
					case GenderContext.female:
						return 'ברוכה הבאה ${name}';
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
			case 'change_gender': return 'שינוי מין';
			case 'choose_gender': return 'בחר מין';
			case 'male': return 'זכר';
			case 'female': return 'נקבה';
			case 'app_info': return 'מידע על האפליקציה';
			case 'app_name': return 'שם האפליקציה';
			case 'app_version': return 'גרסת האפליקציה';
			case 'event_id': return 'מספר אירוע';
			case 'change_language': return 'שינוי שפה';
			case 'choose_language': return 'בחר שפה';
			case 'soon': return 'בקרוב';
			case 'selected': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'נבחר';
					case GenderContext.female:
						return 'נבחרה';
				}
			};
			case 'back': return 'חזור';
			case 'login_screen': return 'מסך התחברות';
			case 'login': return 'התחברות';
			case 'register_screen': return 'מסך הרשמה';
			case 'register': return 'הרשמה';
			case 'phone': return 'טלפון';
			case 'password': return 'סיסמה';
			case 'have_account': return 'יש משתמש';
			case 'no_account': return 'אין משתמש';
			case 'click_here': return 'לחץ כאן';
			case 'password_verification': return 'אימות סיסמה';
			case 'got_it': return 'בסדר, הבנתי';
			case 'short_password': return 'סיסמה קצרה מידי';
			case 'password_dont_match': return 'הסיסמאות לא תואמות';
			case 'phone_exist': return 'טלפון קיים במערכת';
			case 'phone_not_valid': return 'מספר הטלפון לא חוקי';
			case 'short_password_description': return 'הסיסמה צריכה להיות 8 תווים לפחות';
			case 'password_dont_match_description': return '2 הסיסמאות שהזנת לא תואמות, נא נסה שוב';
			case 'phone_exist_description': return 'מספר הטלפון קיים במערכת שלנו, עבור למסך ההתחברות ונסה שנית';
			case 'phone_not_valid_description': return 'כנראה שטעית במספר הטלפון, נא נסה שנית';
			case 'email': return 'אימייל';
			case 'email_exist': return 'כתובת מייל קיימת במערכת';
			case 'email_not_valid': return 'כתובת המייל לא חוקית';
			case 'email_exist_description': return 'כתובת המייל קיימת במערכת שלנו, עבור למסך ההתחברות ונסה שנית';
			case 'email_not_valid_description': return 'כנראה שטעית בכתובת המייל, נא נסה שנית';
			case 'wrong_password': return 'הסיסמה לא נכונה, נא נסה שנית';
			case 'user_not_found': return 'לא נמצאה כתובת המייל הזו, נסה שוב';
			case 'user_disabled': return 'משתמש מושבת';
			case 'too_many_requests': return 'יותר מדי בקשות להתחבר לחשבון זה';
			case 'operation_not_allowed': return 'שגיאת שרת, אנא נסה שוב מאוחר יותר';
			case 'default_error': return 'ההתחברות או ההרשמה נכשלו. בבקשה נסה שוב';
			case 'invalid_credential': return 'כתובת המייל או הסיסמה לא נכונים, נא נסה שנית';
			case 'forgot_password': return 'שכחת סיסמה';
			case 'password_recovery': return 'שחזור סיסמה';
			case 'send_mail': return 'שלח מייל';
			case 'send_code': return 'שלח קוד';
			case 'mail__recover_sent_title': return 'מייל לשחזור סיסמה נשלח בהצלחה';
			case 'mail__recover_sent_description': return 'נא לחץ על הקישור במייל.\nאם אינך רואה את המייל נסה לחפש בתיקיית הספאם או נסה שנית';
			case 'upload_dog_image': return 'העלה תמונה של הכלב';
			case 'add_notes': return 'הוספת הערות';
			case 'contact_phone': return 'מספר טלפון ליצירת קשר';
			case 'full_name': return 'שם מלא';
			case 'otp_code': return 'קוד אימות';
			case 'otp_code_description': return 'קיבלת הודעת SMS עם קוד אימות.\nנא לרשום אותו וללחוץ אישור';
			case 'send_again': return 'שלח שוב';
			case 'login_with_password': return 'התחבר עם סיסמה';
			case 'login_with_otp_code': return 'התחבר עם קוד אימות';
			case 'phone_not_exist_system': return 'מספר הטלפון לא קיים במערכת';
			case 'explanation_screen_title': return 'המדריך ליצירת הפתעה מושלמת';
			case 'continue_': return 'המשך';
			case 'first_register': return 'הרשמה ראשונית';
			case 'date_of_birth': return 'תאריך לידה';
			case 'fill_your_details': return 'מלא/י את הפרטים שלך';
			case 'fill_partner_details': return 'מלא/י את הפרטים של הבן/בת זוג שלך';
			case 'first_password': return 'בחר סיסמה התחלתית, הבן/בת זוג יוכלו לשנות את הסיסמה\nאם השדה ישאר ריק הסיסמה תהיה 123456';
			case 'recommended_colors': return 'צבעים מומלצים';
			case 'choose_color': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'בחר צבע מקשת צבעים';
					case GenderContext.female:
						return 'בחרי צבע מקשת צבעים';
				}
			};
			case 'skip': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'דלג';
					case GenderContext.female:
						return 'דלגי';
				}
			};
			case 'continue_no_change': return 'המשך ללא שינוי';
			case 'selected_color': return 'צבע נבחר';
			case 'finish': return 'סיום';
			case 'relationship': return 'מערכת יחסים';
			case 'married': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'בעלי';
					case GenderContext.female:
						return 'אשתי';
				}
			};
			case 'spouse': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'בן זוגי';
					case GenderContext.female:
						return 'בת זוגתי';
				}
			};
			case 'soul_mate': return 'נפש תאומה';
			case 'got_full_app': return 'אז קיבלת אפליקציה שלמה רק בשביל זה';
			case 'title': return 'כותרת';
			case 'celebrant': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'חוגג';
					case GenderContext.female:
						return 'חוגגת';
				}
			};
			case 'indicating': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'מציין';
					case GenderContext.female:
						return 'מציינת';
				}
			};
			case 'you': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'את';
					case GenderContext.female:
						return 'אתה';
				}
			};
			case 'my_deer': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'היקר';
					case GenderContext.female:
						return 'היקרה';
				}
			};
			case 'display_result': return 'הראה תוצאות';
			case 'we_use': return 'אנחנו נשתמש בטקסטים שבחרתם כדי לבנות את האפליקציה באופן אישי';
			case 'description': return 'תיאור';
			case 'age': return 'גיל';
			case 'it': return 'זה';
			case 'special_age': return ({required Object age}) => 'גיל ${age} זה גיל מיוחד';
			case 'fill_all_fields': return 'מלא את כל השדות בבקשה';
			case 'more_few_seconds': return 'בעוד כמה שניות נוכל להתחיל לבנות את המתנה המושלמת!';
			case 'logout': return 'התנתקות';
			case 'sure_logout': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'אתה בטוח שאתה רוצה להתנתק?';
					case GenderContext.female:
						return 'את בטוחה שאת רוצה להתנתק?';
				}
			};
			default: return null;
		}
	}
}
