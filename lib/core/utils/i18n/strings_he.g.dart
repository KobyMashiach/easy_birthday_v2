///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsHe with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsHe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.he,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <he>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	@override dynamic operator[](String key) => _meta.getTranslation(key);

	late final TranslationsHe _root = this; // ignore: unused_field

	@override 
	TranslationsHe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHe(meta: meta ?? this.$meta);

	// Translations
	@override String add_event_date({required GenderContext context, required Object date}) {
		switch (context) {
			case GenderContext.female:
				return 'הוסיפי אירוע לתאריך ${date}';
			case GenderContext.male:
				return 'הוסף אירוע לתאריך ${date}';
		}
	}
	@override String add_event({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'הוסיפי אירוע';
			case GenderContext.male:
				return 'הוסף אירוע';
		}
	}
	@override String get add_free_text => 'הוספת טקסט חופשי';
	@override String get add_image => 'הוספת תמונה';
	@override String get add_picture => 'הוסף תמונה';
	@override String get add_pictures => 'הוסף תמונות';
	@override String add_pictures_to({required Object title}) => 'הוסף תמונות ל: ${title}';
	@override String add_question({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'הוסיפי שאלה';
			case GenderContext.male:
				return 'הוסף שאלה';
		}
	}
	@override String add_quiz_to({required Object title}) => 'הוסף משחק טריוויה ל: ${title}';
	@override String get add_suprise => 'הוספת הפתעה';
	@override String get add_text => 'הוסף טקסט';
	@override String add_text_pictures_description({required Object title}) => 'הוסף טקסט ותמונות ל: ${title}';
	@override String get add_videos => 'הוסף סרטונים';
	@override String add_videos_to({required Object title}) => 'הוסף סרטונים ל: ${title}';
	@override String add({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'הוסיפי';
			case GenderContext.male:
				return 'הוסף';
		}
	}
	@override String get age => 'גיל';
	@override String get app_info => 'מידע על האפליקציה';
	@override String get app_name => 'שם האפליקציה';
	@override String get app_version => 'גרסת האפליקציה';
	@override String get back => 'חזור';
	@override String get birthday_calendar => 'לו"ז יום הולדת';
	@override String birthday_calendar_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'בואי לבנות את הלו"ז הכי מגניב וכיפי ליום ההולדת של בן הזוג שלך! תכנני לו יום מושלם מלא בהפתעות ופעילויות בלתי נשכחות.';
			case GenderContext.male:
				return 'בוא לבנות את הלו"ז הכי מגניב וכיפי ליום ההולדת של בת הזוג שלך! תכנן לה יום מושלם מלא בהפתעות ופעילויות בלתי נשכחות.';
		}
	}
	@override String get birthday_suprise => 'הפתעת יום הולדת';
	@override String birthday_suprise_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'בואי לבנות את הפתעת יום ההולדת, אבל ששששש... עד שתיפתחי את זה, זה יישאר נעול אצל בן הזוג שלך!';
			case GenderContext.male:
				return 'בוא לבנות את הפתעת יום ההולדת, אבל ששששש... עד שתפתח את זה, זה יישאר נעול אצל בת הזוג שלך!';
		}
	}
	@override String get build_app => 'בונה את האפליקציה';
	@override String get build_app_description => 'האפליקציה נבנית כרגע במיוחד בשבילך!';
	@override String get cancel => 'ביטול';
	@override String cant_upload_more_than({required GenderContext context, required Object number}) {
		switch (context) {
			case GenderContext.female:
				return 'את לא יכולה להעלות יותר מ-${number} קבצים';
			case GenderContext.male:
				return 'אתה לא יכול להעלות יותר מ-${number} קבצים';
		}
	}
	@override String get category_deleted => 'הקטגוריה הזו נמחקה';
	@override String celebrant({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'חוגגת';
			case GenderContext.male:
				return 'חוגג';
		}
	}
	@override String get change_color => 'שינוי צבע';
	@override String get change_gender => 'שינוי מין';
	@override String get change_language => 'שינוי שפה';
	@override String get change_password => 'שנה סיסמה';
	@override String get change_plan => 'שינוי תוכנית';
	@override String choose_category({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'בחרי קטגוריה';
			case GenderContext.male:
				return 'בחר קטגוריה';
		}
	}
	@override String choose_color({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'בחרי צבע מקשת צבעים';
			case GenderContext.male:
				return 'בחר צבע מקשת צבעים';
		}
	}
	@override String get choose_couple_profile_image => 'בחר/י תמונת פרופיל זוגית שלכם';
	@override String choose_currect_answer({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'בחרי את התשובה הנכונה';
			case GenderContext.male:
				return 'בחר את התשובה הנכונה';
		}
	}
	@override String get choose_gender => 'בחר מין';
	@override String get choose_language => 'בחר שפה';
	@override String get choose_own_gender => 'בחירת המין שלך';
	@override String get choose_partner_gender => 'בחירת מין הבן/בת זוג';
	@override String choose_question_delete({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'בחרי את השאלות שתרצי למחוק';
			case GenderContext.male:
				return 'בחר את השאלות שתרצה למחוק';
		}
	}
	@override String get click_here => 'לחץ כאן';
	@override String click_here_start({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'לחצי כאן להתחלה';
			case GenderContext.male:
				return 'לחץ כאן להתחלה';
		}
	}
	@override String get confirm_images => 'לאשר את התמונות?';
	@override String get contact_call => 'שיחה';
	@override String get contact_facebook => 'פייסבוק';
	@override String get contact_instagram => 'אינסטגרם';
	@override String get contact_message => 'הודעה';
	@override String get contact_method_title => 'בחר דרך התקשרות';
	@override String get contact_tiktok => 'טיקטוק';
	@override String get contact_us => 'יצירת קשר';
	@override String get contact_website => 'אתר אינטרנט';
	@override String get contact_whatsapp => 'וואטסאפ';
	@override String get continue_ => 'המשך';
	@override String get continue_no_change => 'המשך ללא שינוי';
	@override String get create_greeting_using_ai => 'צור ברכה באמצעות AI';
	@override String get current_plan => 'תוכנית נוכחית';
	@override String get date_of_birth => 'תאריך לידה';
	@override String get default_error => 'ההתחברות או ההרשמה נכשלו. בבקשה נסה שוב';
	@override String get delete => 'מחיקה';
	@override String get delete_account => 'מחיקת חשבון';
	@override String get delete_account_description => 'פעולה זו תמחק לצמיתות את החשבון, את הגישה של בן/בת הזוג ואת כל התמונות, הסרטונים וההודעות בהפתעה. לא ניתן לבטל פעולה זו.';
	@override String get delete_account_failed => 'לא הצלחנו למחוק את החשבון. כדאי לבדוק את החיבור ולנסות שוב.';
	@override String get delete_account_sure => 'למחוק את החשבון?';
	@override String get delete_wishes => 'מחיקת המשאלות';
	@override String delete_wishes_description({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'אם המשאלות לא עומדות בחוזה ניתן למחוק ואז ${name} יוכל למלא מחדש';
			case GenderContext.male:
				return 'אם המשאלות לא עומדות בחוזה ניתן למחוק ואז ${name} תוכל למלא מחדש';
		}
	}
	@override String get description => 'תיאור';
	@override String get display_result => 'הראה תוצאות';
	@override String get display_wishes => 'הצג משאלות';
	@override String get edit => 'עריכה';
	@override String get edit_greeting => 'עריכת הברכה';
	@override String get edit_title => 'ערוך כותרת';
	@override String get email => 'אימייל';
	@override String get email_exist => 'כתובת מייל קיימת במערכת';
	@override String get email_not_valid => 'כתובת המייל לא חוקית';
	@override String get empty => 'ריק';
	@override String get event_description => 'תיאור אירוע';
	@override String get event_id => 'מספר אירוע';
	@override String event_in_date({required Object date}) => 'אירועים בתאריך ${date}';
	@override String get exit => 'יציאה';
	@override String get exit_app_description => 'בטוח שרוצים לצאת מהאפליקציה?';
	@override String get exit_app_title => 'לצאת מהאפליקציה?';
	@override String get explanation_screen_text => 'ברוכים הבאים לאפליקציית ימי ההולדת הכי מגניבה שיש!\n\nאז מה עושים פה בעצם? פשוט מאוד! אתם ממלאים פרטים על עצמכם ועל בן/בת הזוג, ואז מתחילים לבחור איך לפנק אותם. יש לכם שלוש תוכניות: חינמית (Free), סטנדרט (Standard), ופרימיום (Platinum). בתוכנית החינמית יש אפשרות מוגבלת, ובסטנדרט ופרימיום – תוכלו לעוף עם הדמיון ולבחור כמה פריטים שתרצו!\n\nהנה כמה מהדברים שתוכלו לבחור:\n\n- כתיבת ברכה ב-AI – הברכה שתתאים בדיוק לכם.\n\n- אלבום תמונות משותף – לחוויות מרגשות.\n\n- אלבום סרטונים משותף – לרגעים בלתי נשכחים.\n\n- משחק טריוויה שאתם בונים – כי קצת כיף ואינטראקציה תמיד טובים.\n\n- לו"ז בלוח שנה משותף – כך שלא תשכחו את האירועים החשובים.\n\n- בניית דף הפתעת יום הולדת – דף מיוחד שנשאר נעול עד שתחליטו אחרת.\n\n- רשימת משאלות – אם תרצו לפרגן לשותפ/ה שלכם עם הדברים שהם חולמים עליהם.\n\n- משחק זיכרון עם תמונות משותפות – משחק שמאפשר לשמור את הזיכרונות היפים בצורה כיפית.\n\nהאפליקציה עדיין בפיתוח, ואנחנו עובדים במרץ להוסיף עוד פיצ\'רים מדליקים לכל התוכניות. יש לכם רעיון נוסף? נשמח לשמוע – אולי נגשים לכם אותו!\n\nבהצלחה ויאללה לחגוג! 🎉🎉🎉\n\n';
	@override String get explanation_screen_title => 'המדריך ליצירת הפתעה מושלמת';
	@override String get failed_send_login_request => 'נכשל בשליחת בקשה לטלפון, נא נסה שנית';
	@override String get false_ => 'לא נכון';
	@override String get female => 'נקבה';
	@override String get fill_all_fields => 'מלא את כל השדות בבקשה';
	@override String get fill_partner_details => 'מלא/י את הפרטים של הבן/בת זוג שלך';
	@override String get fill_your_details => 'מלא/י את הפרטים שלך';
	@override String get finish => 'סיום';
	@override String get first_name => 'שם פרטי';
	@override String get first_password => 'בחר סיסמה התחלתית, הבן/בת זוג יוכלו לשנות את הסיסמה\nאם השדה ישאר ריק הסיסמה תהיה 123456';
	@override String get first_question => 'שאלה ראשונה';
	@override String get first_register => 'הרשמה ראשונית';
	@override String get first_wish => 'משאלה ראשוונה';
	@override String get four_answers_question => 'שאלת 4 תשובות';
	@override String get fourth_question => 'שאלה רביעית';
	@override String get game_over => 'המשחק נגמר';
	@override String get gender => 'מין';
	@override String get generate_greeting => 'ליצור ברכה';
	@override String get generate_new_greeting => 'ליצור ברכה חדשה';
	@override String generate_text_description({required Object relationship, required Object name, required Object myName, required Object lineNumber, required Object wordsInLineNumber, required Object age}) => 'רשום ברכת יום הולדת ל${relationship}, השם הוא ${name}\nהשם שלי הוא: ${myName}\nמספר השורות של הברכה: ${lineNumber}\nמספר המילים בשורה:${wordsInLineNumber}\nהגיל  הוא ${age}';
	@override String get got_full_app => 'אז קיבלת אפליקציה שלמה רק בשביל זה';
	@override String greeter({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'ברוכה הבאה ${name}';
			case GenderContext.male:
				return 'ברוך הבא ${name}';
		}
	}
	@override String get greeting_before_edit => 'ברכה לפני עריכה';
	@override String greeting_first_login({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return '${name} הכין לך את ההפתעה הכי מגניבה שיש!\nאפליקציה שנבנתה במיוחד בשבילך, ליום ההולדת שלך!\nכאן תמצאי ברכה אישית מהלב,\nתמונות משותפות שלכם מכל הרגעים הכי יפים,\nועוד הפתעות שרק יחממו לך את הלב,\nכי מגיע לך את כל הטוב שבעולם!\nאז תתכונני, זו הולכת להיות חגיגה בלתי נשכחת!🎉🎉🎉';
			case GenderContext.male:
				return '${name} הכינה לך את ההפתעה הכי מגניבה שיש!\nאפליקציה שנבנתה במיוחד בשבילך, ליום ההולדת שלך!\nכאן תמצא ברכה אישית מהלב,\nתמונות משותפות שלכם מכל הרגעים הכי יפים,\nועוד הפתעות שרק יחממו לך את הלב,\nכי מגיע לך את כל הטוב שבעולם!\nאז תתכונן, זו הולכת להיות חגיגה בלתי נשכחת!🎉🎉🎉';
		}
	}
	@override String get greeting_notes => '* השמות שלכם ירשמו באופן אוטומטי\n* הגיל של הבן/בת זוג ירשם באופן אוטומטי\n* לאחר קבלת הברכה תוכלו לערוך אותה כמו שרק תרצו';
	@override String get have_account => 'יש משתמש';
	@override String get hide_password => 'הסתר סיסמה';
	@override String get home_screen => 'מסך בית';
	@override String indicating({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'מציינת';
			case GenderContext.male:
				return 'מציין';
		}
	}
	@override String get info => 'מידע';
	@override String get invalid_credential => 'כתובת המייל או הסיסמה לא נכונים, נא נסה שנית';
	@override String get lets_continue => 'בואו נתקדם!';
	@override String get lines_number => 'מספר שורות';
	@override String get lock => 'נעול';
	@override String get locked_category => 'קטגוריה זו נעולה.\nכדי לפתוח אותה יש לשדרג את התוכנית שלך בהגדרות';
	@override String get login => 'התחברות';
	@override String get login_failed => 'ההתחברות נכשלה';
	@override String get login_screen => 'מסך התחברות';
	@override String get login_successful => 'התחברת בהצלחה!';
	@override String get login_via_phone => 'התחבר באמצעות הטלפון';
	@override String get login_with_otp_code => 'התחבר עם קוד אימות';
	@override String get login_with_password => 'התחבר עם סיסמה';
	@override String get logout => 'התנתקות';
	@override String get male => 'זכר';
	@override String get mark_all => 'סמן הכל';
	@override String get mark_least_one_question => 'יש לסמן לפחות שאלה אחת';
	@override String married({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'אשתי';
			case GenderContext.male:
				return 'בעלי';
		}
	}
	@override String get max_words_in_line => 'מקסימום מילים בשורה';
	@override String get memory_game => 'משחק הזיכרון';
	@override String memory_game_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'בני משחק זיכרון מגניב עם 6 תמונות משותפות שלכם!';
			case GenderContext.male:
				return 'בנה משחק זיכרון מגניב עם 6 תמונות משותפות שלכם!';
		}
	}
	@override String memory_game_done({required GenderContext context, required Object name, required Object score}) {
		switch (context) {
			case GenderContext.female:
				return '${name} סיים את המשחק עם ניקוד: ${score}';
			case GenderContext.male:
				return '${name} סיימה את המשחק עם ניקוד: ${score}';
		}
	}
	@override String memory_game_lock_description({required Object name}) => 'כדי לפתוח אותו אנא בקשו מ${name} הזדמנות חדשה';
	@override String get memory_game_lock_title => 'משחק הזיכרון נעול';
	@override String get month => 'חודש';
	@override String get more_few_seconds => 'בעוד כמה שניות נוכל להתחיל לבנות את המתנה המושלמת!';
	@override String my_dear({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'היקרה';
			case GenderContext.male:
				return 'היקר';
		}
	}
	@override String get new_password => 'סיסמה חדשה';
	@override String get new_password_verification => 'אימות סיסמה חדשה';
	@override String get no => 'לא';
	@override String get no_account => 'אין משתמש';
	@override String get no_allow_text_empty => 'לא ניתן להשאיר טקסט ריק';
	@override String get no_category_added => 'לא הוספת קטגרויות לאירוע זה';
	@override String get no_owner => 'המשתמש לא משתמש ניהולי';
	@override String get no_questions_add => 'לא הועלו שאלות עדיין';
	@override String get no_required => 'לא חובה';
	@override String get no_wish_yet => 'אין עדיין משאלות';
	@override String get nothing_here_yet => 'אין כאן עדיין כלום';
	@override String get num_mistakes => 'מספר טעויות';
	@override String num_of_questions({required Object number}) => 'יש לך כרגע ${number} שאלות';
	@override String get ok => 'אישור';
	@override String get open_new_memory_game => 'פתיחת גישה למשחק חדש';
	@override String get operation_not_allowed => 'שגיאת שרת, אנא נסה שוב מאוחר יותר';
	@override String get otp_code => 'קוד אימות';
	@override String get otp_code_description => 'קיבלת הודעת SMS עם קוד אימות.\nנא לרשום אותו וללחוץ אישור';
	@override String get partner_info => 'מידע על הבן/בת זוג';
	@override String get partner_phone_is_yours => 'זה מספר הטלפון שלך. יש להזין את המספר של בן/בת הזוג';
	@override String get partner_phone_taken => 'מספר הטלפון הזה כבר שייך לחשבון אחר';
	@override String get password => 'סיסמה';
	@override String get password_dont_match => 'הסיסמאות לא תואמות';
	@override String get password_dont_match_description => '2 הסיסמאות שהזנת לא תואמות, נא נסה שוב';
	@override String get password_verification => 'אימות סיסמה';
	@override String get phone => 'טלפון';
	@override String get phone_exist => 'טלפון קיים במערכת';
	@override String get phone_exist_description => 'מספר הטלפון קיים במערכת שלנו, עבור למסך ההתחברות ונסה שנית';
	@override String get phone_not_exist_system => 'מספר הטלפון לא קיים במערכת';
	@override String get phone_not_valid => 'מספר הטלפון לא חוקי';
	@override String get phone_not_valid_description => 'כנראה שטעית במספר הטלפון, נא נסה שנית';
	@override String get phone_verification => 'אימות טלפון';
	@override String get pick_color => 'בחר צבע';
	@override String get pick_date_range => 'בחר טווח תאריכים';
	@override String get pictures => 'תמונות';
	@override String pictures_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'הוסיפי כמה תמונות משותפות שימסו לכם את הלב';
			case GenderContext.male:
				return 'הוסף כמה תמונות משותפות שימסו לכם את הלב';
		}
	}
	@override String get plan_feature_calendar => 'בניית לו"ז ליום הולדת בלוח שנה משותף';
	@override String get plan_feature_greeting => 'טקסט לברכה מרגשת';
	@override String get plan_feature_greeting_ai => 'טקסט לברכה מרגשת - ניתן להשתמש בAI';
	@override String plan_feature_images({required Object limit}) => 'גלריית תמונות (עד ${limit} תמונות)';
	@override String get plan_feature_memory_game => 'משחק הזיכרון עם תמונות משותפות שלכם!';
	@override String get plan_feature_no_ads => 'ללא פרסומות';
	@override String get plan_feature_surprise => 'הפתעת יום הולדת - מסך נעול עד שתחליטו שאתם מוכנים';
	@override String get plan_feature_trivia => 'משחק טריוויה כיפי ומאתגר';
	@override String plan_feature_videos({required Object limit}) => 'גלריית סרטונים (עד ${limit} סרטונים)';
	@override String get plan_feature_wishes => 'רשימת משאלות - תן גישה לפרטנר שלך לבקש 3 משאלות';
	@override String get plan_free => 'חינמית';
	@override String get plan_platinum => 'פלטינום';
	@override String get plan_standard => 'סטנדרט';
	@override String get please_choose_category => 'בחר קטגוריה בבקשה';
	@override String get please_open_app_in_phone => 'פתח את האפליקציה בטלפון כדי להתחבר';
	@override String please_read_contract({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'חוזה ש${name} כתב במיוחד בשבילך';
			case GenderContext.male:
				return 'חוזה ש${name} כתבה במיוחד בשבילך';
		}
	}
	@override String get purchase_failed => 'לא הצלחנו להשלים את הרכישה. נסו שוב';
	@override String get purchase_pending => 'הרכישה ממתינה לאישור. התוכנית תתעדכן ברגע שהיא תאושר';
	@override String get purchase_saved_for_later => 'הרכישה בוצעה! התוכנית תתעדכן בקרוב';
	@override String get question => 'שאלה';
	@override String get questions => 'שאלות';
	@override String get quiz_game => 'משחק טריוויה';
	@override String quiz_game_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'יאללה, תבני משחק טריוויה שיבדוק אם אתם יודעים בכלל מי זה מי!';
			case GenderContext.male:
				return 'יאללה, תבנה משחק טריוויה שיבדוק אם אתם יודעים בכלל מי זה מי!';
		}
	}
	@override String get quiz_game_done => 'משחק הטריוויה נגמר';
	@override String quiz_game_partner_description({required GenderContext context, required Object name, required Object number}) {
		switch (context) {
			case GenderContext.female:
				return 'ברוכה הבאה למשחק הטריוויה!\n${name} הכין לך ${number} שאלות מסקרנות.\nשימי ❤️ – אי אפשר לתקן תשובה שנתת, אז תעני בכיף אבל בזהירות 😉\nבהצלחה!';
			case GenderContext.male:
				return 'ברוך הבא למשחק הטריוויה!\n${name} הכינה לך ${number} שאלות מסקרנות.\nשים ❤️ – אי אפשר לתקן תשובה שנתת, אז ענה בכיף אבל בזהירות 😉\nבהצלחה!';
		}
	}
	@override String quiz_game_partner_no_questions({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return '${name} לא העלה עדיין שאלות';
			case GenderContext.male:
				return '${name} לא העלתה עדיין שאלות';
		}
	}
	@override String get rate_app => 'דרג את האפליקציה';
	@override String get recommand_drak_colors => 'מומלץ צבעים כהים';
	@override String get recommended_colors => 'צבעים מומלצים';
	@override String get register => 'הרשמה';
	@override String get register_screen => 'מסך הרשמה';
	@override String get relationship => 'מערכת יחסים';
	@override String remove_question({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'הסירי שאלה';
			case GenderContext.male:
				return 'הסר שאלה';
		}
	}
	@override String remove({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'הסירי';
			case GenderContext.male:
				return 'הסר';
		}
	}
	@override String get required_fill_all_answer => 'חובה למלא את כל התשובות';
	@override String get required_fill_question => 'חובה למלא את השאלה';
	@override String get save => 'שמור';
	@override String get save_and_lock => 'שמור ונעל';
	@override String get score => 'תוצאה';
	@override String get second_question => 'שאלה שנייה';
	@override String get second_wish => 'משאלה שנייה';
	@override String secret_dialog({required GenderContext context, required Object categoryName, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return '"${categoryName}" נעול עד ש${name} יתן לך את ההרשאה לפתוח אותה!';
			case GenderContext.male:
				return '"${categoryName}" נעול עד ש${name} תיתן לך את ההרשאה לפתוח אותה!';
		}
	}
	@override String get select_time => 'בחירת שעה';
	@override String get selected_color => 'צבע נבחר';
	@override String selected_time({required Object time}) => 'שעה שנבחרה: ${time}';
	@override String selected({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'נבחרה';
			case GenderContext.male:
				return 'נבחר';
		}
	}
	@override String get send_again => 'שלח שוב';
	@override String get send_code => 'שלח קוד';
	@override String get settings => 'הגדרות';
	@override String get share_app => 'שיתוף האפליקציה';
	@override String share_app_message({required Object url}) => 'צרו אפליקציית יום הולדת אישית למישהו שאתם אוהבים עם Easy Birthday 🎉\n${url}';
	@override String get short_password => 'סיסמה קצרה מידי';
	@override String get short_password_description => 'הסיסמה צריכה להיות 8 תווים לפחות';
	@override String get show_password => 'הצג סיסמה';
	@override String skip({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'דלגי';
			case GenderContext.male:
				return 'דלג';
		}
	}
	@override String get something_went_wrong => 'משהו השתבש. נסו שוב';
	@override String get soon => 'בקרוב';
	@override String get soul_mate => 'נפש תאומה';
	@override String special_age({required Object age}) => 'גיל ${age} זה גיל מיוחד';
	@override String spouse({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'בת זוגתי';
			case GenderContext.male:
				return 'בן זוגי';
		}
	}
	@override String suprise_screen_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'הוסיפי טקסט או תמונות, שחקי עם הסדר ביניהם וצרי את ההפתעה המושלמת!\nההפתעה תישאר סודית עד שתחליטי שהיא מוכנה לבן הזוג שלך!';
			case GenderContext.male:
				return 'הוסף טקסט או תמונות, שחק עם הסדר ביניהם ותיצור את ההפתעה המושלמת!\nההפתעה תישאר סודית עד שתחליט שהיא מוכנה לבת הזוג שלך!';
		}
	}
	@override String sure_delete_name({required GenderContext context, required Object text}) {
		switch (context) {
			case GenderContext.female:
				return 'את בטוחה שאת רוצה למחוק את ${text}?';
			case GenderContext.male:
				return 'אתה בטוח שאתה רוצה למחוק את ${text}?';
		}
	}
	@override String sure_delete({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'את בטוחה שאת רוצה למחוק את האירוע הזה?';
			case GenderContext.male:
				return 'אתה בטוח שאתה רוצה למחוק את האירוע הזה?';
		}
	}
	@override String sure_logout({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'את בטוחה שאת רוצה להתנתק?';
			case GenderContext.male:
				return 'אתה בטוח שאתה רוצה להתנתק?';
		}
	}
	@override String get text => 'טקסט';
	@override String get text_appear_required => 'נא למלא את הטקסט';
	@override String text_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'יאללה, תשלפי ברכה מהלב או כתבי איזה טקסט קורע שתרצי!';
			case GenderContext.male:
				return 'יאללה, תשלוף ברכה מהלב או כתוב איזה טקסט קורע שתרצה!';
		}
	}
	@override String get the_image => 'התמונה';
	@override String get the_text => 'הטקסט';
	@override String get third_question => 'שאלה שלישית';
	@override String get third_wish => 'משאלה שלישית';
	@override String get title => 'כותרת';
	@override String get title_appear_category => 'הכותרת שתופיע לקטגוריה זו';
	@override String get title_appear_required => 'נא למלא את הכותרת';
	@override String get too_many_requests => 'יותר מדי בקשות להתחבר לחשבון זה';
	@override String get true_ => 'נכון';
	@override String get true_false_question => 'שאלת נכון או לא נכון';
	@override String get two_weeks => 'שבועיים';
	@override String get unlock => 'לא נעול';
	@override String upload_files_count({required Object file, required Object files}) => 'הועלו ${file} מתוך ${files} קבצים';
	@override String get upload_images => 'העלאת תמונות';
	@override String upload_six_images({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'העלי 6 תמונות שישמשו למשחק הזיכרון';
			case GenderContext.male:
				return 'העלה 6 תמונות שישמשו למשחק הזיכרון';
		}
	}
	@override String get use_emojis => 'שימוש באימוג׳ים';
	@override String get user_disabled => 'משתמש מושבת';
	@override String get user_not_found => 'לא נמצאה כתובת המייל הזו, נסה שוב';
	@override String get videos => 'סרטונים';
	@override String videos_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'הוסיפי סרטוני יוטיוב שמזכירים לכם כמה אתם חמודים ביחד';
			case GenderContext.male:
				return 'הוסף סרטוני יוטיוב שמזכירים לכם כמה אתם חמודים ביחד';
		}
	}
	@override String get wait_for_phone_login => 'מחכה להתחברות דרך הטלפון';
	@override String get watch_login_success => 'התחברת בהצלחה!\nאפשר לעבור לשעון';
	@override String get we_use => 'אנחנו נשתמש בטקסטים שבחרתם כדי לבנות את האפליקציה באופן אישי';
	@override String get week => 'שבוע';
	@override String get welcome => 'ברוכ/ה הבאה!';
	@override String wish_list_lock_description({required Object name}) => 'כדי לפתוח אותה אנא בקשו מ${name} הזדמנות חדשה';
	@override String get wish_list_lock_title => 'רשימת המשאלות נעולה';
	@override String get wishes_list => 'רשימת משאלות';
	@override String wishes_list_description({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'הוספי אפשרות ל${name} לבחור 3 משאלות:\nרשמי לו "חוזה" קטן, ככה שהוא לא יוכל להגזים!';
			case GenderContext.male:
				return 'הוסף אפשרות ל${name} לבחור 3 משאלות:\nרשום לה "חוזה" קטן, ככה שהיא לא תוכל להגזים!';
		}
	}
	@override String write_calendar_time_to({required Object title}) => 'רשום לו"ז ל: ${title}';
	@override String get write_contract => 'רשום חוזה';
	@override String write_contract_to({required Object title}) => 'רשום חוזה ל: ${title}';
	@override String get write_text => 'רשום טקסט';
	@override String write_text_to({required Object title}) => 'רשום טקסט ל: ${title}';
	@override String get wrong_password => 'הסיסמה לא נכונה, נא נסה שנית';
	@override String get yes => 'כן';
	@override String you_answer_from({required Object answers, required Object questions}) => 'ענית נכון על ${answers} מתוך ${questions} שאלות';
	@override String you_win({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'את ניצחת!';
			case GenderContext.male:
				return 'אתה ניצחת!';
		}
	}
}

