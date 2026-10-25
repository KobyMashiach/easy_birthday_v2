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
	@override String add_children_to_unlock({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'יש לכם ילדים? הוסיפי אותם בהגדרות ויפתחו קטגוריות משפחתיות חדשות 🎉';
			case GenderContext.male:
				return 'יש לכם ילדים? הוסף אותם בהגדרות ויפתחו קטגוריות משפחתיות חדשות 🎉';
		}
	}
	@override String add_children({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'הוסיפי ילדים';
			case GenderContext.male:
				return 'הוסף ילדים';
		}
	}
	@override String add_child({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'הוסיפי ילד/ה';
			case GenderContext.male:
				return 'הוסף ילד/ה';
		}
	}
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
	@override String get add_milestone => 'הוספת אבן דרך';
	@override String get add_photo_optional => 'הוספת תמונה (לא חובה)';
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
	@override String age_and({required Object first, required Object second}) => '${first} ו${second}';
	@override String get age_day_one => 'יום אחד';
	@override String get age_day_two => 'יומיים';
	@override String age_days({required Object n}) => '${n} ימים';
	@override String get age_month_one => 'חודש';
	@override String get age_month_two => 'חודשיים';
	@override String age_months({required Object n}) => '${n} חודשים';
	@override String get age_year_one => 'שנה';
	@override String get age_year_two => 'שנתיים';
	@override String age_years({required Object n}) => '${n} שנים';
	@override String get all_coupons_redeemed => 'כל הקופונים מומשו! 🎉';
	@override String get app_info => 'מידע על האפליקציה';
	@override String get app_name => 'שם האפליקציה';
	@override String get app_version => 'גרסת האפליקציה';
	@override String at_age({required Object age}) => 'בגיל ${age}';
	@override String get baby_letter => 'מכתב מהקטנים';
	@override String baby_letter_boy_1({required GenderContext context, required Object age}) {
		switch (context) {
			case GenderContext.female:
				return 'אמא שלי,\nאני רק בן ${age} ועוד לא יודע לכתוב (עזרו לי קצת 🙈), אבל דבר אחד אני כבר יודע בטוח: את האמא הכי טובה בעולם.\nתודה על כל החיבוקים, על כל השירים בלילה ועל כל הפעמים שהצחקת אותי.\nמזל טוב ליום ההולדת! אני אוהב אותך עד הירח וחזרה 🌙';
			case GenderContext.male:
				return 'אבא שלי,\nאני רק בן ${age} ועוד לא יודע לכתוב (עזרו לי קצת 🙈), אבל דבר אחד אני כבר יודע בטוח: אתה האבא הכי טוב בעולם.\nתודה על כל החיבוקים, על כל השירים בלילה ועל כל הפעמים שהצחקת אותי.\nמזל טוב ליום ההולדת! אני אוהב אותך עד הירח וחזרה 🌙';
		}
	}
	@override String baby_letter_boy_2({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'אמא,\nרציתי להגיד לך כמה דברים:\n1. כשאת מחזיקה אותי, אני מרגיש הכי בטוח בעולם.\n2. סליחה על הלילות הלבנים. בערך.\n3. כשאת מחייכת אליי, אני מחייך בחזרה. תמיד.\nיום הולדת שמח לאמא הכי שלי!';
			case GenderContext.male:
				return 'אבא,\nרציתי להגיד לך כמה דברים:\n1. כשאתה מחזיק אותי, אני מרגיש הכי בטוח בעולם.\n2. סליחה על הלילות הלבנים. בערך.\n3. כשאתה מחייך אליי, אני מחייך בחזרה. תמיד.\nיום הולדת שמח לאבא הכי שלי!';
		}
	}
	@override String baby_letter_boy_3({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'יום הולדת שמח אמא! 🎂\nהיום אני מוותר לך: מותר לך לישון עד מאוחר (לא מבטיח כלום 😇).\nתודה שאת תמיד שם בשבילי. אוהב אותך המון המון!';
			case GenderContext.male:
				return 'יום הולדת שמח אבא! 🎂\nהיום אני מוותר לך: מותר לך לישון עד מאוחר (לא מבטיח כלום 😇).\nתודה שאתה תמיד שם בשבילי. אוהב אותך המון המון!';
		}
	}
	@override String baby_letter_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'כתבי מכתב מרגש בשם הילדים, כאילו הם כתבו אותו בעצמם 👣';
			case GenderContext.male:
				return 'כתוב מכתב מרגש בשם הילדים, כאילו הם כתבו אותו בעצמם 👣';
		}
	}
	@override String baby_letter_editor_explanation({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'כתבי את המכתב בקול של ${name}. אפשר להתחיל ממכתב מוכן ולשנות כרצונך.';
			case GenderContext.male:
				return 'כתוב את המכתב בקול של ${name}. אפשר להתחיל ממכתב מוכן ולשנות כרצונך.';
		}
	}
	@override String baby_letter_girl_1({required GenderContext context, required Object age}) {
		switch (context) {
			case GenderContext.female:
				return 'אמא שלי,\nאני רק בת ${age} ועוד לא יודעת לכתוב (עזרו לי קצת 🙈), אבל דבר אחד אני כבר יודעת בטוח: את האמא הכי טובה בעולם.\nתודה על כל החיבוקים, על כל השירים בלילה ועל כל הפעמים שהצחקת אותי.\nמזל טוב ליום ההולדת! אני אוהבת אותך עד הירח וחזרה 🌙';
			case GenderContext.male:
				return 'אבא שלי,\nאני רק בת ${age} ועוד לא יודעת לכתוב (עזרו לי קצת 🙈), אבל דבר אחד אני כבר יודעת בטוח: אתה האבא הכי טוב בעולם.\nתודה על כל החיבוקים, על כל השירים בלילה ועל כל הפעמים שהצחקת אותי.\nמזל טוב ליום ההולדת! אני אוהבת אותך עד הירח וחזרה 🌙';
		}
	}
	@override String baby_letter_girl_2({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'אמא,\nרציתי להגיד לך כמה דברים:\n1. כשאת מחזיקה אותי, אני מרגישה הכי בטוחה בעולם.\n2. סליחה על הלילות הלבנים. בערך.\n3. כשאת מחייכת אליי, אני מחייכת בחזרה. תמיד.\nיום הולדת שמח לאמא הכי שלי!';
			case GenderContext.male:
				return 'אבא,\nרציתי להגיד לך כמה דברים:\n1. כשאתה מחזיק אותי, אני מרגישה הכי בטוחה בעולם.\n2. סליחה על הלילות הלבנים. בערך.\n3. כשאתה מחייך אליי, אני מחייכת בחזרה. תמיד.\nיום הולדת שמח לאבא הכי שלי!';
		}
	}
	@override String baby_letter_girl_3({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'יום הולדת שמח אמא! 🎂\nהיום אני מוותרת לך: מותר לך לישון עד מאוחר (לא מבטיחה כלום 😇).\nתודה שאת תמיד שם בשבילי. אוהבת אותך המון המון!';
			case GenderContext.male:
				return 'יום הולדת שמח אבא! 🎂\nהיום אני מוותרת לך: מותר לך לישון עד מאוחר (לא מבטיחה כלום 😇).\nתודה שאתה תמיד שם בשבילי. אוהבת אותך המון המון!';
		}
	}
	@override String baby_letter_girls_1({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'אמא שלנו,\nאנחנו עוד קטנות מכדי לכתוב (עזרו לנו קצת 🙈), אבל דבר אחד אנחנו יודעות בטוח: את האמא הכי טובה בעולם.\nתודה על כל החיבוקים, השירים והצחוקים.\nמזל טוב ליום ההולדת! אנחנו אוהבות אותך עד הירח וחזרה 🌙';
			case GenderContext.male:
				return 'אבא שלנו,\nאנחנו עוד קטנות מכדי לכתוב (עזרו לנו קצת 🙈), אבל דבר אחד אנחנו יודעות בטוח: אתה האבא הכי טוב בעולם.\nתודה על כל החיבוקים, השירים והצחוקים.\nמזל טוב ליום ההולדת! אנחנו אוהבות אותך עד הירח וחזרה 🌙';
		}
	}
	@override String baby_letter_girls_2({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'יום הולדת שמח אמא! 🎂\nהיום אנחנו מבטיחות לא לריב על מי יושבת לידך (לפחות עד הערב).\nתודה שאת תמיד שם בשבילנו. אוהבות אותך המון!';
			case GenderContext.male:
				return 'יום הולדת שמח אבא! 🎂\nהיום אנחנו מבטיחות לא לריב על מי יושבת לידך (לפחות עד הערב).\nתודה שאתה תמיד שם בשבילנו. אוהבות אותך המון!';
		}
	}
	@override String baby_letter_hint({required Object name}) => 'המכתב של ${name} ✍️';
	@override String baby_letter_kids_1({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'אמא שלנו,\nאנחנו עוד קטנים מכדי לכתוב (עזרו לנו קצת 🙈), אבל דבר אחד אנחנו יודעים בטוח: את האמא הכי טובה בעולם.\nתודה על כל החיבוקים, השירים והצחוקים.\nמזל טוב ליום ההולדת! אנחנו אוהבים אותך עד הירח וחזרה 🌙';
			case GenderContext.male:
				return 'אבא שלנו,\nאנחנו עוד קטנים מכדי לכתוב (עזרו לנו קצת 🙈), אבל דבר אחד אנחנו יודעים בטוח: אתה האבא הכי טוב בעולם.\nתודה על כל החיבוקים, השירים והצחוקים.\nמזל טוב ליום ההולדת! אנחנו אוהבים אותך עד הירח וחזרה 🌙';
		}
	}
	@override String baby_letter_kids_2({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'יום הולדת שמח אמא! 🎂\nהיום אנחנו מבטיחים לא לריב על מי יושב לידך (לפחות עד הערב).\nתודה שאת תמיד שם בשבילנו. אוהבים אותך המון!';
			case GenderContext.male:
				return 'יום הולדת שמח אבא! 🎂\nהיום אנחנו מבטיחים לא לריב על מי יושב לידך (לפחות עד הערב).\nתודה שאתה תמיד שם בשבילנו. אוהבים אותך המון!';
		}
	}
	@override String baby_letter_title({required Object name}) => 'מכתב מ${name}';
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
	@override String get boy => 'בן';
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
	@override String capsule_add_my_letter({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'הוסיפי את המכתב שלך ✍️';
			case GenderContext.male:
				return 'הוסף את המכתב שלך ✍️';
		}
	}
	@override String capsule_birthday_18({required Object name}) => 'יום הולדת 18 של ${name}';
	@override String get capsule_date_required => 'צריך לבחור מתי הקפסולה תיפתח';
	@override String get capsule_edit_my_letter => 'עריכת המכתב שלי';
	@override String capsule_for({required Object name}) => 'קפסולת זמן ל${name}';
	@override String get capsule_in_a_year => 'בעוד שנה';
	@override String capsule_letter_hint({required Object name}) => 'מה תרצו להגיד ל${name} בעתיד?';
	@override String capsule_letter_of({required Object name}) => 'המכתב של ${name}';
	@override String capsule_next_birthday({required Object name}) => 'יום ההולדת הבא של ${name}';
	@override String capsule_opened({required Object name}) => 'הקפסולה של ${name} נפתחה! 🎉';
	@override String capsule_opens_at({required Object date}) => 'נפתחת ב־${date}';
	@override String get capsule_opens_on => 'מתי הקפסולה תיפתח?';
	@override String get capsule_other_date => 'תאריך אחר';
	@override String capsule_partner_sealed({required Object name}) => '💌 יש בקפסולה גם מכתב של ${name}';
	@override String capsule_your_letter({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'המכתב שלך לקפסולה';
			case GenderContext.male:
				return 'המכתב שלך לקפסולה';
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
	@override String get child_birth_date => 'תאריך לידה';
	@override String get child_birth_date_required => 'צריך לבחור תאריך לידה';
	@override String get child_name => 'שם';
	@override String get child_name_required => 'צריך למלא שם';
	@override String get child_photo_required => 'צריך תמונה של כל אחד מהילדים';
	@override String get child_removed => 'חלק מהילדים של הקטגוריה הזו הוסרו מההגדרות';
	@override String get children => 'ילדים';
	@override String get children_photos => 'תמונות הילדים';
	@override String get children_unlock_explanation => 'לפי הגילאים של הילדים ייפתחו קטגוריות משפחתיות: מכתב מהקטנים, אבני דרך, סטטיסטיקות הורות ועוד 👶';
	@override String get choose_at_least_one_child => 'צריך לבחור לפחות ילד אחד';
	@override String choose_category({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'בחרי קטגוריה';
			case GenderContext.male:
				return 'בחר קטגוריה';
		}
	}
	@override String choose_child({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'על מי הקטגוריה? (אפשר כמה)';
			case GenderContext.male:
				return 'על מי הקטגוריה? (אפשר כמה)';
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
	@override String choose_coupons({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'בחרי 3 קופונים שתוכלי לממש מתי שתרצי:';
			case GenderContext.male:
				return 'בחר 3 קופונים שתוכל לממש מתי שתרצה:';
		}
	}
	@override String choose_currect_answer({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'בחרי את התשובה הנכונה';
			case GenderContext.male:
				return 'בחר את התשובה הנכונה';
		}
	}
	@override String choose_day_hint({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'בחרי יום בלוח כדי לראות מה מתוכנן 👆';
			case GenderContext.male:
				return 'בחר יום בלוח כדי לראות מה מתוכנן 👆';
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
	@override String get couple_categories => '💑 קטגוריות זוגיות';
	@override String get coupon_idea_breakfast_in_bed => 'ארוחת בוקר במיטה';
	@override String get coupon_idea_date_night => 'ערב זוגי, הבייביסיטר עליי';
	@override String get coupon_idea_diaper_pass => 'פטור מהחלפת טיטולים ליום';
	@override String get coupon_idea_friends_night => 'ערב חופשי עם חברים';
	@override String get coupon_idea_full_night => 'לילה שלם בלי לקום 😴';
	@override String get coupon_idea_long_shower => 'מקלחת ארוכה בלי הפרעות';
	@override String get coupon_idea_massage => 'עיסוי של חצי שעה';
	@override String get coupon_idea_sleep_in => 'בוקר של שינה עד מאוחר';
	@override String get coupon_ideas => 'רעיונות:';
	@override String coupon_number({required Object n}) => 'קופון ${n}';
	@override String get coupon_seat => 'מושב';
	@override String get coupon_stub => 'ספח';
	@override String get coupon_valid_forever => 'תוקף // ללא הגבלה';
	@override String coupons_left({required Object n}) => 'קופונים שנשארו: ${n}';
	@override String get create_greeting_using_ai => 'צור ברכה באמצעות AI';
	@override String get current_plan => 'תוכנית נוכחית';
	@override String get date_of_birth => 'תאריך לידה';
	@override String get days => 'ימים';
	@override String get days_of_parenting => 'ימים של הורות';
	@override String get default_error => 'ההתחברות או ההרשמה נכשלו. בבקשה נסה שוב';
	@override String get delete => 'מחיקה';
	@override String get delete_account => 'מחיקת חשבון';
	@override String get delete_account_description => 'פעולה זו תמחק לצמיתות את החשבון, את הגישה של בן/בת הזוג ואת כל התמונות, הסרטונים וההודעות בהפתעה. לא ניתן לבטל פעולה זו.';
	@override String get delete_account_failed => 'לא הצלחנו למחוק את החשבון. כדאי לבדוק את החיבור ולנסות שוב.';
	@override String get delete_account_sure => 'למחוק את החשבון?';
	@override String get delete_child_description => 'קטגוריות שכבר נוצרו לא יימחקו.';
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
	@override String drag_to_reorder({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'גררי את הכרטיסים (או לחיצה ארוכה) כדי לקבוע את הסדר ש${name} יראה ↕️';
			case GenderContext.male:
				return 'גרור את הכרטיסים (או לחיצה ארוכה) כדי לקבוע את הסדר ש${name} תראה ↕️';
		}
	}
	@override String get drag_to_tear => 'גררו לקריעה';
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
	@override String get family_categories => '👨‍👩‍👧 קטגוריות משפחה';
	@override String get feature_ears => 'האוזניים';
	@override String get feature_eyes => 'העיניים';
	@override String get feature_hair => 'השיער';
	@override String get feature_hands => 'הידיים';
	@override String get feature_laugh => 'הצחוק';
	@override String get feature_mouth => 'הפה';
	@override String get feature_nose => 'האף';
	@override String get feature_smile => 'החיוך';
	@override String get feature_temper => 'העצבים 😅';
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
	@override String get girl => 'בת';
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
	@override String get hours => 'שעות';
	@override String get how_it_grew => 'איך זה הצטבר 📈';
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
	@override String get later => 'אחר כך';
	@override String get less => 'פחות';
	@override String get lets_continue => 'בואו נתקדם!';
	@override String lets_try({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'בואי ננסה!';
			case GenderContext.male:
				return 'בוא ננסה!';
		}
	}
	@override String letter_from({required Object name}) => 'מכתב מ${name} 💌';
	@override String letter_template_number({required Object n}) => 'מכתב מוכן ${n}';
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
	@override String get look_alike => 'מי דומה למי?';
	@override String look_alike_agreed({required Object agreed, required Object total}) => 'הסכמתם ב־${agreed} מתוך ${total} ניחושים 🤝';
	@override String look_alike_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'עיניים, אף, חיוך... למי הילדים דומים יותר? בסוף מגלים מי ניצח 👑';
			case GenderContext.male:
				return 'עיניים, אף, חיוך... למי הילדים דומים יותר? בסוף מגלים מי ניצח 👑';
		}
	}
	@override String look_alike_editor_explanation({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'העלי תמונה של כל ילד ושל שניכם, מאותו גיל אם יש ואם אין אז עדכנית. אפשר גם לנחש בעצמך ולגלות בסוף אם הסכמתם.';
			case GenderContext.male:
				return 'העלה תמונה של כל ילד ושל שניכם, מאותו גיל אם יש ואם אין אז עדכנית. אפשר גם לנחש בעצמך ולגלות בסוף אם הסכמתם.';
		}
	}
	@override String look_alike_tie({required Object name}) => 'תיקו! ${name}: שילוב מושלם של שניכם 💞';
	@override String look_alike_title({required Object name}) => 'למי ${name} דומים?';
	@override String look_alike_winner_boy({required Object name, required Object parent}) => '${name} דומה ל${parent}! 🎉';
	@override String look_alike_winner_girl({required Object name, required Object parent}) => '${name} דומה ל${parent}! 🎉';
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
	@override String get milestone_note => 'כמה מילים (לא חובה)';
	@override String get milestone_title => 'מה קרה?';
	@override String get milestone_title_required => 'צריך לכתוב מה קרה';
	@override String get milestones => 'אבני דרך';
	@override String milestones_count({required Object n, required Object name}) => '${n} אבני דרך של ${name}';
	@override String milestones_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'ציר זמן מתוק של כל הפעמים הראשונות: חיוך ראשון, צעד ראשון ועוד 👣';
			case GenderContext.male:
				return 'ציר זמן מתוק של כל הפעמים הראשונות: חיוך ראשון, צעד ראשון ועוד 👣';
		}
	}
	@override String milestones_editor_explanation({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'הוסיפי את הרגעים הראשונים עם תאריך, ואם תרצי גם תמונה. הגיל בכל רגע מחושב לבד.';
			case GenderContext.male:
				return 'הוסף את הרגעים הראשונים עם תאריך, ואם תרצה גם תמונה. הגיל בכל רגע מחושב לבד.';
		}
	}
	@override String milestones_title({required Object name}) => 'הפעמים הראשונות של ${name}';
	@override String get minutes => 'דקות';
	@override String get month => 'חודש';
	@override String get more => 'יותר';
	@override String get more_few_seconds => 'בעוד כמה שניות נוכל להתחיל לבנות את המתנה המושלמת!';
	@override String get more_firsts_coming => 'ועוד המון פעמים ראשונות בדרך...';
	@override String get ms_crawled => 'זחילה ראשונה';
	@override String get ms_first_birthday => 'יום הולדת ראשון';
	@override String get ms_first_daycare => 'יום ראשון בגן';
	@override String get ms_first_food => 'אוכל ראשון';
	@override String get ms_first_haircut => 'תספורת ראשונה';
	@override String get ms_first_smile => 'חיוך ראשון';
	@override String get ms_first_steps => 'צעדים ראשונים';
	@override String get ms_first_tooth => 'שן ראשונה';
	@override String get ms_first_word => 'מילה ראשונה';
	@override String get ms_rolled_over => 'התהפכות ראשונה';
	@override String get ms_sat_up => 'ישיבה ראשונה';
	@override String get ms_slept_through => 'לילה שלם ראשון';
	@override String my_dear({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'היקרה';
			case GenderContext.male:
				return 'היקר';
		}
	}
	@override String names_and({required Object first, required Object last}) => '${first} ו${last}';
	@override String get new_badge => 'חדש';
	@override String get new_child => 'ילד/ה חדש/ה';
	@override String get new_password => 'סיסמה חדשה';
	@override String get new_password_verification => 'אימות סיסמה חדשה';
	@override String get no => 'לא';
	@override String get no_account => 'אין משתמש';
	@override String get no_allow_text_empty => 'לא ניתן להשאיר טקסט ריק';
	@override String get no_category_added => 'לא הוספת קטגרויות לאירוע זה';
	@override String get no_children_yet => 'עוד לא הוספתם ילדים';
	@override String get no_events_this_day => 'אין תוכניות ביום הזה... עדיין 😉';
	@override String get no_milestones_yet => 'עוד אין אבני דרך. זה הזמן להוסיף את הראשונה!';
	@override String get no_owner => 'המשתמש לא משתמש ניהולי';
	@override String get no_questions_add => 'לא הועלו שאלות עדיין';
	@override String get no_required => 'לא חובה';
	@override String get no_wish_yet => 'אין עדיין משאלות';
	@override String get not_played_yet => 'עוד לא שוחק';
	@override String get not_written_yet => 'עוד לא נכתב';
	@override String get nothing_here_yet => 'אין כאן עדיין כלום';
	@override String get num_mistakes => 'מספר טעויות';
	@override String num_of_questions({required Object number}) => 'יש לך כרגע ${number} שאלות';
	@override String get ok => 'אישור';
	@override String open_it({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'פתחי';
			case GenderContext.male:
				return 'פתח';
		}
	}
	@override String get open_new_memory_game => 'פתיחת גישה למשחק חדש';
	@override String get open_new_quiz_game => 'פתיחת גישה לטריוויה חדשה';
	@override String get operation_not_allowed => 'שגיאת שרת, אנא נסה שוב מאוחר יותר';
	@override String get otp_code => 'קוד אימות';
	@override String get otp_code_description => 'קיבלת הודעת SMS עם קוד אימות.\nנא לרשום אותו וללחוץ אישור';
	@override String get parent_coupon_label => 'קופון הורות';
	@override String get parent_coupons => 'שוברי הורות';
	@override String parent_coupons_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'כתבי חוזה קטן, ובן הזוג שלך יבחר 3 קופונים להורים עייפים: כרטיסים שקורעים כשמממשים 🎟️';
			case GenderContext.male:
				return 'כתוב חוזה קטן, ובת הזוג שלך תבחר 3 קופונים להורים עייפים: כרטיסים שקורעים כשמממשים 🎟️';
		}
	}
	@override String parent_photo_hint({required Object age}) => 'עדיף תמונה שלכם בגיל ${age}. אין? גם תמונה עדכנית תעשה את העבודה 😉';
	@override String get parent_stats => 'סטטיסטיקות הורות';
	@override String parent_stats_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'כמה טיטולים, כמה קפה, כמה לילות לבנים? מספרים מצחיקים עם גרפים, לפי הימים מאז הלידה 📊';
			case GenderContext.male:
				return 'כמה טיטולים, כמה קפה, כמה לילות לבנים? מספרים מצחיקים עם גרפים, לפי הימים מאז הלידה 📊';
		}
	}
	@override String parent_stats_editor_explanation({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'כמה בממוצע ביום לכל ילד? הסכומים מחושבים לבד לפי הימים מאז הלידה. 0 מסתיר את השורה.';
			case GenderContext.male:
				return 'כמה בממוצע ביום לכל ילד? הסכומים מחושבים לבד לפי הימים מאז הלידה. 0 מסתיר את השורה.';
		}
	}
	@override String parent_stats_title({required Object name}) => 'ההורות במספרים: ${name}';
	@override String get parents_photos => 'התמונות שלכם';
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
	@override String play_again({required Object name}) => 'לתת ל${name} לשחק שוב';
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
	@override String quiz_game_played({required GenderContext context, required Object name, required Object answered, required Object total, required Object score}) {
		switch (context) {
			case GenderContext.female:
				return '${name} ענה על ${answered} מתוך ${total} שאלות, ${score} נכונות';
			case GenderContext.male:
				return '${name} ענתה על ${answered} מתוך ${total} שאלות, ${score} נכונות';
		}
	}
	@override String quiz_verdict_good({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'לא רע בכלל! 😄';
			case GenderContext.male:
				return 'לא רע בכלל! 😄';
		}
	}
	@override String quiz_verdict_great({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'וואו! את באמת מכירה אותי 🏆';
			case GenderContext.male:
				return 'וואו! אתה באמת מכיר אותי 🏆';
		}
	}
	@override String quiz_verdict_low({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'יש לנו עוד מה ללמוד ביחד 😅';
			case GenderContext.male:
				return 'יש לנו עוד מה ללמוד ביחד 😅';
		}
	}
	@override String get rate_app => 'דרג את האפליקציה';
	@override String get ready_letters => 'מכתבים מוכנים:';
	@override String get recommand_drak_colors => 'מומלץ צבעים כהים';
	@override String get recommended_colors => 'צבעים מומלצים';
	@override String get redeemed => 'מומש';
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
	@override String get reorder => 'שינוי סדר';
	@override String get replace_photo => 'החלפת תמונה';
	@override String get required_fill_all_answer => 'חובה למלא את כל התשובות';
	@override String get required_fill_question => 'חובה למלא את השאלה';
	@override String get save => 'שמור';
	@override String get save_and_lock => 'שמור ונעל';
	@override String get save_and_print_coupons => 'שמירה והדפסה 🎟️';
	@override String get score => 'תוצאה';
	@override String get seal_letter => 'חתימה בקפסולה 🔒';
	@override String get sealed => 'חתום';
	@override String get second_question => 'שאלה שנייה';
	@override String get second_wish => 'משאלה שנייה';
	@override String get seconds => 'שניות';
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
	@override String get so_far => 'עד היום';
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
	@override String get stat_coffee => 'כוסות קפה';
	@override String get stat_daily_coffee => 'כוסות קפה ביום';
	@override String get stat_daily_diapers => 'טיטולים ביום';
	@override String get stat_daily_feedings => 'האכלות ביום';
	@override String get stat_daily_kisses => 'נשיקות ביום';
	@override String get stat_daily_laundry => 'מכונות כביסה ביום';
	@override String get stat_daily_lullabies => 'שירי ערש ביום';
	@override String get stat_daily_night_wakeups => 'השכמות בלילה';
	@override String get stat_diapers => 'טיטולים הוחלפו';
	@override String stat_fact_coffee({required Object liters, required Object baths}) => '${liters} ליטר קפה, מספיק למלא ${baths} אמבטיות ☕';
	@override String stat_fact_diapers({required Object meters, required Object floors}) => 'ערימה בגובה ${meters} מטר, כמו בניין של ${floors} קומות 🏢';
	@override String stat_fact_feedings({required Object liters}) => 'בערך ${liters} ליטר חלב 🍼';
	@override String get stat_fact_kisses => 'ועדיין לא מספיק 😍';
	@override String stat_fact_laundry({required Object hours}) => '${hours} שעות של קיפול בגדים קטנטנים 🧦';
	@override String stat_fact_lullabies({required Object hours}) => '${hours} שעות של הופעות חיות, בלי לקבל שקל 🎤';
	@override String stat_fact_night_wakeups({required Object hours, required Object nights}) => '${hours} שעות ערים בלילה, ${nights} לילות שלמים בלי שינה 🥱';
	@override String get stat_feedings => 'האכלות';
	@override String get stat_hidden => 'מוסתר';
	@override String get stat_kisses => 'נשיקות';
	@override String get stat_laundry => 'מכונות כביסה';
	@override String get stat_lullabies => 'שירי ערש';
	@override String get stat_night_wakeups => 'השכמות בלילה';
	@override String stat_until_today({required Object total}) => 'עד היום: ${total}';
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
	@override String tap_to_open_gift({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'לחצי על המתנה כדי לפתוח 🎁';
			case GenderContext.male:
				return 'לחץ על המתנה כדי לפתוח 🎁';
		}
	}
	@override String tap_to_open({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'לחצי כדי לפתוח 💌';
			case GenderContext.male:
				return 'לחץ כדי לפתוח 💌';
		}
	}
	@override String tear_coupon_explanation({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'רוצה לממש קופון? גררי את הספח וקרעי אותו מול ${name} 😉';
			case GenderContext.male:
				return 'רוצה לממש קופון? גרור את הספח וקרע אותו מול ${name} 😉';
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
	@override String get time_capsule => 'קפסולת זמן';
	@override String time_capsule_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'כתבי מכתב לילדים שייפתח רק בתאריך שתבחרי: יום ההולדת הבא, גיל 18... ⏳';
			case GenderContext.male:
				return 'כתוב מכתב לילדים שייפתח רק בתאריך שתבחר: יום ההולדת הבא, גיל 18... ⏳';
		}
	}
	@override String time_capsule_editor_explanation({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'כתבי מכתב ובחרי מתי הקפסולה תיפתח. גם ${name} יוכל להוסיף מכתב משלו, והכול יישאר נעול עד התאריך.';
			case GenderContext.male:
				return 'כתוב מכתב ובחר מתי הקפסולה תיפתח. גם ${name} תוכל להוסיף מכתב משלה, והכול יישאר נעול עד התאריך.';
		}
	}
	@override String time_capsule_title({required Object name}) => 'קפסולת זמן ל${name}';
	@override String get title => 'כותרת';
	@override String get title_appear_category => 'הכותרת שתופיע לקטגוריה זו';
	@override String get title_appear_required => 'נא למלא את הכותרת';
	@override String title_calendar({required Object name}) => 'היום המושלם של ${name} 🗓️';
	@override String get title_memory => 'משחק הזיכרון שלנו 🧠';
	@override String get title_pictures => 'התמונות שלנו 📸';
	@override String title_quiz({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'כמה את מכירה אותי? 🤔';
			case GenderContext.male:
				return 'כמה אתה מכיר אותי? 🤔';
		}
	}
	@override String title_surprise({required Object name}) => 'הפתעה ל${name} 🎁';
	@override String title_text({required Object name}) => 'ברכה ל${name} 💌';
	@override String get title_videos => 'הסרטונים שלנו 🎬';
	@override String title_wishes({required Object name}) => '3 משאלות ל${name} 🧞';
	@override String get too_many_requests => 'יותר מדי בקשות להתחבר לחשבון זה';
	@override String get true_ => 'נכון';
	@override String get true_false_question => 'שאלת נכון או לא נכון';
	@override String get two_weeks => 'שבועיים';
	@override String get typical_day => 'יום טיפוסי אצלנו';
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
	@override String whats_new_add_children({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'קטגוריות חדשות להורים! הוסיפי את הילדים בהגדרות, ולפי הגילאים שלהם ייפתחו קטגוריות מיוחדות.';
			case GenderContext.male:
				return 'קטגוריות חדשות להורים! הוסף את הילדים בהגדרות, ולפי הגילאים שלהם ייפתחו קטגוריות מיוחדות.';
		}
	}
	@override String whats_new_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'קטגוריות חדשות למשפחה, לפי הגילאים של הילדים שלכם. לחצי על הכפתור כדי לנסות!';
			case GenderContext.male:
				return 'קטגוריות חדשות למשפחה, לפי הגילאים של הילדים שלכם. לחץ על הכפתור כדי לנסות!';
		}
	}
	@override String whats_new_partner_description({required GenderContext context, required Object title, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'חדש אצלך: ${title}, מאת ${name} 🎁 לחצי כדי לפתוח!';
			case GenderContext.male:
				return 'חדש אצלך: ${title}, מאת ${name} 🎁 לחץ כדי לפתוח!';
		}
	}
	@override String whats_new_partner_intro({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'חדש: קטגוריות משפחתיות! מכתב מהקטנים, אבני דרך ועוד. הוסיפי את הילדים בהגדרות, וכך גם ל${name} יהיו קטגוריות חדשות להפתיע אותך 👶';
			case GenderContext.male:
				return 'חדש: קטגוריות משפחתיות! מכתב מהקטנים, אבני דרך ועוד. הוסף את הילדים בהגדרות, וכך גם ל${name} יהיו קטגוריות חדשות להפתיע אותך 👶';
		}
	}
	@override String get whats_new_partner_title => 'יש לך הפתעה חדשה!';
	@override String get whats_new_title => 'קטגוריות למשפחה!';
	@override String whose_feature({required Object feature, required Object name}) => '${feature} של ${name}: של מי?';
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
	@override String get with_love => 'באהבה';
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
	@override String your_guess_optional({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'הניחושים שלך (לא חובה)';
			case GenderContext.male:
				return 'הניחושים שלך (לא חובה)';
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
			'add_children_to_unlock' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'יש לכם ילדים? הוסיפי אותם בהגדרות ויפתחו קטגוריות משפחתיות חדשות 🎉'; case GenderContext.male: return 'יש לכם ילדים? הוסף אותם בהגדרות ויפתחו קטגוריות משפחתיות חדשות 🎉'; } }, 
			'add_children' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'הוסיפי ילדים'; case GenderContext.male: return 'הוסף ילדים'; } }, 
			'add_child' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'הוסיפי ילד/ה'; case GenderContext.male: return 'הוסף ילד/ה'; } }, 
			'add_event_date' => ({required GenderContext context, required Object date}) { switch (context) { case GenderContext.female: return 'הוסיפי אירוע לתאריך ${date}'; case GenderContext.male: return 'הוסף אירוע לתאריך ${date}'; } }, 
			'add_event' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'הוסיפי אירוע'; case GenderContext.male: return 'הוסף אירוע'; } }, 
			'add_free_text' => 'הוספת טקסט חופשי',
			'add_image' => 'הוספת תמונה',
			'add_milestone' => 'הוספת אבן דרך',
			'add_photo_optional' => 'הוספת תמונה (לא חובה)',
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
			'age_and' => ({required Object first, required Object second}) => '${first} ו${second}',
			'age_day_one' => 'יום אחד',
			'age_day_two' => 'יומיים',
			'age_days' => ({required Object n}) => '${n} ימים',
			'age_month_one' => 'חודש',
			'age_month_two' => 'חודשיים',
			'age_months' => ({required Object n}) => '${n} חודשים',
			'age_year_one' => 'שנה',
			'age_year_two' => 'שנתיים',
			'age_years' => ({required Object n}) => '${n} שנים',
			'all_coupons_redeemed' => 'כל הקופונים מומשו! 🎉',
			'app_info' => 'מידע על האפליקציה',
			'app_name' => 'שם האפליקציה',
			'app_version' => 'גרסת האפליקציה',
			'at_age' => ({required Object age}) => 'בגיל ${age}',
			'baby_letter' => 'מכתב מהקטנים',
			'baby_letter_boy_1' => ({required GenderContext context, required Object age}) { switch (context) { case GenderContext.female: return 'אמא שלי,\nאני רק בן ${age} ועוד לא יודע לכתוב (עזרו לי קצת 🙈), אבל דבר אחד אני כבר יודע בטוח: את האמא הכי טובה בעולם.\nתודה על כל החיבוקים, על כל השירים בלילה ועל כל הפעמים שהצחקת אותי.\nמזל טוב ליום ההולדת! אני אוהב אותך עד הירח וחזרה 🌙'; case GenderContext.male: return 'אבא שלי,\nאני רק בן ${age} ועוד לא יודע לכתוב (עזרו לי קצת 🙈), אבל דבר אחד אני כבר יודע בטוח: אתה האבא הכי טוב בעולם.\nתודה על כל החיבוקים, על כל השירים בלילה ועל כל הפעמים שהצחקת אותי.\nמזל טוב ליום ההולדת! אני אוהב אותך עד הירח וחזרה 🌙'; } }, 
			'baby_letter_boy_2' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'אמא,\nרציתי להגיד לך כמה דברים:\n1. כשאת מחזיקה אותי, אני מרגיש הכי בטוח בעולם.\n2. סליחה על הלילות הלבנים. בערך.\n3. כשאת מחייכת אליי, אני מחייך בחזרה. תמיד.\nיום הולדת שמח לאמא הכי שלי!'; case GenderContext.male: return 'אבא,\nרציתי להגיד לך כמה דברים:\n1. כשאתה מחזיק אותי, אני מרגיש הכי בטוח בעולם.\n2. סליחה על הלילות הלבנים. בערך.\n3. כשאתה מחייך אליי, אני מחייך בחזרה. תמיד.\nיום הולדת שמח לאבא הכי שלי!'; } }, 
			'baby_letter_boy_3' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'יום הולדת שמח אמא! 🎂\nהיום אני מוותר לך: מותר לך לישון עד מאוחר (לא מבטיח כלום 😇).\nתודה שאת תמיד שם בשבילי. אוהב אותך המון המון!'; case GenderContext.male: return 'יום הולדת שמח אבא! 🎂\nהיום אני מוותר לך: מותר לך לישון עד מאוחר (לא מבטיח כלום 😇).\nתודה שאתה תמיד שם בשבילי. אוהב אותך המון המון!'; } }, 
			'baby_letter_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'כתבי מכתב מרגש בשם הילדים, כאילו הם כתבו אותו בעצמם 👣'; case GenderContext.male: return 'כתוב מכתב מרגש בשם הילדים, כאילו הם כתבו אותו בעצמם 👣'; } }, 
			'baby_letter_editor_explanation' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'כתבי את המכתב בקול של ${name}. אפשר להתחיל ממכתב מוכן ולשנות כרצונך.'; case GenderContext.male: return 'כתוב את המכתב בקול של ${name}. אפשר להתחיל ממכתב מוכן ולשנות כרצונך.'; } }, 
			'baby_letter_girl_1' => ({required GenderContext context, required Object age}) { switch (context) { case GenderContext.female: return 'אמא שלי,\nאני רק בת ${age} ועוד לא יודעת לכתוב (עזרו לי קצת 🙈), אבל דבר אחד אני כבר יודעת בטוח: את האמא הכי טובה בעולם.\nתודה על כל החיבוקים, על כל השירים בלילה ועל כל הפעמים שהצחקת אותי.\nמזל טוב ליום ההולדת! אני אוהבת אותך עד הירח וחזרה 🌙'; case GenderContext.male: return 'אבא שלי,\nאני רק בת ${age} ועוד לא יודעת לכתוב (עזרו לי קצת 🙈), אבל דבר אחד אני כבר יודעת בטוח: אתה האבא הכי טוב בעולם.\nתודה על כל החיבוקים, על כל השירים בלילה ועל כל הפעמים שהצחקת אותי.\nמזל טוב ליום ההולדת! אני אוהבת אותך עד הירח וחזרה 🌙'; } }, 
			'baby_letter_girl_2' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'אמא,\nרציתי להגיד לך כמה דברים:\n1. כשאת מחזיקה אותי, אני מרגישה הכי בטוחה בעולם.\n2. סליחה על הלילות הלבנים. בערך.\n3. כשאת מחייכת אליי, אני מחייכת בחזרה. תמיד.\nיום הולדת שמח לאמא הכי שלי!'; case GenderContext.male: return 'אבא,\nרציתי להגיד לך כמה דברים:\n1. כשאתה מחזיק אותי, אני מרגישה הכי בטוחה בעולם.\n2. סליחה על הלילות הלבנים. בערך.\n3. כשאתה מחייך אליי, אני מחייכת בחזרה. תמיד.\nיום הולדת שמח לאבא הכי שלי!'; } }, 
			'baby_letter_girl_3' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'יום הולדת שמח אמא! 🎂\nהיום אני מוותרת לך: מותר לך לישון עד מאוחר (לא מבטיחה כלום 😇).\nתודה שאת תמיד שם בשבילי. אוהבת אותך המון המון!'; case GenderContext.male: return 'יום הולדת שמח אבא! 🎂\nהיום אני מוותרת לך: מותר לך לישון עד מאוחר (לא מבטיחה כלום 😇).\nתודה שאתה תמיד שם בשבילי. אוהבת אותך המון המון!'; } }, 
			'baby_letter_girls_1' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'אמא שלנו,\nאנחנו עוד קטנות מכדי לכתוב (עזרו לנו קצת 🙈), אבל דבר אחד אנחנו יודעות בטוח: את האמא הכי טובה בעולם.\nתודה על כל החיבוקים, השירים והצחוקים.\nמזל טוב ליום ההולדת! אנחנו אוהבות אותך עד הירח וחזרה 🌙'; case GenderContext.male: return 'אבא שלנו,\nאנחנו עוד קטנות מכדי לכתוב (עזרו לנו קצת 🙈), אבל דבר אחד אנחנו יודעות בטוח: אתה האבא הכי טוב בעולם.\nתודה על כל החיבוקים, השירים והצחוקים.\nמזל טוב ליום ההולדת! אנחנו אוהבות אותך עד הירח וחזרה 🌙'; } }, 
			'baby_letter_girls_2' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'יום הולדת שמח אמא! 🎂\nהיום אנחנו מבטיחות לא לריב על מי יושבת לידך (לפחות עד הערב).\nתודה שאת תמיד שם בשבילנו. אוהבות אותך המון!'; case GenderContext.male: return 'יום הולדת שמח אבא! 🎂\nהיום אנחנו מבטיחות לא לריב על מי יושבת לידך (לפחות עד הערב).\nתודה שאתה תמיד שם בשבילנו. אוהבות אותך המון!'; } }, 
			'baby_letter_hint' => ({required Object name}) => 'המכתב של ${name} ✍️',
			'baby_letter_kids_1' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'אמא שלנו,\nאנחנו עוד קטנים מכדי לכתוב (עזרו לנו קצת 🙈), אבל דבר אחד אנחנו יודעים בטוח: את האמא הכי טובה בעולם.\nתודה על כל החיבוקים, השירים והצחוקים.\nמזל טוב ליום ההולדת! אנחנו אוהבים אותך עד הירח וחזרה 🌙'; case GenderContext.male: return 'אבא שלנו,\nאנחנו עוד קטנים מכדי לכתוב (עזרו לנו קצת 🙈), אבל דבר אחד אנחנו יודעים בטוח: אתה האבא הכי טוב בעולם.\nתודה על כל החיבוקים, השירים והצחוקים.\nמזל טוב ליום ההולדת! אנחנו אוהבים אותך עד הירח וחזרה 🌙'; } }, 
			'baby_letter_kids_2' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'יום הולדת שמח אמא! 🎂\nהיום אנחנו מבטיחים לא לריב על מי יושב לידך (לפחות עד הערב).\nתודה שאת תמיד שם בשבילנו. אוהבים אותך המון!'; case GenderContext.male: return 'יום הולדת שמח אבא! 🎂\nהיום אנחנו מבטיחים לא לריב על מי יושב לידך (לפחות עד הערב).\nתודה שאתה תמיד שם בשבילנו. אוהבים אותך המון!'; } }, 
			'baby_letter_title' => ({required Object name}) => 'מכתב מ${name}',
			'back' => 'חזור',
			'birthday_calendar' => 'לו"ז יום הולדת',
			'birthday_calendar_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'בואי לבנות את הלו"ז הכי מגניב וכיפי ליום ההולדת של בן הזוג שלך! תכנני לו יום מושלם מלא בהפתעות ופעילויות בלתי נשכחות.'; case GenderContext.male: return 'בוא לבנות את הלו"ז הכי מגניב וכיפי ליום ההולדת של בת הזוג שלך! תכנן לה יום מושלם מלא בהפתעות ופעילויות בלתי נשכחות.'; } }, 
			'birthday_suprise' => 'הפתעת יום הולדת',
			'birthday_suprise_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'בואי לבנות את הפתעת יום ההולדת, אבל ששששש... עד שתיפתחי את זה, זה יישאר נעול אצל בן הזוג שלך!'; case GenderContext.male: return 'בוא לבנות את הפתעת יום ההולדת, אבל ששששש... עד שתפתח את זה, זה יישאר נעול אצל בת הזוג שלך!'; } }, 
			'boy' => 'בן',
			'build_app' => 'בונה את האפליקציה',
			'build_app_description' => 'האפליקציה נבנית כרגע במיוחד בשבילך!',
			'cancel' => 'ביטול',
			'cant_upload_more_than' => ({required GenderContext context, required Object number}) { switch (context) { case GenderContext.female: return 'את לא יכולה להעלות יותר מ-${number} קבצים'; case GenderContext.male: return 'אתה לא יכול להעלות יותר מ-${number} קבצים'; } }, 
			'capsule_add_my_letter' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'הוסיפי את המכתב שלך ✍️'; case GenderContext.male: return 'הוסף את המכתב שלך ✍️'; } }, 
			'capsule_birthday_18' => ({required Object name}) => 'יום הולדת 18 של ${name}',
			'capsule_date_required' => 'צריך לבחור מתי הקפסולה תיפתח',
			'capsule_edit_my_letter' => 'עריכת המכתב שלי',
			'capsule_for' => ({required Object name}) => 'קפסולת זמן ל${name}',
			'capsule_in_a_year' => 'בעוד שנה',
			'capsule_letter_hint' => ({required Object name}) => 'מה תרצו להגיד ל${name} בעתיד?',
			'capsule_letter_of' => ({required Object name}) => 'המכתב של ${name}',
			'capsule_next_birthday' => ({required Object name}) => 'יום ההולדת הבא של ${name}',
			'capsule_opened' => ({required Object name}) => 'הקפסולה של ${name} נפתחה! 🎉',
			'capsule_opens_at' => ({required Object date}) => 'נפתחת ב־${date}',
			'capsule_opens_on' => 'מתי הקפסולה תיפתח?',
			'capsule_other_date' => 'תאריך אחר',
			'capsule_partner_sealed' => ({required Object name}) => '💌 יש בקפסולה גם מכתב של ${name}',
			'capsule_your_letter' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'המכתב שלך לקפסולה'; case GenderContext.male: return 'המכתב שלך לקפסולה'; } }, 
			'category_deleted' => 'הקטגוריה הזו נמחקה',
			'celebrant' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'חוגגת'; case GenderContext.male: return 'חוגג'; } }, 
			'change_color' => 'שינוי צבע',
			'change_gender' => 'שינוי מין',
			'change_language' => 'שינוי שפה',
			'change_password' => 'שנה סיסמה',
			'change_plan' => 'שינוי תוכנית',
			'child_birth_date' => 'תאריך לידה',
			'child_birth_date_required' => 'צריך לבחור תאריך לידה',
			'child_name' => 'שם',
			'child_name_required' => 'צריך למלא שם',
			'child_photo_required' => 'צריך תמונה של כל אחד מהילדים',
			'child_removed' => 'חלק מהילדים של הקטגוריה הזו הוסרו מההגדרות',
			'children' => 'ילדים',
			'children_photos' => 'תמונות הילדים',
			'children_unlock_explanation' => 'לפי הגילאים של הילדים ייפתחו קטגוריות משפחתיות: מכתב מהקטנים, אבני דרך, סטטיסטיקות הורות ועוד 👶',
			'choose_at_least_one_child' => 'צריך לבחור לפחות ילד אחד',
			'choose_category' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'בחרי קטגוריה'; case GenderContext.male: return 'בחר קטגוריה'; } }, 
			'choose_child' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'על מי הקטגוריה? (אפשר כמה)'; case GenderContext.male: return 'על מי הקטגוריה? (אפשר כמה)'; } }, 
			'choose_color' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'בחרי צבע מקשת צבעים'; case GenderContext.male: return 'בחר צבע מקשת צבעים'; } }, 
			'choose_couple_profile_image' => 'בחר/י תמונת פרופיל זוגית שלכם',
			'choose_coupons' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'בחרי 3 קופונים שתוכלי לממש מתי שתרצי:'; case GenderContext.male: return 'בחר 3 קופונים שתוכל לממש מתי שתרצה:'; } }, 
			'choose_currect_answer' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'בחרי את התשובה הנכונה'; case GenderContext.male: return 'בחר את התשובה הנכונה'; } }, 
			'choose_day_hint' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'בחרי יום בלוח כדי לראות מה מתוכנן 👆'; case GenderContext.male: return 'בחר יום בלוח כדי לראות מה מתוכנן 👆'; } }, 
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
			'couple_categories' => '💑 קטגוריות זוגיות',
			'coupon_idea_breakfast_in_bed' => 'ארוחת בוקר במיטה',
			'coupon_idea_date_night' => 'ערב זוגי, הבייביסיטר עליי',
			'coupon_idea_diaper_pass' => 'פטור מהחלפת טיטולים ליום',
			'coupon_idea_friends_night' => 'ערב חופשי עם חברים',
			'coupon_idea_full_night' => 'לילה שלם בלי לקום 😴',
			'coupon_idea_long_shower' => 'מקלחת ארוכה בלי הפרעות',
			'coupon_idea_massage' => 'עיסוי של חצי שעה',
			'coupon_idea_sleep_in' => 'בוקר של שינה עד מאוחר',
			'coupon_ideas' => 'רעיונות:',
			'coupon_number' => ({required Object n}) => 'קופון ${n}',
			'coupon_seat' => 'מושב',
			'coupon_stub' => 'ספח',
			'coupon_valid_forever' => 'תוקף // ללא הגבלה',
			'coupons_left' => ({required Object n}) => 'קופונים שנשארו: ${n}',
			'create_greeting_using_ai' => 'צור ברכה באמצעות AI',
			'current_plan' => 'תוכנית נוכחית',
			'date_of_birth' => 'תאריך לידה',
			'days' => 'ימים',
			'days_of_parenting' => 'ימים של הורות',
			'default_error' => 'ההתחברות או ההרשמה נכשלו. בבקשה נסה שוב',
			'delete' => 'מחיקה',
			'delete_account' => 'מחיקת חשבון',
			'delete_account_description' => 'פעולה זו תמחק לצמיתות את החשבון, את הגישה של בן/בת הזוג ואת כל התמונות, הסרטונים וההודעות בהפתעה. לא ניתן לבטל פעולה זו.',
			'delete_account_failed' => 'לא הצלחנו למחוק את החשבון. כדאי לבדוק את החיבור ולנסות שוב.',
			'delete_account_sure' => 'למחוק את החשבון?',
			'delete_child_description' => 'קטגוריות שכבר נוצרו לא יימחקו.',
			'delete_wishes' => 'מחיקת המשאלות',
			'delete_wishes_description' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'אם המשאלות לא עומדות בחוזה ניתן למחוק ואז ${name} יוכל למלא מחדש'; case GenderContext.male: return 'אם המשאלות לא עומדות בחוזה ניתן למחוק ואז ${name} תוכל למלא מחדש'; } }, 
			'description' => 'תיאור',
			'display_result' => 'הראה תוצאות',
			'display_wishes' => 'הצג משאלות',
			'drag_to_reorder' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'גררי את הכרטיסים (או לחיצה ארוכה) כדי לקבוע את הסדר ש${name} יראה ↕️'; case GenderContext.male: return 'גרור את הכרטיסים (או לחיצה ארוכה) כדי לקבוע את הסדר ש${name} תראה ↕️'; } }, 
			'drag_to_tear' => 'גררו לקריעה',
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
			'family_categories' => '👨‍👩‍👧 קטגוריות משפחה',
			'feature_ears' => 'האוזניים',
			'feature_eyes' => 'העיניים',
			'feature_hair' => 'השיער',
			'feature_hands' => 'הידיים',
			'feature_laugh' => 'הצחוק',
			'feature_mouth' => 'הפה',
			'feature_nose' => 'האף',
			'feature_smile' => 'החיוך',
			'feature_temper' => 'העצבים 😅',
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
			'girl' => 'בת',
			'got_full_app' => 'אז קיבלת אפליקציה שלמה רק בשביל זה',
			'greeter' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'ברוכה הבאה ${name}'; case GenderContext.male: return 'ברוך הבא ${name}'; } }, 
			'greeting_before_edit' => 'ברכה לפני עריכה',
			'greeting_first_login' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return '${name} הכין לך את ההפתעה הכי מגניבה שיש!\nאפליקציה שנבנתה במיוחד בשבילך, ליום ההולדת שלך!\nכאן תמצאי ברכה אישית מהלב,\nתמונות משותפות שלכם מכל הרגעים הכי יפים,\nועוד הפתעות שרק יחממו לך את הלב,\nכי מגיע לך את כל הטוב שבעולם!\nאז תתכונני, זו הולכת להיות חגיגה בלתי נשכחת!🎉🎉🎉'; case GenderContext.male: return '${name} הכינה לך את ההפתעה הכי מגניבה שיש!\nאפליקציה שנבנתה במיוחד בשבילך, ליום ההולדת שלך!\nכאן תמצא ברכה אישית מהלב,\nתמונות משותפות שלכם מכל הרגעים הכי יפים,\nועוד הפתעות שרק יחממו לך את הלב,\nכי מגיע לך את כל הטוב שבעולם!\nאז תתכונן, זו הולכת להיות חגיגה בלתי נשכחת!🎉🎉🎉'; } }, 
			'greeting_notes' => '* השמות שלכם ירשמו באופן אוטומטי\n* הגיל של הבן/בת זוג ירשם באופן אוטומטי\n* לאחר קבלת הברכה תוכלו לערוך אותה כמו שרק תרצו',
			'have_account' => 'יש משתמש',
			'hide_password' => 'הסתר סיסמה',
			'home_screen' => 'מסך בית',
			'hours' => 'שעות',
			'how_it_grew' => 'איך זה הצטבר 📈',
			'indicating' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'מציינת'; case GenderContext.male: return 'מציין'; } }, 
			'info' => 'מידע',
			'invalid_credential' => 'כתובת המייל או הסיסמה לא נכונים, נא נסה שנית',
			'later' => 'אחר כך',
			'less' => 'פחות',
			'lets_continue' => 'בואו נתקדם!',
			'lets_try' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'בואי ננסה!'; case GenderContext.male: return 'בוא ננסה!'; } }, 
			'letter_from' => ({required Object name}) => 'מכתב מ${name} 💌',
			'letter_template_number' => ({required Object n}) => 'מכתב מוכן ${n}',
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
			'look_alike' => 'מי דומה למי?',
			'look_alike_agreed' => ({required Object agreed, required Object total}) => 'הסכמתם ב־${agreed} מתוך ${total} ניחושים 🤝',
			'look_alike_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'עיניים, אף, חיוך... למי הילדים דומים יותר? בסוף מגלים מי ניצח 👑'; case GenderContext.male: return 'עיניים, אף, חיוך... למי הילדים דומים יותר? בסוף מגלים מי ניצח 👑'; } }, 
			'look_alike_editor_explanation' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'העלי תמונה של כל ילד ושל שניכם, מאותו גיל אם יש ואם אין אז עדכנית. אפשר גם לנחש בעצמך ולגלות בסוף אם הסכמתם.'; case GenderContext.male: return 'העלה תמונה של כל ילד ושל שניכם, מאותו גיל אם יש ואם אין אז עדכנית. אפשר גם לנחש בעצמך ולגלות בסוף אם הסכמתם.'; } }, 
			'look_alike_tie' => ({required Object name}) => 'תיקו! ${name}: שילוב מושלם של שניכם 💞',
			'look_alike_title' => ({required Object name}) => 'למי ${name} דומים?',
			'look_alike_winner_boy' => ({required Object name, required Object parent}) => '${name} דומה ל${parent}! 🎉',
			'look_alike_winner_girl' => ({required Object name, required Object parent}) => '${name} דומה ל${parent}! 🎉',
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
			'milestone_note' => 'כמה מילים (לא חובה)',
			'milestone_title' => 'מה קרה?',
			'milestone_title_required' => 'צריך לכתוב מה קרה',
			'milestones' => 'אבני דרך',
			'milestones_count' => ({required Object n, required Object name}) => '${n} אבני דרך של ${name}',
			'milestones_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'ציר זמן מתוק של כל הפעמים הראשונות: חיוך ראשון, צעד ראשון ועוד 👣'; case GenderContext.male: return 'ציר זמן מתוק של כל הפעמים הראשונות: חיוך ראשון, צעד ראשון ועוד 👣'; } }, 
			'milestones_editor_explanation' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'הוסיפי את הרגעים הראשונים עם תאריך, ואם תרצי גם תמונה. הגיל בכל רגע מחושב לבד.'; case GenderContext.male: return 'הוסף את הרגעים הראשונים עם תאריך, ואם תרצה גם תמונה. הגיל בכל רגע מחושב לבד.'; } }, 
			'milestones_title' => ({required Object name}) => 'הפעמים הראשונות של ${name}',
			'minutes' => 'דקות',
			'month' => 'חודש',
			'more' => 'יותר',
			'more_few_seconds' => 'בעוד כמה שניות נוכל להתחיל לבנות את המתנה המושלמת!',
			'more_firsts_coming' => 'ועוד המון פעמים ראשונות בדרך...',
			'ms_crawled' => 'זחילה ראשונה',
			'ms_first_birthday' => 'יום הולדת ראשון',
			'ms_first_daycare' => 'יום ראשון בגן',
			'ms_first_food' => 'אוכל ראשון',
			'ms_first_haircut' => 'תספורת ראשונה',
			'ms_first_smile' => 'חיוך ראשון',
			'ms_first_steps' => 'צעדים ראשונים',
			'ms_first_tooth' => 'שן ראשונה',
			'ms_first_word' => 'מילה ראשונה',
			'ms_rolled_over' => 'התהפכות ראשונה',
			'ms_sat_up' => 'ישיבה ראשונה',
			'ms_slept_through' => 'לילה שלם ראשון',
			'my_dear' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'היקרה'; case GenderContext.male: return 'היקר'; } }, 
			'names_and' => ({required Object first, required Object last}) => '${first} ו${last}',
			'new_badge' => 'חדש',
			'new_child' => 'ילד/ה חדש/ה',
			'new_password' => 'סיסמה חדשה',
			'new_password_verification' => 'אימות סיסמה חדשה',
			'no' => 'לא',
			'no_account' => 'אין משתמש',
			'no_allow_text_empty' => 'לא ניתן להשאיר טקסט ריק',
			'no_category_added' => 'לא הוספת קטגרויות לאירוע זה',
			'no_children_yet' => 'עוד לא הוספתם ילדים',
			'no_events_this_day' => 'אין תוכניות ביום הזה... עדיין 😉',
			'no_milestones_yet' => 'עוד אין אבני דרך. זה הזמן להוסיף את הראשונה!',
			'no_owner' => 'המשתמש לא משתמש ניהולי',
			'no_questions_add' => 'לא הועלו שאלות עדיין',
			'no_required' => 'לא חובה',
			'no_wish_yet' => 'אין עדיין משאלות',
			'not_played_yet' => 'עוד לא שוחק',
			'not_written_yet' => 'עוד לא נכתב',
			'nothing_here_yet' => 'אין כאן עדיין כלום',
			'num_mistakes' => 'מספר טעויות',
			'num_of_questions' => ({required Object number}) => 'יש לך כרגע ${number} שאלות',
			'ok' => 'אישור',
			'open_it' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'פתחי'; case GenderContext.male: return 'פתח'; } }, 
			'open_new_memory_game' => 'פתיחת גישה למשחק חדש',
			'open_new_quiz_game' => 'פתיחת גישה לטריוויה חדשה',
			'operation_not_allowed' => 'שגיאת שרת, אנא נסה שוב מאוחר יותר',
			'otp_code' => 'קוד אימות',
			'otp_code_description' => 'קיבלת הודעת SMS עם קוד אימות.\nנא לרשום אותו וללחוץ אישור',
			'parent_coupon_label' => 'קופון הורות',
			'parent_coupons' => 'שוברי הורות',
			'parent_coupons_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'כתבי חוזה קטן, ובן הזוג שלך יבחר 3 קופונים להורים עייפים: כרטיסים שקורעים כשמממשים 🎟️'; case GenderContext.male: return 'כתוב חוזה קטן, ובת הזוג שלך תבחר 3 קופונים להורים עייפים: כרטיסים שקורעים כשמממשים 🎟️'; } }, 
			'parent_photo_hint' => ({required Object age}) => 'עדיף תמונה שלכם בגיל ${age}. אין? גם תמונה עדכנית תעשה את העבודה 😉',
			'parent_stats' => 'סטטיסטיקות הורות',
			'parent_stats_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'כמה טיטולים, כמה קפה, כמה לילות לבנים? מספרים מצחיקים עם גרפים, לפי הימים מאז הלידה 📊'; case GenderContext.male: return 'כמה טיטולים, כמה קפה, כמה לילות לבנים? מספרים מצחיקים עם גרפים, לפי הימים מאז הלידה 📊'; } }, 
			'parent_stats_editor_explanation' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'כמה בממוצע ביום לכל ילד? הסכומים מחושבים לבד לפי הימים מאז הלידה. 0 מסתיר את השורה.'; case GenderContext.male: return 'כמה בממוצע ביום לכל ילד? הסכומים מחושבים לבד לפי הימים מאז הלידה. 0 מסתיר את השורה.'; } }, 
			'parent_stats_title' => ({required Object name}) => 'ההורות במספרים: ${name}',
			'parents_photos' => 'התמונות שלכם',
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
			'play_again' => ({required Object name}) => 'לתת ל${name} לשחק שוב',
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
			'quiz_game_played' => ({required GenderContext context, required Object name, required Object answered, required Object total, required Object score}) { switch (context) { case GenderContext.female: return '${name} ענה על ${answered} מתוך ${total} שאלות, ${score} נכונות'; case GenderContext.male: return '${name} ענתה על ${answered} מתוך ${total} שאלות, ${score} נכונות'; } }, 
			'quiz_verdict_good' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'לא רע בכלל! 😄'; case GenderContext.male: return 'לא רע בכלל! 😄'; } }, 
			'quiz_verdict_great' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'וואו! את באמת מכירה אותי 🏆'; case GenderContext.male: return 'וואו! אתה באמת מכיר אותי 🏆'; } }, 
			'quiz_verdict_low' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'יש לנו עוד מה ללמוד ביחד 😅'; case GenderContext.male: return 'יש לנו עוד מה ללמוד ביחד 😅'; } }, 
			'rate_app' => 'דרג את האפליקציה',
			'ready_letters' => 'מכתבים מוכנים:',
			'recommand_drak_colors' => 'מומלץ צבעים כהים',
			'recommended_colors' => 'צבעים מומלצים',
			'redeemed' => 'מומש',
			'register' => 'הרשמה',
			'register_screen' => 'מסך הרשמה',
			'relationship' => 'מערכת יחסים',
			'remove_question' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'הסירי שאלה'; case GenderContext.male: return 'הסר שאלה'; } }, 
			'remove' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'הסירי'; case GenderContext.male: return 'הסר'; } }, 
			'reorder' => 'שינוי סדר',
			'replace_photo' => 'החלפת תמונה',
			'required_fill_all_answer' => 'חובה למלא את כל התשובות',
			'required_fill_question' => 'חובה למלא את השאלה',
			'save' => 'שמור',
			'save_and_lock' => 'שמור ונעל',
			'save_and_print_coupons' => 'שמירה והדפסה 🎟️',
			'score' => 'תוצאה',
			'seal_letter' => 'חתימה בקפסולה 🔒',
			'sealed' => 'חתום',
			'second_question' => 'שאלה שנייה',
			'second_wish' => 'משאלה שנייה',
			'seconds' => 'שניות',
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
			'so_far' => 'עד היום',
			'something_went_wrong' => 'משהו השתבש. נסו שוב',
			'soon' => 'בקרוב',
			'soul_mate' => 'נפש תאומה',
			'special_age' => ({required Object age}) => 'גיל ${age} זה גיל מיוחד',
			'spouse' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'בת זוגתי'; case GenderContext.male: return 'בן זוגי'; } }, 
			'stat_coffee' => 'כוסות קפה',
			'stat_daily_coffee' => 'כוסות קפה ביום',
			'stat_daily_diapers' => 'טיטולים ביום',
			'stat_daily_feedings' => 'האכלות ביום',
			'stat_daily_kisses' => 'נשיקות ביום',
			'stat_daily_laundry' => 'מכונות כביסה ביום',
			'stat_daily_lullabies' => 'שירי ערש ביום',
			'stat_daily_night_wakeups' => 'השכמות בלילה',
			'stat_diapers' => 'טיטולים הוחלפו',
			'stat_fact_coffee' => ({required Object liters, required Object baths}) => '${liters} ליטר קפה, מספיק למלא ${baths} אמבטיות ☕',
			'stat_fact_diapers' => ({required Object meters, required Object floors}) => 'ערימה בגובה ${meters} מטר, כמו בניין של ${floors} קומות 🏢',
			'stat_fact_feedings' => ({required Object liters}) => 'בערך ${liters} ליטר חלב 🍼',
			'stat_fact_kisses' => 'ועדיין לא מספיק 😍',
			'stat_fact_laundry' => ({required Object hours}) => '${hours} שעות של קיפול בגדים קטנטנים 🧦',
			'stat_fact_lullabies' => ({required Object hours}) => '${hours} שעות של הופעות חיות, בלי לקבל שקל 🎤',
			'stat_fact_night_wakeups' => ({required Object hours, required Object nights}) => '${hours} שעות ערים בלילה, ${nights} לילות שלמים בלי שינה 🥱',
			'stat_feedings' => 'האכלות',
			'stat_hidden' => 'מוסתר',
			'stat_kisses' => 'נשיקות',
			'stat_laundry' => 'מכונות כביסה',
			'stat_lullabies' => 'שירי ערש',
			'stat_night_wakeups' => 'השכמות בלילה',
			'stat_until_today' => ({required Object total}) => 'עד היום: ${total}',
			'suprise_screen_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'הוסיפי טקסט או תמונות, שחקי עם הסדר ביניהם וצרי את ההפתעה המושלמת!\nההפתעה תישאר סודית עד שתחליטי שהיא מוכנה לבן הזוג שלך!'; case GenderContext.male: return 'הוסף טקסט או תמונות, שחק עם הסדר ביניהם ותיצור את ההפתעה המושלמת!\nההפתעה תישאר סודית עד שתחליט שהיא מוכנה לבת הזוג שלך!'; } }, 
			'sure_delete_name' => ({required GenderContext context, required Object text}) { switch (context) { case GenderContext.female: return 'את בטוחה שאת רוצה למחוק את ${text}?'; case GenderContext.male: return 'אתה בטוח שאתה רוצה למחוק את ${text}?'; } }, 
			'sure_delete' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'את בטוחה שאת רוצה למחוק את האירוע הזה?'; case GenderContext.male: return 'אתה בטוח שאתה רוצה למחוק את האירוע הזה?'; } }, 
			'sure_logout' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'את בטוחה שאת רוצה להתנתק?'; case GenderContext.male: return 'אתה בטוח שאתה רוצה להתנתק?'; } }, 
			'tap_to_open_gift' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'לחצי על המתנה כדי לפתוח 🎁'; case GenderContext.male: return 'לחץ על המתנה כדי לפתוח 🎁'; } }, 
			'tap_to_open' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'לחצי כדי לפתוח 💌'; case GenderContext.male: return 'לחץ כדי לפתוח 💌'; } }, 
			'tear_coupon_explanation' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'רוצה לממש קופון? גררי את הספח וקרעי אותו מול ${name} 😉'; case GenderContext.male: return 'רוצה לממש קופון? גרור את הספח וקרע אותו מול ${name} 😉'; } }, 
			'text' => 'טקסט',
			'text_appear_required' => 'נא למלא את הטקסט',
			'text_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'יאללה, תשלפי ברכה מהלב או כתבי איזה טקסט קורע שתרצי!'; case GenderContext.male: return 'יאללה, תשלוף ברכה מהלב או כתוב איזה טקסט קורע שתרצה!'; } }, 
			'the_image' => 'התמונה',
			'the_text' => 'הטקסט',
			'third_question' => 'שאלה שלישית',
			'third_wish' => 'משאלה שלישית',
			'time_capsule' => 'קפסולת זמן',
			'time_capsule_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'כתבי מכתב לילדים שייפתח רק בתאריך שתבחרי: יום ההולדת הבא, גיל 18... ⏳'; case GenderContext.male: return 'כתוב מכתב לילדים שייפתח רק בתאריך שתבחר: יום ההולדת הבא, גיל 18... ⏳'; } }, 
			'time_capsule_editor_explanation' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'כתבי מכתב ובחרי מתי הקפסולה תיפתח. גם ${name} יוכל להוסיף מכתב משלו, והכול יישאר נעול עד התאריך.'; case GenderContext.male: return 'כתוב מכתב ובחר מתי הקפסולה תיפתח. גם ${name} תוכל להוסיף מכתב משלה, והכול יישאר נעול עד התאריך.'; } }, 
			'time_capsule_title' => ({required Object name}) => 'קפסולת זמן ל${name}',
			'title' => 'כותרת',
			'title_appear_category' => 'הכותרת שתופיע לקטגוריה זו',
			'title_appear_required' => 'נא למלא את הכותרת',
			'title_calendar' => ({required Object name}) => 'היום המושלם של ${name} 🗓️',
			'title_memory' => 'משחק הזיכרון שלנו 🧠',
			'title_pictures' => 'התמונות שלנו 📸',
			'title_quiz' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'כמה את מכירה אותי? 🤔'; case GenderContext.male: return 'כמה אתה מכיר אותי? 🤔'; } }, 
			'title_surprise' => ({required Object name}) => 'הפתעה ל${name} 🎁',
			'title_text' => ({required Object name}) => 'ברכה ל${name} 💌',
			'title_videos' => 'הסרטונים שלנו 🎬',
			'title_wishes' => ({required Object name}) => '3 משאלות ל${name} 🧞',
			'too_many_requests' => 'יותר מדי בקשות להתחבר לחשבון זה',
			'true_' => 'נכון',
			'true_false_question' => 'שאלת נכון או לא נכון',
			'two_weeks' => 'שבועיים',
			'typical_day' => 'יום טיפוסי אצלנו',
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
			'whats_new_add_children' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'קטגוריות חדשות להורים! הוסיפי את הילדים בהגדרות, ולפי הגילאים שלהם ייפתחו קטגוריות מיוחדות.'; case GenderContext.male: return 'קטגוריות חדשות להורים! הוסף את הילדים בהגדרות, ולפי הגילאים שלהם ייפתחו קטגוריות מיוחדות.'; } }, 
			'whats_new_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'קטגוריות חדשות למשפחה, לפי הגילאים של הילדים שלכם. לחצי על הכפתור כדי לנסות!'; case GenderContext.male: return 'קטגוריות חדשות למשפחה, לפי הגילאים של הילדים שלכם. לחץ על הכפתור כדי לנסות!'; } }, 
			'whats_new_partner_description' => ({required GenderContext context, required Object title, required Object name}) { switch (context) { case GenderContext.female: return 'חדש אצלך: ${title}, מאת ${name} 🎁 לחצי כדי לפתוח!'; case GenderContext.male: return 'חדש אצלך: ${title}, מאת ${name} 🎁 לחץ כדי לפתוח!'; } }, 
			'whats_new_partner_intro' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'חדש: קטגוריות משפחתיות! מכתב מהקטנים, אבני דרך ועוד. הוסיפי את הילדים בהגדרות, וכך גם ל${name} יהיו קטגוריות חדשות להפתיע אותך 👶'; case GenderContext.male: return 'חדש: קטגוריות משפחתיות! מכתב מהקטנים, אבני דרך ועוד. הוסף את הילדים בהגדרות, וכך גם ל${name} יהיו קטגוריות חדשות להפתיע אותך 👶'; } }, 
			'whats_new_partner_title' => 'יש לך הפתעה חדשה!',
			'whats_new_title' => 'קטגוריות למשפחה!',
			'whose_feature' => ({required Object feature, required Object name}) => '${feature} של ${name}: של מי?',
			'wish_list_lock_description' => ({required Object name}) => 'כדי לפתוח אותה אנא בקשו מ${name} הזדמנות חדשה',
			'wish_list_lock_title' => 'רשימת המשאלות נעולה',
			'wishes_list' => 'רשימת משאלות',
			'wishes_list_description' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'הוספי אפשרות ל${name} לבחור 3 משאלות:\nרשמי לו "חוזה" קטן, ככה שהוא לא יוכל להגזים!'; case GenderContext.male: return 'הוסף אפשרות ל${name} לבחור 3 משאלות:\nרשום לה "חוזה" קטן, ככה שהיא לא תוכל להגזים!'; } }, 
			'with_love' => 'באהבה',
			'write_calendar_time_to' => ({required Object title}) => 'רשום לו"ז ל: ${title}',
			'write_contract' => 'רשום חוזה',
			'write_contract_to' => ({required Object title}) => 'רשום חוזה ל: ${title}',
			'write_text' => 'רשום טקסט',
			'write_text_to' => ({required Object title}) => 'רשום טקסט ל: ${title}',
			'wrong_password' => 'הסיסמה לא נכונה, נא נסה שנית',
			'yes' => 'כן',
			'you_answer_from' => ({required Object answers, required Object questions}) => 'ענית נכון על ${answers} מתוך ${questions} שאלות',
			'you_win' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'את ניצחת!'; case GenderContext.male: return 'אתה ניצחת!'; } }, 
			'your_guess_optional' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'הניחושים שלך (לא חובה)'; case GenderContext.male: return 'הניחושים שלך (לא חובה)'; } }, 
			_ => null,
		};
	}
}
