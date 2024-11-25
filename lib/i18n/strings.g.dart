/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 305
///
/// Built on 2024-11-25 at 14:27 UTC

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
	String get welcome => 'ברוכ/ה הבאה!';
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
	String get change_plan => 'שינוי תוכנית';
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
	String get first_name => 'שם פרטי';
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
	String get current_plan => 'תוכנית נוכחית';
	String get change_password => 'שנה סיסמה';
	String get new_password => 'סיסמה חדשה';
	String get new_password_verification => 'אימות סיסמה חדשה';
	String get phone_verification => 'אימות טלפון';
	String greeting_first_login({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return '${name} הכינה לך את ההפתעה הכי מגניבה שיש!\nאפליקציה שנבנתה במיוחד בשבילך, ליום ההולדת שלך!\nכאן תמצא ברכה אישית מהלב,\nתמונות משותפות שלכם מכל הרגעים הכי יפים,\nועוד הפתעות שרק יחממו לך את הלב,\nכי מגיע לך את כל הטוב שבעולם!\nאז תתכונן, זו הולכת להיות חגיגה בלתי נשכחת!🎉🎉🎉';
			case GenderContext.female:
				return '${name} הכין לך את ההפתעה הכי מגניבה שיש!\nאפליקציה שנבנתה במיוחד בשבילך, ליום ההולדת שלך!\nכאן תמצאי ברכה אישית מהלב,\nתמונות משותפות שלכם מכל הרגעים הכי יפים,\nועוד הפתעות שרק יחממו לך את הלב,\nכי מגיע לך את כל הטוב שבעולם!\nאז תתכונני, זו הולכת להיות חגיגה בלתי נשכחת!🎉🎉🎉';
		}
	}
	String get lets_continue => 'בואו נתקדם!';
	String add({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'הוסף';
			case GenderContext.female:
				return 'הוסיפי';
		}
	}
	String remove({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'הסר';
			case GenderContext.female:
				return 'הסירי';
		}
	}
	String get text => 'טקסט';
	String get pictures => 'תמונות';
	String get videos => 'סרטונים';
	String get quiz_game => 'משחק טריוויה';
	String get birthday_calendar => 'לו"ז יום הולדת';
	String get birthday_suprise => 'הפתעת יום הולדת';
	String text_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'יאללה, תשלוף ברכה מהלב או כתוב איזה טקסט קורע שתרצה!';
			case GenderContext.female:
				return 'יאללה, תשלפי ברכה מהלב או כתבי איזה טקסט קורע שתרצי!';
		}
	}
	String pictures_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'הוסף כמה תמונות משותפות שימסו לכם את הלב';
			case GenderContext.female:
				return 'הוסיפי כמה תמונות משותפות שימסו לכם את הלב';
		}
	}
	String videos_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'הוסף סרטוני יוטיוב שמזכירים לכם כמה אתם חמודים ביחד';
			case GenderContext.female:
				return 'הוסיפי סרטוני יוטיוב שמזכירים לכם כמה אתם חמודים ביחד';
		}
	}
	String quiz_game_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'יאללה, תבנה משחק טריוויה שיבדוק אם אתם יודעים בכלל מי זה מי!';
			case GenderContext.female:
				return 'יאללה, תבני משחק טריוויה שיבדוק אם אתם יודעים בכלל מי זה מי!';
		}
	}
	String choose_category({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'בחר קטגוריה';
			case GenderContext.female:
				return 'בחרי קטגוריה';
		}
	}
	String birthday_calendar_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'בוא לבנות את הלו"ז הכי מגניב וכיפי ליום ההולדת של בת הזוג שלך! תכנן לה יום מושלם מלא בהפתעות ופעילויות בלתי נשכחות.';
			case GenderContext.female:
				return 'בואי לבנות את הלו"ז הכי מגניב וכיפי ליום ההולדת של בן הזוג שלך! תכנני לו יום מושלם מלא בהפתעות ופעילויות בלתי נשכחות.';
		}
	}
	String birthday_suprise_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'בוא לבנות את הפתעת יום ההולדת, אבל ששששש... עד שתפתח את זה, זה יישאר נעול אצל בת הזוג שלך!';
			case GenderContext.female:
				return 'בואי לבנות את הפתעת יום ההולדת, אבל ששששש... עד שתיפתחי את זה, זה יישאר נעול אצל בן הזוג שלך!';
		}
	}
	String wishes_list_description({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return 'הוסף אפשרות ל${name} לבחור 3 משאלות:\nרשום לה "חוזה" קטן, ככה שהיא לא תוכל להגזים!';
			case GenderContext.female:
				return 'הוספי אפשרות ל${name} לבחור 3 משאלות:\nרשמי לו "חוזה" קטן, ככה שהוא לא יוכל להגזים!';
		}
	}
	String wishes_list_display_description({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return 'בחר 3 משאלות ש${name} חייבת להגשים!';
			case GenderContext.female:
				return 'בחרי 3 משאלות ש${name} חייב להגשים!';
		}
	}
	String get please_choose_category => 'בחר קטגוריה בבקשה';
	String get title_appear_category => 'הכותרת שתופיע לקטגוריה זו';
	String get title_appear_required => 'נא למלא את הכותרת';
	String get text_appear_required => 'נא למלא את הטקסט';
	String get write_text => 'רשום טקסט';
	String get add_text => 'הוסף טקסט';
	String get add_picture => 'הוסף תמונה';
	String get add_pictures => 'הוסף תמונות';
	String get add_videos => 'הוסף סרטונים';
	String write_text_to({required Object title}) => 'רשום טקסט ל: ${title}';
	String add_pictures_to({required Object title}) => 'הוסף תמונות ל: ${title}';
	String add_videos_to({required Object title}) => 'הוסף סרטונים ל: ${title}';
	String get add_text_pictures_title => 'הוסף טקסט ותמונות';
	String add_text_pictures_description({required Object title}) => 'הוסף טקסט ותמונות ל: ${title}';
	String get add_suprise => 'הוספת הפתעה';
	String get lock => 'נעול';
	String get unlock => 'לא נעול';
	String get no_allow_text_empty => 'לא ניתן להשאיר טקסט ריק';
	String get edit => 'עריכה';
	String get exit => 'יציאה';
	String sure_delete_name({required GenderContext context, required Object text}) {
		switch (context) {
			case GenderContext.male:
				return 'אתה בטוח שאתה רוצה למחוק את ${text}?';
			case GenderContext.female:
				return 'את בטוחה שאת רוצה למחוק את ${text}?';
		}
	}
	String sure_delete({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'אתה בטוח שאתה רוצה למחוק את האירוע הזה?';
			case GenderContext.female:
				return 'את בטוחה שאת רוצה למחוק את האירוע הזה?';
		}
	}
	String get delete => 'מחיקה';
	String get mark_all => 'סמן הכל';
	String get cancel_marking => 'בטל סימון';
	String upload_files_count({required Object file, required Object files}) => 'הועלו ${file} מתוך ${files} קבצים';
	String get use_emojis => 'שימוש באימוג׳ים';
	String get lines_number => 'מספר שורות';
	String get max_words_in_line => 'מקסימום מילים בשורה';
	String get add_free_text => 'הוספת טקסט חופשי';
	String get yes => 'כן';
	String get no => 'לא';
	String get no_required => 'לא חובה';
	String generate_text_description({required Object relationship, required Object name, required Object myName, required Object lineNumber, required Object wordsInLineNumebr, required Object age}) => 'רשום ברכת יום הולדת ל${relationship}, השם הוא ${name}\nהשם שלי הוא: ${myName}\nמספר השורות של הברכה: ${lineNumber}\nמספר המילים בשורה:${wordsInLineNumebr}\nהגיל  הוא ${age}';
	String get partner_info => 'מידע על הבן/בת זוג';
	String get info => 'מידע';
	String get gender => 'מין';
	String get greeting_notes => '* השמות שלכם ירשמו באופן אוטומטי\n* הגיל של הבן/בת זוג ירשם באופן אוטומטי\n* לאחר קבלת הברכה תוכלו לערוך אותה כמו שרק תרצו';
	String get greeting_before_edit => 'ברכה לפני עריכה';
	String get generate_greeting => 'ליצור ברכה';
	String get generate_new_greeting => 'ליצור ברכה חדשה';
	String get edit_greeting => 'עריכת הברכה';
	String get create_greeting_using_ai => 'צור ברכה באמצעות AI';
	String suprise_screen_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'הוסף טקסט או תמונות, שחק עם הסדר ביניהם ותיצור את ההפתעה המושלמת!\nההפתעה תישאר סודית עד שתחליט שהיא מוכנה לבת הזוג שלך!';
			case GenderContext.female:
				return 'הוסיפי טקסט או תמונות, שחקי עם הסדר ביניהם וצרי את ההפתעה המושלמת!\nההפתעה תישאר סודית עד שתחליטי שהיא מוכנה לבן הזוג שלך!';
		}
	}
	String get the_image => 'התמונה';
	String get the_text => 'הטקסט';
	String secret_dialog({required GenderContext context, required Object categoryName, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return '"${categoryName}" נעול עד ש${name} תיתן לך את ההרשאה לפתוח אותה!';
			case GenderContext.female:
				return '"${categoryName}" נעול עד ש${name} יתן לך את ההרשאה לפתוח אותה!';
		}
	}
	String get wishes_list => 'רשימת משאלות';
	String get write_contract => 'רשום חוזה';
	String write_contract_to({required Object title}) => 'רשום חוזה ל: ${title}';
	String get display_wishes => 'הצג משאלות';
	String get delete_wishes => 'מחיקת המשאלות';
	String delete_wishes_description({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return 'אם המשאלות לא עומדות בחוזה ניתן למחוק ואז ${name} תוכל למלא מחדש';
			case GenderContext.female:
				return 'אם המשאלות לא עומדות בחוזה ניתן למחוק ואז ${name} יוכל למלא מחדש';
		}
	}
	String get first_wish => 'משאלה ראשוונה';
	String get second_wish => 'משאלה שנייה';
	String get third_wish => 'משאלה שלישית';
	String get save => 'שמור';
	String get save_and_lock => 'שמור ונעל';
	String get wish_list_lock_title => 'רשימת המשאלות נעולה';
	String wish_list_lock_description({required Object name}) => 'כדי לפתוח אותה אנא בקשו מ${name} הזדמנות חדשה';
	String please_read_contract({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return 'חוזה ש${name} כתבה במיוחד בשבילך';
			case GenderContext.female:
				return 'חוזה ש${name} כתב במיוחד בשבילך';
		}
	}
	String get no_wish_yet => 'אין עדיין משאלות';
	String get calendar_time => 'לו"ז';
	String write_calendar_time_to({required Object title}) => 'רשום לו"ז ל: ${title}';
	String add_quiz_to({required Object title}) => 'הוסף משחק טריוויה ל: ${title}';
	String get month => 'חודש';
	String get week => 'שבוע';
	String get two_weeks => 'שבועיים';
	String get pick_start_date => 'בחר תאריך התחלה';
	String get pick_end_date => 'בחר תאריך סיום';
	String get pick_date_range => 'בחר טווח תאריכים';
	String event_in_date({required Object date}) => 'אירועים בתאריך ${date}';
	String add_event({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'הוסף אירוע';
			case GenderContext.female:
				return 'הוסיפי אירוע';
		}
	}
	String add_event_date({required GenderContext context, required Object date}) {
		switch (context) {
			case GenderContext.male:
				return 'הוסף אירוע לתאריך ${date}';
			case GenderContext.female:
				return 'הוסיפי אירוע לתאריך ${date}';
		}
	}
	String get event_description => 'תיאור אירוע';
	String get select_time => 'בחירת שעה';
	String selected_time({required Object time}) => 'שעה שנבחרה: ${time}';
	String add_question({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'הוסף שאלה';
			case GenderContext.female:
				return 'הוסיפי שאלה';
		}
	}
	String remove_question({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'הסר שאלה';
			case GenderContext.female:
				return 'הסירי שאלה';
		}
	}
	String num_of_questions({required Object number}) => 'יש לך כרגע ${number} שאלות';
	String get show_questions => 'הצגת השאלות';
	String get true_ => 'נכון';
	String get false_ => 'לא נכון';
	String get true_false_question => 'שאלת נכון או לא נכון';
	String get four_answers_question => 'שאלת 4 תשובות';
	String get question => 'שאלה';
	String get questions => 'שאלות';
	String choose_currect_answer({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'בחר את התשובה הנכונה';
			case GenderContext.female:
				return 'בחרי את התשובה הנכונה';
		}
	}
	String get add_image => 'הוספת תמונה';
	String get first_question => 'שאלה ראשונה';
	String get second_question => 'שאלה שנייה';
	String get third_question => 'שאלה שלישית';
	String get fourth_question => 'שאלה רביעית';
	String get required_fill_question => 'חובה למלא את השאלה';
	String get required_fill_all_answer => 'חובה למלא את כל התשובות';
	String choose_question_delete({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'בחר את השאלות שתרצה למחוק';
			case GenderContext.female:
				return 'בחרי את השאלות שתרצי למחוק';
		}
	}
	String get mark_least_one_question => 'יש לסמן לפחות שאלה אחת';
	String get no_questions_add => 'לא הועלו שאלות עדיין';
	String quiz_game_partner_description({required GenderContext context, required Object name, required Object number}) {
		switch (context) {
			case GenderContext.male:
				return 'ברוך הבא למשחק הטריוויה!\n${name} הכינה לך ${number} שאלות מסקרנות.\nשים ❤️ – אי אפשר לתקן תשובה שנתת, אז ענה בכיף אבל בזהירות 😉\nבהצלחה!';
			case GenderContext.female:
				return 'ברוכה הבאה למשחק הטריוויה!\n${name} הכין לך ${number} שאלות מסקרנות.\nשימי ❤️ – אי אפשר לתקן תשובה שנתת, אז תעני בכיף אבל בזהירות 😉\nבהצלחה!';
		}
	}
	String quiz_game_partner_no_questions({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return '${name} לא העלתה עדיין שאלות';
			case GenderContext.female:
				return '${name} לא העלה עדיין שאלות';
		}
	}
	String click_here_start({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'לחץ כאן להתחלה';
			case GenderContext.female:
				return 'לחצי כאן להתחלה';
		}
	}
	String get quiz_game_done => 'משחק הטריוויה נגמר';
	String you_answer_from({required Object answers, required Object questions}) => 'ענית נכון על ${answers} מתוך ${questions} שאלות';
	String get choose_couple_profile_image => 'בחר/י תמונת פרופיל זוגית שלכם';
	String get memory_game => 'משחק הזיכרון';
	String get num_mistakes => 'מספר טעויות';
	String get score => 'תוצאה';
	String get game_over => 'המשחק נגמר';
	String you_win({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'אתה ניצחת!';
			case GenderContext.female:
				return 'את ניצחת!';
		}
	}
	String upload_six_images({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'העלה 6 תמונות שישמשו למשחק הזיכרון';
			case GenderContext.female:
				return 'העלי 6 תמונות שישמשו למשחק הזיכרון';
		}
	}
	String get upload_images => 'העלאת תמונות';
	String get confirm_images => 'לאשר את התמונות?';
	String memory_game_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'בנה משחק זיכרון מגניב עם 6 תמונות משותפות שלכם!';
			case GenderContext.female:
				return 'בני משחק זיכרון מגניב עם 6 תמונות משותפות שלכם!';
		}
	}
	String get memory_game_lock_title => 'משחק הזיכרון נעול';
	String memory_game_lock_description({required Object name}) => 'כדי לפתוח אותו אנא בקשו מ${name} הזדמנות חדשה';
	String memory_game_done({required GenderContext context, required Object name, required Object score}) {
		switch (context) {
			case GenderContext.male:
				return '${name} סיימה את המשחק עם ניקוד: ${score}';
			case GenderContext.female:
				return '${name} סיים את המשחק עם ניקוד: ${score}';
		}
	}
	String get open_new_memory_game => 'פתיחת גישה למשחק חדש';
	String cant_upload_more_than({required GenderContext context, required Object number}) {
		switch (context) {
			case GenderContext.male:
				return 'אתה לא יכול להעלות יותר מ-${number} קבצים';
			case GenderContext.female:
				return 'את לא יכולה להעלות יותר מ-${number} קבצים';
		}
	}
	String get locked_category => 'קטגוריה זו נעולה.\nכדי לפתוח אותה יש לשדרג את התוכנית שלך בהגדרות';
	String get edit_title => 'ערוך כותרת';
	String get watch_login_success => 'התחברת בהצלחה!\nאפשר לעבור לשעון';
	String get login_via_phone => 'התחבר באמצעות הטלפון';
	String get wait_for_phone_login => 'מחכה להתחברות דרך הטלפון';
	String get login_successful => 'התחברת בהצלחה!';
	String get no_owner => 'המשתמש לא משתמש ניהולי';
	String get login_failed => 'ההתחברות נכשלה';
	String get please_open_app_in_phone => 'פתח את האפליקציה בטלפון כדי להתחבר';
	String get failed_send_login_request => 'נכשל בשליחת בקשה לטלפון, נא נסה שנית';
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
			case 'welcome': return 'ברוכ/ה הבאה!';
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
			case 'change_plan': return 'שינוי תוכנית';
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
			case 'first_name': return 'שם פרטי';
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
			case 'current_plan': return 'תוכנית נוכחית';
			case 'change_password': return 'שנה סיסמה';
			case 'new_password': return 'סיסמה חדשה';
			case 'new_password_verification': return 'אימות סיסמה חדשה';
			case 'phone_verification': return 'אימות טלפון';
			case 'greeting_first_login': return ({required GenderContext context, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return '${name} הכינה לך את ההפתעה הכי מגניבה שיש!\nאפליקציה שנבנתה במיוחד בשבילך, ליום ההולדת שלך!\nכאן תמצא ברכה אישית מהלב,\nתמונות משותפות שלכם מכל הרגעים הכי יפים,\nועוד הפתעות שרק יחממו לך את הלב,\nכי מגיע לך את כל הטוב שבעולם!\nאז תתכונן, זו הולכת להיות חגיגה בלתי נשכחת!🎉🎉🎉';
					case GenderContext.female:
						return '${name} הכין לך את ההפתעה הכי מגניבה שיש!\nאפליקציה שנבנתה במיוחד בשבילך, ליום ההולדת שלך!\nכאן תמצאי ברכה אישית מהלב,\nתמונות משותפות שלכם מכל הרגעים הכי יפים,\nועוד הפתעות שרק יחממו לך את הלב,\nכי מגיע לך את כל הטוב שבעולם!\nאז תתכונני, זו הולכת להיות חגיגה בלתי נשכחת!🎉🎉🎉';
				}
			};
			case 'lets_continue': return 'בואו נתקדם!';
			case 'add': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'הוסף';
					case GenderContext.female:
						return 'הוסיפי';
				}
			};
			case 'remove': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'הסר';
					case GenderContext.female:
						return 'הסירי';
				}
			};
			case 'text': return 'טקסט';
			case 'pictures': return 'תמונות';
			case 'videos': return 'סרטונים';
			case 'quiz_game': return 'משחק טריוויה';
			case 'birthday_calendar': return 'לו"ז יום הולדת';
			case 'birthday_suprise': return 'הפתעת יום הולדת';
			case 'text_description': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'יאללה, תשלוף ברכה מהלב או כתוב איזה טקסט קורע שתרצה!';
					case GenderContext.female:
						return 'יאללה, תשלפי ברכה מהלב או כתבי איזה טקסט קורע שתרצי!';
				}
			};
			case 'pictures_description': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'הוסף כמה תמונות משותפות שימסו לכם את הלב';
					case GenderContext.female:
						return 'הוסיפי כמה תמונות משותפות שימסו לכם את הלב';
				}
			};
			case 'videos_description': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'הוסף סרטוני יוטיוב שמזכירים לכם כמה אתם חמודים ביחד';
					case GenderContext.female:
						return 'הוסיפי סרטוני יוטיוב שמזכירים לכם כמה אתם חמודים ביחד';
				}
			};
			case 'quiz_game_description': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'יאללה, תבנה משחק טריוויה שיבדוק אם אתם יודעים בכלל מי זה מי!';
					case GenderContext.female:
						return 'יאללה, תבני משחק טריוויה שיבדוק אם אתם יודעים בכלל מי זה מי!';
				}
			};
			case 'choose_category': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'בחר קטגוריה';
					case GenderContext.female:
						return 'בחרי קטגוריה';
				}
			};
			case 'birthday_calendar_description': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'בוא לבנות את הלו"ז הכי מגניב וכיפי ליום ההולדת של בת הזוג שלך! תכנן לה יום מושלם מלא בהפתעות ופעילויות בלתי נשכחות.';
					case GenderContext.female:
						return 'בואי לבנות את הלו"ז הכי מגניב וכיפי ליום ההולדת של בן הזוג שלך! תכנני לו יום מושלם מלא בהפתעות ופעילויות בלתי נשכחות.';
				}
			};
			case 'birthday_suprise_description': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'בוא לבנות את הפתעת יום ההולדת, אבל ששששש... עד שתפתח את זה, זה יישאר נעול אצל בת הזוג שלך!';
					case GenderContext.female:
						return 'בואי לבנות את הפתעת יום ההולדת, אבל ששששש... עד שתיפתחי את זה, זה יישאר נעול אצל בן הזוג שלך!';
				}
			};
			case 'wishes_list_description': return ({required GenderContext context, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return 'הוסף אפשרות ל${name} לבחור 3 משאלות:\nרשום לה "חוזה" קטן, ככה שהיא לא תוכל להגזים!';
					case GenderContext.female:
						return 'הוספי אפשרות ל${name} לבחור 3 משאלות:\nרשמי לו "חוזה" קטן, ככה שהוא לא יוכל להגזים!';
				}
			};
			case 'wishes_list_display_description': return ({required GenderContext context, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return 'בחר 3 משאלות ש${name} חייבת להגשים!';
					case GenderContext.female:
						return 'בחרי 3 משאלות ש${name} חייב להגשים!';
				}
			};
			case 'please_choose_category': return 'בחר קטגוריה בבקשה';
			case 'title_appear_category': return 'הכותרת שתופיע לקטגוריה זו';
			case 'title_appear_required': return 'נא למלא את הכותרת';
			case 'text_appear_required': return 'נא למלא את הטקסט';
			case 'write_text': return 'רשום טקסט';
			case 'add_text': return 'הוסף טקסט';
			case 'add_picture': return 'הוסף תמונה';
			case 'add_pictures': return 'הוסף תמונות';
			case 'add_videos': return 'הוסף סרטונים';
			case 'write_text_to': return ({required Object title}) => 'רשום טקסט ל: ${title}';
			case 'add_pictures_to': return ({required Object title}) => 'הוסף תמונות ל: ${title}';
			case 'add_videos_to': return ({required Object title}) => 'הוסף סרטונים ל: ${title}';
			case 'add_text_pictures_title': return 'הוסף טקסט ותמונות';
			case 'add_text_pictures_description': return ({required Object title}) => 'הוסף טקסט ותמונות ל: ${title}';
			case 'add_suprise': return 'הוספת הפתעה';
			case 'lock': return 'נעול';
			case 'unlock': return 'לא נעול';
			case 'no_allow_text_empty': return 'לא ניתן להשאיר טקסט ריק';
			case 'edit': return 'עריכה';
			case 'exit': return 'יציאה';
			case 'sure_delete_name': return ({required GenderContext context, required Object text}) {
				switch (context) {
					case GenderContext.male:
						return 'אתה בטוח שאתה רוצה למחוק את ${text}?';
					case GenderContext.female:
						return 'את בטוחה שאת רוצה למחוק את ${text}?';
				}
			};
			case 'sure_delete': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'אתה בטוח שאתה רוצה למחוק את האירוע הזה?';
					case GenderContext.female:
						return 'את בטוחה שאת רוצה למחוק את האירוע הזה?';
				}
			};
			case 'delete': return 'מחיקה';
			case 'mark_all': return 'סמן הכל';
			case 'cancel_marking': return 'בטל סימון';
			case 'upload_files_count': return ({required Object file, required Object files}) => 'הועלו ${file} מתוך ${files} קבצים';
			case 'use_emojis': return 'שימוש באימוג׳ים';
			case 'lines_number': return 'מספר שורות';
			case 'max_words_in_line': return 'מקסימום מילים בשורה';
			case 'add_free_text': return 'הוספת טקסט חופשי';
			case 'yes': return 'כן';
			case 'no': return 'לא';
			case 'no_required': return 'לא חובה';
			case 'generate_text_description': return ({required Object relationship, required Object name, required Object myName, required Object lineNumber, required Object wordsInLineNumebr, required Object age}) => 'רשום ברכת יום הולדת ל${relationship}, השם הוא ${name}\nהשם שלי הוא: ${myName}\nמספר השורות של הברכה: ${lineNumber}\nמספר המילים בשורה:${wordsInLineNumebr}\nהגיל  הוא ${age}';
			case 'partner_info': return 'מידע על הבן/בת זוג';
			case 'info': return 'מידע';
			case 'gender': return 'מין';
			case 'greeting_notes': return '* השמות שלכם ירשמו באופן אוטומטי\n* הגיל של הבן/בת זוג ירשם באופן אוטומטי\n* לאחר קבלת הברכה תוכלו לערוך אותה כמו שרק תרצו';
			case 'greeting_before_edit': return 'ברכה לפני עריכה';
			case 'generate_greeting': return 'ליצור ברכה';
			case 'generate_new_greeting': return 'ליצור ברכה חדשה';
			case 'edit_greeting': return 'עריכת הברכה';
			case 'create_greeting_using_ai': return 'צור ברכה באמצעות AI';
			case 'suprise_screen_description': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'הוסף טקסט או תמונות, שחק עם הסדר ביניהם ותיצור את ההפתעה המושלמת!\nההפתעה תישאר סודית עד שתחליט שהיא מוכנה לבת הזוג שלך!';
					case GenderContext.female:
						return 'הוסיפי טקסט או תמונות, שחקי עם הסדר ביניהם וצרי את ההפתעה המושלמת!\nההפתעה תישאר סודית עד שתחליטי שהיא מוכנה לבן הזוג שלך!';
				}
			};
			case 'the_image': return 'התמונה';
			case 'the_text': return 'הטקסט';
			case 'secret_dialog': return ({required GenderContext context, required Object categoryName, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return '"${categoryName}" נעול עד ש${name} תיתן לך את ההרשאה לפתוח אותה!';
					case GenderContext.female:
						return '"${categoryName}" נעול עד ש${name} יתן לך את ההרשאה לפתוח אותה!';
				}
			};
			case 'wishes_list': return 'רשימת משאלות';
			case 'write_contract': return 'רשום חוזה';
			case 'write_contract_to': return ({required Object title}) => 'רשום חוזה ל: ${title}';
			case 'display_wishes': return 'הצג משאלות';
			case 'delete_wishes': return 'מחיקת המשאלות';
			case 'delete_wishes_description': return ({required GenderContext context, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return 'אם המשאלות לא עומדות בחוזה ניתן למחוק ואז ${name} תוכל למלא מחדש';
					case GenderContext.female:
						return 'אם המשאלות לא עומדות בחוזה ניתן למחוק ואז ${name} יוכל למלא מחדש';
				}
			};
			case 'first_wish': return 'משאלה ראשוונה';
			case 'second_wish': return 'משאלה שנייה';
			case 'third_wish': return 'משאלה שלישית';
			case 'save': return 'שמור';
			case 'save_and_lock': return 'שמור ונעל';
			case 'wish_list_lock_title': return 'רשימת המשאלות נעולה';
			case 'wish_list_lock_description': return ({required Object name}) => 'כדי לפתוח אותה אנא בקשו מ${name} הזדמנות חדשה';
			case 'please_read_contract': return ({required GenderContext context, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return 'חוזה ש${name} כתבה במיוחד בשבילך';
					case GenderContext.female:
						return 'חוזה ש${name} כתב במיוחד בשבילך';
				}
			};
			case 'no_wish_yet': return 'אין עדיין משאלות';
			case 'calendar_time': return 'לו"ז';
			case 'write_calendar_time_to': return ({required Object title}) => 'רשום לו"ז ל: ${title}';
			case 'add_quiz_to': return ({required Object title}) => 'הוסף משחק טריוויה ל: ${title}';
			case 'month': return 'חודש';
			case 'week': return 'שבוע';
			case 'two_weeks': return 'שבועיים';
			case 'pick_start_date': return 'בחר תאריך התחלה';
			case 'pick_end_date': return 'בחר תאריך סיום';
			case 'pick_date_range': return 'בחר טווח תאריכים';
			case 'event_in_date': return ({required Object date}) => 'אירועים בתאריך ${date}';
			case 'add_event': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'הוסף אירוע';
					case GenderContext.female:
						return 'הוסיפי אירוע';
				}
			};
			case 'add_event_date': return ({required GenderContext context, required Object date}) {
				switch (context) {
					case GenderContext.male:
						return 'הוסף אירוע לתאריך ${date}';
					case GenderContext.female:
						return 'הוסיפי אירוע לתאריך ${date}';
				}
			};
			case 'event_description': return 'תיאור אירוע';
			case 'select_time': return 'בחירת שעה';
			case 'selected_time': return ({required Object time}) => 'שעה שנבחרה: ${time}';
			case 'add_question': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'הוסף שאלה';
					case GenderContext.female:
						return 'הוסיפי שאלה';
				}
			};
			case 'remove_question': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'הסר שאלה';
					case GenderContext.female:
						return 'הסירי שאלה';
				}
			};
			case 'num_of_questions': return ({required Object number}) => 'יש לך כרגע ${number} שאלות';
			case 'show_questions': return 'הצגת השאלות';
			case 'true_': return 'נכון';
			case 'false_': return 'לא נכון';
			case 'true_false_question': return 'שאלת נכון או לא נכון';
			case 'four_answers_question': return 'שאלת 4 תשובות';
			case 'question': return 'שאלה';
			case 'questions': return 'שאלות';
			case 'choose_currect_answer': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'בחר את התשובה הנכונה';
					case GenderContext.female:
						return 'בחרי את התשובה הנכונה';
				}
			};
			case 'add_image': return 'הוספת תמונה';
			case 'first_question': return 'שאלה ראשונה';
			case 'second_question': return 'שאלה שנייה';
			case 'third_question': return 'שאלה שלישית';
			case 'fourth_question': return 'שאלה רביעית';
			case 'required_fill_question': return 'חובה למלא את השאלה';
			case 'required_fill_all_answer': return 'חובה למלא את כל התשובות';
			case 'choose_question_delete': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'בחר את השאלות שתרצה למחוק';
					case GenderContext.female:
						return 'בחרי את השאלות שתרצי למחוק';
				}
			};
			case 'mark_least_one_question': return 'יש לסמן לפחות שאלה אחת';
			case 'no_questions_add': return 'לא הועלו שאלות עדיין';
			case 'quiz_game_partner_description': return ({required GenderContext context, required Object name, required Object number}) {
				switch (context) {
					case GenderContext.male:
						return 'ברוך הבא למשחק הטריוויה!\n${name} הכינה לך ${number} שאלות מסקרנות.\nשים ❤️ – אי אפשר לתקן תשובה שנתת, אז ענה בכיף אבל בזהירות 😉\nבהצלחה!';
					case GenderContext.female:
						return 'ברוכה הבאה למשחק הטריוויה!\n${name} הכין לך ${number} שאלות מסקרנות.\nשימי ❤️ – אי אפשר לתקן תשובה שנתת, אז תעני בכיף אבל בזהירות 😉\nבהצלחה!';
				}
			};
			case 'quiz_game_partner_no_questions': return ({required GenderContext context, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return '${name} לא העלתה עדיין שאלות';
					case GenderContext.female:
						return '${name} לא העלה עדיין שאלות';
				}
			};
			case 'click_here_start': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'לחץ כאן להתחלה';
					case GenderContext.female:
						return 'לחצי כאן להתחלה';
				}
			};
			case 'quiz_game_done': return 'משחק הטריוויה נגמר';
			case 'you_answer_from': return ({required Object answers, required Object questions}) => 'ענית נכון על ${answers} מתוך ${questions} שאלות';
			case 'choose_couple_profile_image': return 'בחר/י תמונת פרופיל זוגית שלכם';
			case 'memory_game': return 'משחק הזיכרון';
			case 'num_mistakes': return 'מספר טעויות';
			case 'score': return 'תוצאה';
			case 'game_over': return 'המשחק נגמר';
			case 'you_win': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'אתה ניצחת!';
					case GenderContext.female:
						return 'את ניצחת!';
				}
			};
			case 'upload_six_images': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'העלה 6 תמונות שישמשו למשחק הזיכרון';
					case GenderContext.female:
						return 'העלי 6 תמונות שישמשו למשחק הזיכרון';
				}
			};
			case 'upload_images': return 'העלאת תמונות';
			case 'confirm_images': return 'לאשר את התמונות?';
			case 'memory_game_description': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'בנה משחק זיכרון מגניב עם 6 תמונות משותפות שלכם!';
					case GenderContext.female:
						return 'בני משחק זיכרון מגניב עם 6 תמונות משותפות שלכם!';
				}
			};
			case 'memory_game_lock_title': return 'משחק הזיכרון נעול';
			case 'memory_game_lock_description': return ({required Object name}) => 'כדי לפתוח אותו אנא בקשו מ${name} הזדמנות חדשה';
			case 'memory_game_done': return ({required GenderContext context, required Object name, required Object score}) {
				switch (context) {
					case GenderContext.male:
						return '${name} סיימה את המשחק עם ניקוד: ${score}';
					case GenderContext.female:
						return '${name} סיים את המשחק עם ניקוד: ${score}';
				}
			};
			case 'open_new_memory_game': return 'פתיחת גישה למשחק חדש';
			case 'cant_upload_more_than': return ({required GenderContext context, required Object number}) {
				switch (context) {
					case GenderContext.male:
						return 'אתה לא יכול להעלות יותר מ-${number} קבצים';
					case GenderContext.female:
						return 'את לא יכולה להעלות יותר מ-${number} קבצים';
				}
			};
			case 'locked_category': return 'קטגוריה זו נעולה.\nכדי לפתוח אותה יש לשדרג את התוכנית שלך בהגדרות';
			case 'edit_title': return 'ערוך כותרת';
			case 'watch_login_success': return 'התחברת בהצלחה!\nאפשר לעבור לשעון';
			case 'login_via_phone': return 'התחבר באמצעות הטלפון';
			case 'wait_for_phone_login': return 'מחכה להתחברות דרך הטלפון';
			case 'login_successful': return 'התחברת בהצלחה!';
			case 'no_owner': return 'המשתמש לא משתמש ניהולי';
			case 'login_failed': return 'ההתחברות נכשלה';
			case 'please_open_app_in_phone': return 'פתח את האפליקציה בטלפון כדי להתחבר';
			case 'failed_send_login_request': return 'נכשל בשליחת בקשה לטלפון, נא נסה שנית';
			default: return null;
		}
	}
}