/// The flat map containing all translations for locale <he>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsHe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'add_event_date' => ({required GenderContext context, required Object date}) { switch (context) { case GenderContext.female: return 'הוסיפי אירוע לתאריך ${date}'; case GenderContext.male: return 'הוסף אירוע לתאריך ${date}'; } }, 
			'add_event' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'הוסיפי אירוע'; case GenderContext.male: return 'הוסף אירוע'; } }, 
			'add_free_text' => 'הוספת טקסט חופשי',
			'add_image' => 'הוספת תמונה',
			'add_picture' => 'הוסף תמונה',
			'add_pictures' => 'הוסף תמונות',
			'add_pictures_to' => ({required Object title}) => 'הוסף תמונות ל: ${title}',
			'add_question' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'הוסיפי שאלה'; case GenderContext.male: return 'הוסף שאלה'; } }, 
			'add_quiz_to' => ({required Object title}) => 'הוסף משחק טריוויה ל: ${title}',
			'add_suprise' => 'הוספת הפתעה',
			'add_text' => 'הוסף טקסט',
			'add_text_pictures_description' => ({required Object title}) => 'הוסף טקסט ותמונות ל: ${title}',
			'add_videos' => 'הוסף סרטונים',
			'add_videos_to' => ({required Object title}) => 'הוסף סרטונים ל: ${title}',
			'add' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'הוסיפי'; case GenderContext.male: return 'הוסף'; } }, 
			'age' => 'גיל',
			'app_info' => 'מידע על האפליקציה',
			'app_name' => 'שם האפליקציה',
			'app_version' => 'גרסת האפליקציה',
			'back' => 'חזור',
			'birthday_calendar' => 'לו"ז יום הולדת',
			'birthday_calendar_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'בואי לבנות את הלו"ז הכי מגניב וכיפי ליום ההולדת של בן הזוג שלך! תכנני לו יום מושלם מלא בהפתעות ופעילויות בלתי נשכחות.'; case GenderContext.male: return 'בוא לבנות את הלו"ז הכי מגניב וכיפי ליום ההולדת של בת הזוג שלך! תכנן לה יום מושלם מלא בהפתעות ופעילויות בלתי נשכחות.'; } }, 
			'birthday_suprise' => 'הפתעת יום הולדת',
			'birthday_suprise_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'בואי לבנות את הפתעת יום ההולדת, אבל ששששש... עד שתיפתחי את זה, זה יישאר נעול אצל בן הזוג שלך!'; case GenderContext.male: return 'בוא לבנות את הפתעת יום ההולדת, אבל ששששש... עד שתפתח את זה, זה יישאר נעול אצל בת הזוג שלך!'; } }, 
			'build_app' => 'בונה את האפליקציה',
			'build_app_description' => 'האפליקציה נבנית כרגע במיוחד בשבילך!',
			'cancel' => 'ביטול',
			'cant_upload_more_than' => ({required GenderContext context, required Object number}) { switch (context) { case GenderContext.female: return 'את לא יכולה להעלות יותר מ-${number} קבצים'; case GenderContext.male: return 'אתה לא יכול להעלות יותר מ-${number} קבצים'; } }, 
			'category_deleted' => 'הקטגוריה הזו נמחקה',
			'celebrant' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'חוגגת'; case GenderContext.male: return 'חוגג'; } }, 
			'change_color' => 'שינוי צבע',
			'change_gender' => 'שינוי מין',
			'change_language' => 'שינוי שפה',
			'change_password' => 'שנה סיסמה',
			'change_plan' => 'שינוי תוכנית',
			'choose_category' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'בחרי קטגוריה'; case GenderContext.male: return 'בחר קטגוריה'; } }, 
			'choose_color' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'בחרי צבע מקשת צבעים'; case GenderContext.male: return 'בחר צבע מקשת צבעים'; } }, 
			'choose_couple_profile_image' => 'בחר/י תמונת פרופיל זוגית שלכם',
			'choose_currect_answer' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'בחרי את התשובה הנכונה'; case GenderContext.male: return 'בחר את התשובה הנכונה'; } }, 
			'choose_gender' => 'בחר מין',
			'choose_language' => 'בחר שפה',
			'choose_own_gender' => 'בחירת המין שלך',
			'choose_partner_gender' => 'בחירת מין הבן/בת זוג',
			'choose_question_delete' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'בחרי את השאלות שתרצי למחוק'; case GenderContext.male: return 'בחר את השאלות שתרצה למחוק'; } }, 
			'click_here' => 'לחץ כאן',
			'click_here_start' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'לחצי כאן להתחלה'; case GenderContext.male: return 'לחץ כאן להתחלה'; } }, 
			'confirm_images' => 'לאשר את התמונות?',
			'contact_call' => 'שיחה',
			'contact_facebook' => 'פייסבוק',
			'contact_instagram' => 'אינסטגרם',
			'contact_message' => 'הודעה',
			'contact_method_title' => 'בחר דרך התקשרות',
			'contact_tiktok' => 'טיקטוק',
			'contact_us' => 'יצירת קשר',
			'contact_website' => 'אתר אינטרנט',
			'contact_whatsapp' => 'וואטסאפ',
			'continue_' => 'המשך',
			'continue_no_change' => 'המשך ללא שינוי',
			'create_greeting_using_ai' => 'צור ברכה באמצעות AI',
			'current_plan' => 'תוכנית נוכחית',
			'date_of_birth' => 'תאריך לידה',
			'default_error' => 'ההתחברות או ההרשמה נכשלו. בבקשה נסה שוב',
			'delete' => 'מחיקה',
			'delete_account' => 'מחיקת חשבון',
			'delete_account_description' => 'פעולה זו תמחק לצמיתות את החשבון, את הגישה של בן/בת הזוג ואת כל התמונות, הסרטונים וההודעות בהפתעה. לא ניתן לבטל פעולה זו.',
			'delete_account_failed' => 'לא הצלחנו למחוק את החשבון. כדאי לבדוק את החיבור ולנסות שוב.',
			'delete_account_sure' => 'למחוק את החשבון?',
			'delete_wishes' => 'מחיקת המשאלות',
			'delete_wishes_description' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'אם המשאלות לא עומדות בחוזה ניתן למחוק ואז ${name} יוכל למלא מחדש'; case GenderContext.male: return 'אם המשאלות לא עומדות בחוזה ניתן למחוק ואז ${name} תוכל למלא מחדש'; } }, 
			'description' => 'תיאור',
			'display_result' => 'הראה תוצאות',
			'display_wishes' => 'הצג משאלות',
			'edit' => 'עריכה',
			'edit_greeting' => 'עריכת הברכה',
			'edit_title' => 'ערוך כותרת',
			'email' => 'אימייל',
			'email_exist' => 'כתובת מייל קיימת במערכת',
			'email_not_valid' => 'כתובת המייל לא חוקית',
			'empty' => 'ריק',
			'event_description' => 'תיאור אירוע',
			'event_id' => 'מספר אירוע',
			'event_in_date' => ({required Object date}) => 'אירועים בתאריך ${date}',
			'exit' => 'יציאה',
			'exit_app_description' => 'בטוח שרוצים לצאת מהאפליקציה?',
			'exit_app_title' => 'לצאת מהאפליקציה?',
			'explanation_screen_text' => 'ברוכים הבאים לאפליקציית ימי ההולדת הכי מגניבה שיש!\n\nאז מה עושים פה בעצם? פשוט מאוד! אתם ממלאים פרטים על עצמכם ועל בן/בת הזוג, ואז מתחילים לבחור איך לפנק אותם. יש לכם שלוש תוכניות: חינמית (Free), סטנדרט (Standard), ופרימיום (Platinum). בתוכנית החינמית יש אפשרות מוגבלת, ובסטנדרט ופרימיום – תוכלו לעוף עם הדמיון ולבחור כמה פריטים שתרצו!\n\nהנה כמה מהדברים שתוכלו לבחור:\n\n- כתיבת ברכה ב-AI – הברכה שתתאים בדיוק לכם.\n\n- אלבום תמונות משותף – לחוויות מרגשות.\n\n- אלבום סרטונים משותף – לרגעים בלתי נשכחים.\n\n- משחק טריוויה שאתם בונים – כי קצת כיף ואינטראקציה תמיד טובים.\n\n- לו"ז בלוח שנה משותף – כך שלא תשכחו את האירועים החשובים.\n\n- בניית דף הפתעת יום הולדת – דף מיוחד שנשאר נעול עד שתחליטו אחרת.\n\n- רשימת משאלות – אם תרצו לפרגן לשותפ/ה שלכם עם הדברים שהם חולמים עליהם.\n\n- משחק זיכרון עם תמונות משותפות – משחק שמאפשר לשמור את הזיכרונות היפים בצורה כיפית.\n\nהאפליקציה עדיין בפיתוח, ואנחנו עובדים במרץ להוסיף עוד פיצ\'רים מדליקים לכל התוכניות. יש לכם רעיון נוסף? נשמח לשמוע – אולי נגשים לכם אותו!\n\nבהצלחה ויאללה לחגוג! 🎉🎉🎉\n\n',
			'explanation_screen_title' => 'המדריך ליצירת הפתעה מושלמת',
			'failed_send_login_request' => 'נכשל בשליחת בקשה לטלפון, נא נסה שנית',
			'false_' => 'לא נכון',
			'female' => 'נקבה',
			'fill_all_fields' => 'מלא את כל השדות בבקשה',
			'fill_partner_details' => 'מלא/י את הפרטים של הבן/בת זוג שלך',
			'fill_your_details' => 'מלא/י את הפרטים שלך',
			'finish' => 'סיום',
			'first_name' => 'שם פרטי',
			'first_password' => 'בחר סיסמה התחלתית, הבן/בת זוג יוכלו לשנות את הסיסמה\nאם השדה ישאר ריק הסיסמה תהיה 123456',
			'first_question' => 'שאלה ראשונה',
			'first_register' => 'הרשמה ראשונית',
			'first_wish' => 'משאלה ראשוונה',
			'four_answers_question' => 'שאלת 4 תשובות',
			'fourth_question' => 'שאלה רביעית',
			'game_over' => 'המשחק נגמר',
			'gender' => 'מין',
			'generate_greeting' => 'ליצור ברכה',
			'generate_new_greeting' => 'ליצור ברכה חדשה',
			'generate_text_description' => ({required Object relationship, required Object name, required Object myName, required Object lineNumber, required Object wordsInLineNumber, required Object age}) => 'רשום ברכת יום הולדת ל${relationship}, השם הוא ${name}\nהשם שלי הוא: ${myName}\nמספר השורות של הברכה: ${lineNumber}\nמספר המילים בשורה:${wordsInLineNumber}\nהגיל  הוא ${age}',
			'got_full_app' => 'אז קיבלת אפליקציה שלמה רק בשביל זה',
			'greeter' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'ברוכה הבאה ${name}'; case GenderContext.male: return 'ברוך הבא ${name}'; } }, 
			'greeting_before_edit' => 'ברכה לפני עריכה',
			'greeting_first_login' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return '${name} הכין לך את ההפתעה הכי מגניבה שיש!\nאפליקציה שנבנתה במיוחד בשבילך, ליום ההולדת שלך!\nכאן תמצאי ברכה אישית מהלב,\nתמונות משותפות שלכם מכל הרגעים הכי יפים,\nועוד הפתעות שרק יחממו לך את הלב,\nכי מגיע לך את כל הטוב שבעולם!\nאז תתכונני, זו הולכת להיות חגיגה בלתי נשכחת!🎉🎉🎉'; case GenderContext.male: return '${name} הכינה לך את ההפתעה הכי מגניבה שיש!\nאפליקציה שנבנתה במיוחד בשבילך, ליום ההולדת שלך!\nכאן תמצא ברכה אישית מהלב,\nתמונות משותפות שלכם מכל הרגעים הכי יפים,\nועוד הפתעות שרק יחממו לך את הלב,\nכי מגיע לך את כל הטוב שבעולם!\nאז תתכונן, זו הולכת להיות חגיגה בלתי נשכחת!🎉🎉🎉'; } }, 
			'greeting_notes' => '* השמות שלכם ירשמו באופן אוטומטי\n* הגיל של הבן/בת זוג ירשם באופן אוטומטי\n* לאחר קבלת הברכה תוכלו לערוך אותה כמו שרק תרצו',
			'have_account' => 'יש משתמש',
			'hide_password' => 'הסתר סיסמה',
			'home_screen' => 'מסך בית',
			'indicating' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'מציינת'; case GenderContext.male: return 'מציין'; } }, 
			'info' => 'מידע',
			'invalid_credential' => 'כתובת המייל או הסיסמה לא נכונים, נא נסה שנית',
			'lets_continue' => 'בואו נתקדם!',
			'lines_number' => 'מספר שורות',
			'lock' => 'נעול',
			'locked_category' => 'קטגוריה זו נעולה.\nכדי לפתוח אותה יש לשדרג את התוכנית שלך בהגדרות',
			'login' => 'התחברות',
			'login_failed' => 'ההתחברות נכשלה',
			'login_screen' => 'מסך התחברות',
			'login_successful' => 'התחברת בהצלחה!',
			'login_via_phone' => 'התחבר באמצעות הטלפון',
			'login_with_otp_code' => 'התחבר עם קוד אימות',
			'login_with_password' => 'התחבר עם סיסמה',
			'logout' => 'התנתקות',
			'male' => 'זכר',
			'mark_all' => 'סמן הכל',
			'mark_least_one_question' => 'יש לסמן לפחות שאלה אחת',
			'married' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'אשתי'; case GenderContext.male: return 'בעלי'; } }, 
			'max_words_in_line' => 'מקסימום מילים בשורה',
			'memory_game' => 'משחק הזיכרון',
			'memory_game_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'בני משחק זיכרון מגניב עם 6 תמונות משותפות שלכם!'; case GenderContext.male: return 'בנה משחק זיכרון מגניב עם 6 תמונות משותפות שלכם!'; } }, 
			'memory_game_done' => ({required GenderContext context, required Object name, required Object score}) { switch (context) { case GenderContext.female: return '${name} סיים את המשחק עם ניקוד: ${score}'; case GenderContext.male: return '${name} סיימה את המשחק עם ניקוד: ${score}'; } }, 
			'memory_game_lock_description' => ({required Object name}) => 'כדי לפתוח אותו אנא בקשו מ${name} הזדמנות חדשה',
			'memory_game_lock_title' => 'משחק הזיכרון נעול',
			'month' => 'חודש',
			'more_few_seconds' => 'בעוד כמה שניות נוכל להתחיל לבנות את המתנה המושלמת!',
			'my_dear' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'היקרה'; case GenderContext.male: return 'היקר'; } }, 
			'new_password' => 'סיסמה חדשה',
			'new_password_verification' => 'אימות סיסמה חדשה',
			'no' => 'לא',
			'no_account' => 'אין משתמש',
			'no_allow_text_empty' => 'לא ניתן להשאיר טקסט ריק',
			'no_category_added' => 'לא הוספת קטגרויות לאירוע זה',
			'no_owner' => 'המשתמש לא משתמש ניהולי',
			'no_questions_add' => 'לא הועלו שאלות עדיין',
			'no_required' => 'לא חובה',
			'no_wish_yet' => 'אין עדיין משאלות',
			'nothing_here_yet' => 'אין כאן עדיין כלום',
			'num_mistakes' => 'מספר טעויות',
			'num_of_questions' => ({required Object number}) => 'יש לך כרגע ${number} שאלות',
			'ok' => 'אישור',
			'open_new_memory_game' => 'פתיחת גישה למשחק חדש',
			'operation_not_allowed' => 'שגיאת שרת, אנא נסה שוב מאוחר יותר',
			'otp_code' => 'קוד אימות',
			'otp_code_description' => 'קיבלת הודעת SMS עם קוד אימות.\nנא לרשום אותו וללחוץ אישור',
			'partner_info' => 'מידע על הבן/בת זוג',
			'partner_phone_is_yours' => 'זה מספר הטלפון שלך. יש להזין את המספר של בן/בת הזוג',
			'partner_phone_taken' => 'מספר הטלפון הזה כבר שייך לחשבון אחר',
			'password' => 'סיסמה',
			'password_dont_match' => 'הסיסמאות לא תואמות',
			'password_dont_match_description' => '2 הסיסמאות שהזנת לא תואמות, נא נסה שוב',
			'password_verification' => 'אימות סיסמה',
			'phone' => 'טלפון',
			'phone_exist' => 'טלפון קיים במערכת',
			'phone_exist_description' => 'מספר הטלפון קיים במערכת שלנו, עבור למסך ההתחברות ונסה שנית',
			'phone_not_exist_system' => 'מספר הטלפון לא קיים במערכת',
			'phone_not_valid' => 'מספר הטלפון לא חוקי',
			'phone_not_valid_description' => 'כנראה שטעית במספר הטלפון, נא נסה שנית',
			'phone_verification' => 'אימות טלפון',
			'pick_color' => 'בחר צבע',
			'pick_date_range' => 'בחר טווח תאריכים',
			'pictures' => 'תמונות',
			'pictures_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'הוסיפי כמה תמונות משותפות שימסו לכם את הלב'; case GenderContext.male: return 'הוסף כמה תמונות משותפות שימסו לכם את הלב'; } }, 
			'plan_feature_calendar' => 'בניית לו"ז ליום הולדת בלוח שנה משותף',
			'plan_feature_greeting' => 'טקסט לברכה מרגשת',
			'plan_feature_greeting_ai' => 'טקסט לברכה מרגשת - ניתן להשתמש בAI',
			'plan_feature_images' => ({required Object limit}) => 'גלריית תמונות (עד ${limit} תמונות)',
			'plan_feature_memory_game' => 'משחק הזיכרון עם תמונות משותפות שלכם!',
			'plan_feature_no_ads' => 'ללא פרסומות',
			'plan_feature_surprise' => 'הפתעת יום הולדת - מסך נעול עד שתחליטו שאתם מוכנים',
			'plan_feature_trivia' => 'משחק טריוויה כיפי ומאתגר',
			'plan_feature_videos' => ({required Object limit}) => 'גלריית סרטונים (עד ${limit} סרטונים)',
			'plan_feature_wishes' => 'רשימת משאלות - תן גישה לפרטנר שלך לבקש 3 משאלות',
			'plan_free' => 'חינמית',
			'plan_platinum' => 'פלטינום',
			'plan_standard' => 'סטנדרט',
			'please_choose_category' => 'בחר קטגוריה בבקשה',
			'please_open_app_in_phone' => 'פתח את האפליקציה בטלפון כדי להתחבר',
			'please_read_contract' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'חוזה ש${name} כתב במיוחד בשבילך'; case GenderContext.male: return 'חוזה ש${name} כתבה במיוחד בשבילך'; } }, 
			'purchase_failed' => 'לא הצלחנו להשלים את הרכישה. נסו שוב',
			'purchase_pending' => 'הרכישה ממתינה לאישור. התוכנית תתעדכן ברגע שהיא תאושר',
			'purchase_saved_for_later' => 'הרכישה בוצעה! התוכנית תתעדכן בקרוב',
			'question' => 'שאלה',
			'questions' => 'שאלות',
			'quiz_game' => 'משחק טריוויה',
			'quiz_game_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'יאללה, תבני משחק טריוויה שיבדוק אם אתם יודעים בכלל מי זה מי!'; case GenderContext.male: return 'יאללה, תבנה משחק טריוויה שיבדוק אם אתם יודעים בכלל מי זה מי!'; } }, 
			'quiz_game_done' => 'משחק הטריוויה נגמר',
			'quiz_game_partner_description' => ({required GenderContext context, required Object name, required Object number}) { switch (context) { case GenderContext.female: return 'ברוכה הבאה למשחק הטריוויה!\n${name} הכין לך ${number} שאלות מסקרנות.\nשימי ❤️ – אי אפשר לתקן תשובה שנתת, אז תעני בכיף אבל בזהירות 😉\nבהצלחה!'; case GenderContext.male: return 'ברוך הבא למשחק הטריוויה!\n${name} הכינה לך ${number} שאלות מסקרנות.\nשים ❤️ – אי אפשר לתקן תשובה שנתת, אז ענה בכיף אבל בזהירות 😉\nבהצלחה!'; } }, 
			'quiz_game_partner_no_questions' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return '${name} לא העלה עדיין שאלות'; case GenderContext.male: return '${name} לא העלתה עדיין שאלות'; } }, 
			'rate_app' => 'דרג את האפליקציה',
			'recommand_drak_colors' => 'מומלץ צבעים כהים',
			'recommended_colors' => 'צבעים מומלצים',
			'register' => 'הרשמה',
			'register_screen' => 'מסך הרשמה',
			'relationship' => 'מערכת יחסים',
			'remove_question' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'הסירי שאלה'; case GenderContext.male: return 'הסר שאלה'; } }, 
			'remove' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'הסירי'; case GenderContext.male: return 'הסר'; } }, 
			'required_fill_all_answer' => 'חובה למלא את כל התשובות',
			'required_fill_question' => 'חובה למלא את השאלה',
			'save' => 'שמור',
			'save_and_lock' => 'שמור ונעל',
			'score' => 'תוצאה',
			'second_question' => 'שאלה שנייה',
			'second_wish' => 'משאלה שנייה',
			'secret_dialog' => ({required GenderContext context, required Object categoryName, required Object name}) { switch (context) { case GenderContext.female: return '"${categoryName}" נעול עד ש${name} יתן לך את ההרשאה לפתוח אותה!'; case GenderContext.male: return '"${categoryName}" נעול עד ש${name} תיתן לך את ההרשאה לפתוח אותה!'; } }, 
			'select_time' => 'בחירת שעה',
			'selected_color' => 'צבע נבחר',
			'selected_time' => ({required Object time}) => 'שעה שנבחרה: ${time}',
			'selected' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'נבחרה'; case GenderContext.male: return 'נבחר'; } }, 
			'send_again' => 'שלח שוב',
			'send_code' => 'שלח קוד',
			'settings' => 'הגדרות',
			'share_app' => 'שיתוף האפליקציה',
			'share_app_message' => ({required Object url}) => 'צרו אפליקציית יום הולדת אישית למישהו שאתם אוהבים עם Easy Birthday 🎉\n${url}',
			'short_password' => 'סיסמה קצרה מידי',
			'short_password_description' => 'הסיסמה צריכה להיות 8 תווים לפחות',
			'show_password' => 'הצג סיסמה',
			'skip' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'דלגי'; case GenderContext.male: return 'דלג'; } }, 
			'something_went_wrong' => 'משהו השתבש. נסו שוב',
			'soon' => 'בקרוב',
			'soul_mate' => 'נפש תאומה',
			'special_age' => ({required Object age}) => 'גיל ${age} זה גיל מיוחד',
			'spouse' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'בת זוגתי'; case GenderContext.male: return 'בן זוגי'; } }, 
			'suprise_screen_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'הוסיפי טקסט או תמונות, שחקי עם הסדר ביניהם וצרי את ההפתעה המושלמת!\nההפתעה תישאר סודית עד שתחליטי שהיא מוכנה לבן הזוג שלך!'; case GenderContext.male: return 'הוסף טקסט או תמונות, שחק עם הסדר ביניהם ותיצור את ההפתעה המושלמת!\nההפתעה תישאר סודית עד שתחליט שהיא מוכנה לבת הזוג שלך!'; } }, 
			'sure_delete_name' => ({required GenderContext context, required Object text}) { switch (context) { case GenderContext.female: return 'את בטוחה שאת רוצה למחוק את ${text}?'; case GenderContext.male: return 'אתה בטוח שאתה רוצה למחוק את ${text}?'; } }, 
			'sure_delete' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'את בטוחה שאת רוצה למחוק את האירוע הזה?'; case GenderContext.male: return 'אתה בטוח שאתה רוצה למחוק את האירוע הזה?'; } }, 
			'sure_logout' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'את בטוחה שאת רוצה להתנתק?'; case GenderContext.male: return 'אתה בטוח שאתה רוצה להתנתק?'; } }, 
			'text' => 'טקסט',
			'text_appear_required' => 'נא למלא את הטקסט',
			'text_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'יאללה, תשלפי ברכה מהלב או כתבי איזה טקסט קורע שתרצי!'; case GenderContext.male: return 'יאללה, תשלוף ברכה מהלב או כתוב איזה טקסט קורע שתרצה!'; } }, 
			'the_image' => 'התמונה',
			'the_text' => 'הטקסט',
			'third_question' => 'שאלה שלישית',
			'third_wish' => 'משאלה שלישית',
			'title' => 'כותרת',
			'title_appear_category' => 'הכותרת שתופיע לקטגוריה זו',
			'title_appear_required' => 'נא למלא את הכותרת',
			'too_many_requests' => 'יותר מדי בקשות להתחבר לחשבון זה',
			'true_' => 'נכון',
			'true_false_question' => 'שאלת נכון או לא נכון',
			'two_weeks' => 'שבועיים',
			'unlock' => 'לא נעול',
			'upload_files_count' => ({required Object file, required Object files}) => 'הועלו ${file} מתוך ${files} קבצים',
			'upload_images' => 'העלאת תמונות',
			'upload_six_images' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'העלי 6 תמונות שישמשו למשחק הזיכרון'; case GenderContext.male: return 'העלה 6 תמונות שישמשו למשחק הזיכרון'; } }, 
			'use_emojis' => 'שימוש באימוג׳ים',
			'user_disabled' => 'משתמש מושבת',
			'user_not_found' => 'לא נמצאה כתובת המייל הזו, נסה שוב',
			'videos' => 'סרטונים',
			'videos_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'הוסיפי סרטוני יוטיוב שמזכירים לכם כמה אתם חמודים ביחד'; case GenderContext.male: return 'הוסף סרטוני יוטיוב שמזכירים לכם כמה אתם חמודים ביחד'; } }, 
			'wait_for_phone_login' => 'מחכה להתחברות דרך הטלפון',
			'watch_login_success' => 'התחברת בהצלחה!\nאפשר לעבור לשעון',
			'we_use' => 'אנחנו נשתמש בטקסטים שבחרתם כדי לבנות את האפליקציה באופן אישי',
			'week' => 'שבוע',
			'welcome' => 'ברוכ/ה הבאה!',
			'wish_list_lock_description' => ({required Object name}) => 'כדי לפתוח אותה אנא בקשו מ${name} הזדמנות חדשה',
			'wish_list_lock_title' => 'רשימת המשאלות נעולה',
			'wishes_list' => 'רשימת משאלות',
			'wishes_list_description' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'הוספי אפשרות ל${name} לבחור 3 משאלות:\nרשמי לו "חוזה" קטן, ככה שהוא לא יוכל להגזים!'; case GenderContext.male: return 'הוסף אפשרות ל${name} לבחור 3 משאלות:\nרשום לה "חוזה" קטן, ככה שהיא לא תוכל להגזים!'; } }, 
			'write_calendar_time_to' => ({required Object title}) => 'רשום לו"ז ל: ${title}',
			'write_contract' => 'רשום חוזה',
			'write_contract_to' => ({required Object title}) => 'רשום חוזה ל: ${title}',
			'write_text' => 'רשום טקסט',
			'write_text_to' => ({required Object title}) => 'רשום טקסט ל: ${title}',
			'wrong_password' => 'הסיסמה לא נכונה, נא נסה שנית',
			'yes' => 'כן',
			'you_answer_from' => ({required Object answers, required Object questions}) => 'ענית נכון על ${answers} מתוך ${questions} שאלות',
			'you_win' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'את ניצחת!'; case GenderContext.male: return 'אתה ניצחת!'; } }, 
			_ => null,
		};
	}
}
