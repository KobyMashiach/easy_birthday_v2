/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 239
///
/// Built on 2024-10-23 at 07:25 UTC

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
	String secret_dialog({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return 'ההפתעה נעולה עד ש${name} תיתן לך את ההרשאה לפתוח אותה!';
			case GenderContext.female:
				return 'ההפתעה נעולה עד ש${name} יתן לך את ההרשאה לפתוח אותה!';
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
	String get wish_list_lock_description => 'כדי לפתוח אותה אנא בקשו מהפרטנר שלכם הזדמנות חדשה';
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
			case 'secret_dialog': return ({required GenderContext context, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return 'ההפתעה נעולה עד ש${name} תיתן לך את ההרשאה לפתוח אותה!';
					case GenderContext.female:
						return 'ההפתעה נעולה עד ש${name} יתן לך את ההרשאה לפתוח אותה!';
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
			case 'wish_list_lock_description': return 'כדי לפתוח אותה אנא בקשו מהפרטנר שלכם הזדמנות חדשה';
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
			default: return null;
		}
	}
}
