///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	dynamic operator[](String key) => _meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: '(female) {Have kids? Add them in the settings to unlock new family categories 🎉} (male) {Have kids? Add them in the settings to unlock new family categories 🎉}'
	String add_children_to_unlock({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Have kids? Add them in the settings to unlock new family categories 🎉';
			case GenderContext.male:
				return 'Have kids? Add them in the settings to unlock new family categories 🎉';
		}
	}

	/// en: '(female) {Add children} (male) {Add children}'
	String add_children({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Add children';
			case GenderContext.male:
				return 'Add children';
		}
	}

	/// en: '(female) {Add a child} (male) {Add a child}'
	String add_child({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Add a child';
			case GenderContext.male:
				return 'Add a child';
		}
	}

	/// en: '(female) {Add Event to $date} (male) {Add Event to $date}'
	String add_event_date({required GenderContext context, required Object date}) {
		switch (context) {
			case GenderContext.female:
				return 'Add Event to ${date}';
			case GenderContext.male:
				return 'Add Event to ${date}';
		}
	}

	/// en: '(female) {Add Event} (male) {Add Event}'
	String add_event({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Add Event';
			case GenderContext.male:
				return 'Add Event';
		}
	}

	/// en: 'Add Free Text'
	String get add_free_text => 'Add Free Text';

	/// en: 'Add Image'
	String get add_image => 'Add Image';

	/// en: 'Add a milestone'
	String get add_milestone => 'Add a milestone';

	/// en: 'Add a photo (optional)'
	String get add_photo_optional => 'Add a photo (optional)';

	/// en: 'Add picture'
	String get add_picture => 'Add picture';

	/// en: 'Add pictures'
	String get add_pictures => 'Add pictures';

	/// en: 'Add pictures for: $title'
	String add_pictures_to({required Object title}) => 'Add pictures for: ${title}';

	/// en: '(female) {Add Question} (male) {Add Question}'
	String add_question({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Add Question';
			case GenderContext.male:
				return 'Add Question';
		}
	}

	/// en: 'Add Quiz to: $title'
	String add_quiz_to({required Object title}) => 'Add Quiz to: ${title}';

	/// en: 'Add a Surprise'
	String get add_suprise => 'Add a Surprise';

	/// en: 'Add text'
	String get add_text => 'Add text';

	/// en: 'Add text and pictures for: $title'
	String add_text_pictures_description({required Object title}) => 'Add text and pictures for: ${title}';

	/// en: 'Add videos'
	String get add_videos => 'Add videos';

	/// en: 'Add videos for: $title'
	String add_videos_to({required Object title}) => 'Add videos for: ${title}';

	/// en: '(female) {Add} (male) {Add}'
	String add({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Add';
			case GenderContext.male:
				return 'Add';
		}
	}

	/// en: 'Age'
	String get age => 'Age';

	/// en: '$first and $second'
	String age_and({required Object first, required Object second}) => '${first} and ${second}';

	/// en: '1 day'
	String get age_day_one => '1 day';

	/// en: '2 days'
	String get age_day_two => '2 days';

	/// en: '$n days'
	String age_days({required Object n}) => '${n} days';

	/// en: '1 month'
	String get age_month_one => '1 month';

	/// en: '2 months'
	String get age_month_two => '2 months';

	/// en: '$n months'
	String age_months({required Object n}) => '${n} months';

	/// en: '1 year'
	String get age_year_one => '1 year';

	/// en: '2 years'
	String get age_year_two => '2 years';

	/// en: '$n years'
	String age_years({required Object n}) => '${n} years';

	/// en: 'All coupons redeemed! 🎉'
	String get all_coupons_redeemed => 'All coupons redeemed! 🎉';

	/// en: 'App Info'
	String get app_info => 'App Info';

	/// en: 'App Name'
	String get app_name => 'App Name';

	/// en: 'App Version'
	String get app_version => 'App Version';

	/// en: 'at $age'
	String at_age({required Object age}) => 'at ${age}';

	/// en: 'A letter from the kids'
	String get baby_letter => 'A letter from the kids';

	/// en: '(female) {My Mom, I'm only $age old and can't write yet (they helped me a little 🙈), but one thing I already know for sure: you're the best mom in the world. Thank you for every hug, every lullaby and every time you made me laugh. Happy birthday! I love you to the moon and back 🌙} (male) {My Dad, I'm only $age old and can't write yet (they helped me a little 🙈), but one thing I already know for sure: you're the best dad in the world. Thank you for every hug, every lullaby and every time you made me laugh. Happy birthday! I love you to the moon and back 🌙}'
	String baby_letter_boy_1({required GenderContext context, required Object age}) {
		switch (context) {
			case GenderContext.female:
				return 'My Mom,\nI\'m only ${age} old and can\'t write yet (they helped me a little 🙈), but one thing I already know for sure: you\'re the best mom in the world.\nThank you for every hug, every lullaby and every time you made me laugh.\nHappy birthday! I love you to the moon and back 🌙';
			case GenderContext.male:
				return 'My Dad,\nI\'m only ${age} old and can\'t write yet (they helped me a little 🙈), but one thing I already know for sure: you\'re the best dad in the world.\nThank you for every hug, every lullaby and every time you made me laugh.\nHappy birthday! I love you to the moon and back 🌙';
		}
	}

	/// en: '(female) {Mom, A few things I wanted to tell you: 1. When you hold me, I feel the safest in the world. 2. Sorry about the sleepless nights. Kind of. 3. When you smile at me, I smile back. Always. Happy birthday to my very own mom!} (male) {Dad, A few things I wanted to tell you: 1. When you hold me, I feel the safest in the world. 2. Sorry about the sleepless nights. Kind of. 3. When you smile at me, I smile back. Always. Happy birthday to my very own dad!}'
	String baby_letter_boy_2({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Mom,\nA few things I wanted to tell you:\n1. When you hold me, I feel the safest in the world.\n2. Sorry about the sleepless nights. Kind of.\n3. When you smile at me, I smile back. Always.\nHappy birthday to my very own mom!';
			case GenderContext.male:
				return 'Dad,\nA few things I wanted to tell you:\n1. When you hold me, I feel the safest in the world.\n2. Sorry about the sleepless nights. Kind of.\n3. When you smile at me, I smile back. Always.\nHappy birthday to my very own dad!';
		}
	}

	/// en: '(female) {Happy birthday Mom! 🎂 Today you're allowed to sleep in (no promises 😇). Thank you for always being there for me. Love you so so much!} (male) {Happy birthday Dad! 🎂 Today you're allowed to sleep in (no promises 😇). Thank you for always being there for me. Love you so so much!}'
	String baby_letter_boy_3({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Happy birthday Mom! 🎂\nToday you\'re allowed to sleep in (no promises 😇).\nThank you for always being there for me. Love you so so much!';
			case GenderContext.male:
				return 'Happy birthday Dad! 🎂\nToday you\'re allowed to sleep in (no promises 😇).\nThank you for always being there for me. Love you so so much!';
		}
	}

	/// en: '(female) {Write a moving letter in the kids' name, as if they wrote it themselves 👣} (male) {Write a moving letter in the kids' name, as if they wrote it themselves 👣}'
	String baby_letter_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Write a moving letter in the kids\' name, as if they wrote it themselves 👣';
			case GenderContext.male:
				return 'Write a moving letter in the kids\' name, as if they wrote it themselves 👣';
		}
	}

	/// en: '(female) {Write the letter in $name's voice. Start from a ready letter and make it yours.} (male) {Write the letter in $name's voice. Start from a ready letter and make it yours.}'
	String baby_letter_editor_explanation({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'Write the letter in ${name}\'s voice. Start from a ready letter and make it yours.';
			case GenderContext.male:
				return 'Write the letter in ${name}\'s voice. Start from a ready letter and make it yours.';
		}
	}

	/// en: '(female) {My Mom, I'm only $age old and can't write yet (they helped me a little 🙈), but one thing I already know for sure: you're the best mom in the world. Thank you for every hug, every lullaby and every time you made me laugh. Happy birthday! I love you to the moon and back 🌙} (male) {My Dad, I'm only $age old and can't write yet (they helped me a little 🙈), but one thing I already know for sure: you're the best dad in the world. Thank you for every hug, every lullaby and every time you made me laugh. Happy birthday! I love you to the moon and back 🌙}'
	String baby_letter_girl_1({required GenderContext context, required Object age}) {
		switch (context) {
			case GenderContext.female:
				return 'My Mom,\nI\'m only ${age} old and can\'t write yet (they helped me a little 🙈), but one thing I already know for sure: you\'re the best mom in the world.\nThank you for every hug, every lullaby and every time you made me laugh.\nHappy birthday! I love you to the moon and back 🌙';
			case GenderContext.male:
				return 'My Dad,\nI\'m only ${age} old and can\'t write yet (they helped me a little 🙈), but one thing I already know for sure: you\'re the best dad in the world.\nThank you for every hug, every lullaby and every time you made me laugh.\nHappy birthday! I love you to the moon and back 🌙';
		}
	}

	/// en: '(female) {Mom, A few things I wanted to tell you: 1. When you hold me, I feel the safest in the world. 2. Sorry about the sleepless nights. Kind of. 3. When you smile at me, I smile back. Always. Happy birthday to my very own mom!} (male) {Dad, A few things I wanted to tell you: 1. When you hold me, I feel the safest in the world. 2. Sorry about the sleepless nights. Kind of. 3. When you smile at me, I smile back. Always. Happy birthday to my very own dad!}'
	String baby_letter_girl_2({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Mom,\nA few things I wanted to tell you:\n1. When you hold me, I feel the safest in the world.\n2. Sorry about the sleepless nights. Kind of.\n3. When you smile at me, I smile back. Always.\nHappy birthday to my very own mom!';
			case GenderContext.male:
				return 'Dad,\nA few things I wanted to tell you:\n1. When you hold me, I feel the safest in the world.\n2. Sorry about the sleepless nights. Kind of.\n3. When you smile at me, I smile back. Always.\nHappy birthday to my very own dad!';
		}
	}

	/// en: '(female) {Happy birthday Mom! 🎂 Today you're allowed to sleep in (no promises 😇). Thank you for always being there for me. Love you so so much!} (male) {Happy birthday Dad! 🎂 Today you're allowed to sleep in (no promises 😇). Thank you for always being there for me. Love you so so much!}'
	String baby_letter_girl_3({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Happy birthday Mom! 🎂\nToday you\'re allowed to sleep in (no promises 😇).\nThank you for always being there for me. Love you so so much!';
			case GenderContext.male:
				return 'Happy birthday Dad! 🎂\nToday you\'re allowed to sleep in (no promises 😇).\nThank you for always being there for me. Love you so so much!';
		}
	}

	/// en: '(female) {Our Mom, We're still too little to write (they helped us a little 🙈), but one thing we know for sure: you're the best mom in the world. Thank you for all the hugs, songs and laughs. Happy birthday! We love you to the moon and back 🌙} (male) {Our Dad, We're still too little to write (they helped us a little 🙈), but one thing we know for sure: you're the best dad in the world. Thank you for all the hugs, songs and laughs. Happy birthday! We love you to the moon and back 🌙}'
	String baby_letter_girls_1({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Our Mom,\nWe\'re still too little to write (they helped us a little 🙈), but one thing we know for sure: you\'re the best mom in the world.\nThank you for all the hugs, songs and laughs.\nHappy birthday! We love you to the moon and back 🌙';
			case GenderContext.male:
				return 'Our Dad,\nWe\'re still too little to write (they helped us a little 🙈), but one thing we know for sure: you\'re the best dad in the world.\nThank you for all the hugs, songs and laughs.\nHappy birthday! We love you to the moon and back 🌙';
		}
	}

	/// en: '(female) {Happy birthday Mom! 🎂 Today we promise not to fight over who sits next to you (at least until the evening). Thank you for always being there for us. Love you lots!} (male) {Happy birthday Dad! 🎂 Today we promise not to fight over who sits next to you (at least until the evening). Thank you for always being there for us. Love you lots!}'
	String baby_letter_girls_2({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Happy birthday Mom! 🎂\nToday we promise not to fight over who sits next to you (at least until the evening).\nThank you for always being there for us. Love you lots!';
			case GenderContext.male:
				return 'Happy birthday Dad! 🎂\nToday we promise not to fight over who sits next to you (at least until the evening).\nThank you for always being there for us. Love you lots!';
		}
	}

	/// en: '$name's letter ✍️'
	String baby_letter_hint({required Object name}) => '${name}\'s letter ✍️';

	/// en: '(female) {Our Mom, We're still too little to write (they helped us a little 🙈), but one thing we know for sure: you're the best mom in the world. Thank you for all the hugs, songs and laughs. Happy birthday! We love you to the moon and back 🌙} (male) {Our Dad, We're still too little to write (they helped us a little 🙈), but one thing we know for sure: you're the best dad in the world. Thank you for all the hugs, songs and laughs. Happy birthday! We love you to the moon and back 🌙}'
	String baby_letter_kids_1({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Our Mom,\nWe\'re still too little to write (they helped us a little 🙈), but one thing we know for sure: you\'re the best mom in the world.\nThank you for all the hugs, songs and laughs.\nHappy birthday! We love you to the moon and back 🌙';
			case GenderContext.male:
				return 'Our Dad,\nWe\'re still too little to write (they helped us a little 🙈), but one thing we know for sure: you\'re the best dad in the world.\nThank you for all the hugs, songs and laughs.\nHappy birthday! We love you to the moon and back 🌙';
		}
	}

	/// en: '(female) {Happy birthday Mom! 🎂 Today we promise not to fight over who sits next to you (at least until the evening). Thank you for always being there for us. Love you lots!} (male) {Happy birthday Dad! 🎂 Today we promise not to fight over who sits next to you (at least until the evening). Thank you for always being there for us. Love you lots!}'
	String baby_letter_kids_2({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Happy birthday Mom! 🎂\nToday we promise not to fight over who sits next to you (at least until the evening).\nThank you for always being there for us. Love you lots!';
			case GenderContext.male:
				return 'Happy birthday Dad! 🎂\nToday we promise not to fight over who sits next to you (at least until the evening).\nThank you for always being there for us. Love you lots!';
		}
	}

	/// en: 'A letter from $name'
	String baby_letter_title({required Object name}) => 'A letter from ${name}';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Birthday Calendar'
	String get birthday_calendar => 'Birthday Calendar';

	/// en: '(female) {Plan the coolest and most fun schedule for your partner's birthday! Create a perfect day filled with surprises and unforgettable activities.} (male) {Plan the coolest and most fun schedule for your partner's birthday! Create a perfect day filled with surprises and unforgettable activities.}'
	String birthday_calendar_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Plan the coolest and most fun schedule for your partner\'s birthday! Create a perfect day filled with surprises and unforgettable activities.';
			case GenderContext.male:
				return 'Plan the coolest and most fun schedule for your partner\'s birthday! Create a perfect day filled with surprises and unforgettable activities.';
		}
	}

	/// en: 'Birthday Surprise'
	String get birthday_suprise => 'Birthday Surprise';

	/// en: '(female) {Create a birthday surprise, but shhh... it stays locked until your partner opens it!} (male) {Create a birthday surprise, but shhh... it stays locked until your partner opens it!}'
	String birthday_suprise_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Create a birthday surprise, but shhh... it stays locked until your partner opens it!';
			case GenderContext.male:
				return 'Create a birthday surprise, but shhh... it stays locked until your partner opens it!';
		}
	}

	/// en: 'Boy'
	String get boy => 'Boy';

	/// en: 'Building the App'
	String get build_app => 'Building the App';

	/// en: 'The app is currently being customized just for you!'
	String get build_app_description => 'The app is currently being customized just for you!';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: '(female) {You cannot upload more than $number files} (male) {You cannot upload more than $number files}'
	String cant_upload_more_than({required GenderContext context, required Object number}) {
		switch (context) {
			case GenderContext.female:
				return 'You cannot upload more than ${number} files';
			case GenderContext.male:
				return 'You cannot upload more than ${number} files';
		}
	}

	/// en: '(female) {Add your letter ✍️} (male) {Add your letter ✍️}'
	String capsule_add_my_letter({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Add your letter ✍️';
			case GenderContext.male:
				return 'Add your letter ✍️';
		}
	}

	/// en: '$name's 18th birthday'
	String capsule_birthday_18({required Object name}) => '${name}\'s 18th birthday';

	/// en: 'Choose when the capsule opens'
	String get capsule_date_required => 'Choose when the capsule opens';

	/// en: 'Edit my letter'
	String get capsule_edit_my_letter => 'Edit my letter';

	/// en: 'A time capsule for $name'
	String capsule_for({required Object name}) => 'A time capsule for ${name}';

	/// en: 'In a year'
	String get capsule_in_a_year => 'In a year';

	/// en: 'What would you like to tell $name in the future?'
	String capsule_letter_hint({required Object name}) => 'What would you like to tell ${name} in the future?';

	/// en: '$name's letter'
	String capsule_letter_of({required Object name}) => '${name}\'s letter';

	/// en: '$name's next birthday'
	String capsule_next_birthday({required Object name}) => '${name}\'s next birthday';

	/// en: '$name's capsule is open! 🎉'
	String capsule_opened({required Object name}) => '${name}\'s capsule is open! 🎉';

	/// en: 'Opens on $date'
	String capsule_opens_at({required Object date}) => 'Opens on ${date}';

	/// en: 'When does the capsule open?'
	String get capsule_opens_on => 'When does the capsule open?';

	/// en: 'Another date'
	String get capsule_other_date => 'Another date';

	/// en: '💌 $name sealed a letter in the capsule too'
	String capsule_partner_sealed({required Object name}) => '💌 ${name} sealed a letter in the capsule too';

	/// en: '(female) {Your letter for the capsule} (male) {Your letter for the capsule}'
	String capsule_your_letter({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Your letter for the capsule';
			case GenderContext.male:
				return 'Your letter for the capsule';
		}
	}

	/// en: 'This category was deleted'
	String get category_deleted => 'This category was deleted';

	/// en: '(female) {Celebrant} (male) {Celebrant}'
	String celebrant({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Celebrant';
			case GenderContext.male:
				return 'Celebrant';
		}
	}

	/// en: 'Change Color'
	String get change_color => 'Change Color';

	/// en: 'Change Gender'
	String get change_gender => 'Change Gender';

	/// en: 'Change Language'
	String get change_language => 'Change Language';

	/// en: 'Change Password'
	String get change_password => 'Change Password';

	/// en: 'Change Plan'
	String get change_plan => 'Change Plan';

	/// en: 'Date of birth'
	String get child_birth_date => 'Date of birth';

	/// en: 'Choose a date of birth'
	String get child_birth_date_required => 'Choose a date of birth';

	/// en: 'Name'
	String get child_name => 'Name';

	/// en: 'Fill in a name'
	String get child_name_required => 'Fill in a name';

	/// en: 'Add a photo of each child'
	String get child_photo_required => 'Add a photo of each child';

	/// en: 'Some of this category's children were removed in the settings'
	String get child_removed => 'Some of this category\'s children were removed in the settings';

	/// en: 'Children'
	String get children => 'Children';

	/// en: 'The kids' photos'
	String get children_photos => 'The kids\' photos';

	/// en: 'Your kids' ages unlock family categories: a letter from the kids, milestones, parenting stats and more 👶'
	String get children_unlock_explanation => 'Your kids\' ages unlock family categories: a letter from the kids, milestones, parenting stats and more 👶';

	/// en: 'Choose at least one child'
	String get choose_at_least_one_child => 'Choose at least one child';

	/// en: '(female) {Choose a category} (male) {Choose a category}'
	String choose_category({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Choose a category';
			case GenderContext.male:
				return 'Choose a category';
		}
	}

	/// en: '(female) {Who is it about? (you can pick several)} (male) {Who is it about? (you can pick several)}'
	String choose_child({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Who is it about? (you can pick several)';
			case GenderContext.male:
				return 'Who is it about? (you can pick several)';
		}
	}

	/// en: '(female) {Choose a color from the palette} (male) {Choose a color from the palette}'
	String choose_color({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Choose a color from the palette';
			case GenderContext.male:
				return 'Choose a color from the palette';
		}
	}

	/// en: 'Choose your couple's profile image'
	String get choose_couple_profile_image => 'Choose your couple\'s profile image';

	/// en: '(female) {Pick 3 coupons to redeem whenever you like:} (male) {Pick 3 coupons to redeem whenever you like:}'
	String choose_coupons({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Pick 3 coupons to redeem whenever you like:';
			case GenderContext.male:
				return 'Pick 3 coupons to redeem whenever you like:';
		}
	}

	/// en: '(female) {Choose the correct answer} (male) {Choose the correct answer}'
	String choose_currect_answer({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Choose the correct answer';
			case GenderContext.male:
				return 'Choose the correct answer';
		}
	}

	/// en: '(female) {Pick a day to see what's planned 👆} (male) {Pick a day to see what's planned 👆}'
	String choose_day_hint({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Pick a day to see what\'s planned 👆';
			case GenderContext.male:
				return 'Pick a day to see what\'s planned 👆';
		}
	}

	/// en: 'Choose Gender'
	String get choose_gender => 'Choose Gender';

	/// en: 'Choose Language'
	String get choose_language => 'Choose Language';

	/// en: 'Choose your gender'
	String get choose_own_gender => 'Choose your gender';

	/// en: 'Choose your partner's gender'
	String get choose_partner_gender => 'Choose your partner\'s gender';

	/// en: '(female) {Select the questions you want to delete} (male) {Select the questions you want to delete}'
	String choose_question_delete({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Select the questions you want to delete';
			case GenderContext.male:
				return 'Select the questions you want to delete';
		}
	}

	/// en: 'Click Here'
	String get click_here => 'Click Here';

	/// en: '(female) {Click here to start} (male) {Click here to start}'
	String click_here_start({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Click here to start';
			case GenderContext.male:
				return 'Click here to start';
		}
	}

	/// en: 'Confirm Images?'
	String get confirm_images => 'Confirm Images?';

	/// en: 'Call'
	String get contact_call => 'Call';

	/// en: 'Facebook'
	String get contact_facebook => 'Facebook';

	/// en: 'Instagram'
	String get contact_instagram => 'Instagram';

	/// en: 'Message'
	String get contact_message => 'Message';

	/// en: 'Choose a Contact Method'
	String get contact_method_title => 'Choose a Contact Method';

	/// en: 'TikTok'
	String get contact_tiktok => 'TikTok';

	/// en: 'Contact Us'
	String get contact_us => 'Contact Us';

	/// en: 'Website'
	String get contact_website => 'Website';

	/// en: 'WhatsApp'
	String get contact_whatsapp => 'WhatsApp';

	/// en: 'Continue'
	String get continue_ => 'Continue';

	/// en: 'Continue without changing'
	String get continue_no_change => 'Continue without changing';

	/// en: '💑 Couple categories'
	String get couple_categories => '💑 Couple categories';

	/// en: 'Breakfast in bed'
	String get coupon_idea_breakfast_in_bed => 'Breakfast in bed';

	/// en: 'Date night, babysitter's on me'
	String get coupon_idea_date_night => 'Date night, babysitter\'s on me';

	/// en: 'A day off diaper duty'
	String get coupon_idea_diaper_pass => 'A day off diaper duty';

	/// en: 'A night out with friends'
	String get coupon_idea_friends_night => 'A night out with friends';

	/// en: 'A full night without getting up 😴'
	String get coupon_idea_full_night => 'A full night without getting up 😴';

	/// en: 'A long, uninterrupted shower'
	String get coupon_idea_long_shower => 'A long, uninterrupted shower';

	/// en: 'A 30-minute massage'
	String get coupon_idea_massage => 'A 30-minute massage';

	/// en: 'A morning to sleep in'
	String get coupon_idea_sleep_in => 'A morning to sleep in';

	/// en: 'Ideas:'
	String get coupon_ideas => 'Ideas:';

	/// en: 'Coupon $n'
	String coupon_number({required Object n}) => 'Coupon ${n}';

	/// en: 'Seat'
	String get coupon_seat => 'Seat';

	/// en: 'STUB'
	String get coupon_stub => 'STUB';

	/// en: 'VALID // FOREVER'
	String get coupon_valid_forever => 'VALID // FOREVER';

	/// en: 'Coupons left: $n'
	String coupons_left({required Object n}) => 'Coupons left: ${n}';

	/// en: 'Create Greeting Using AI'
	String get create_greeting_using_ai => 'Create Greeting Using AI';

	/// en: 'Current Plan'
	String get current_plan => 'Current Plan';

	/// en: 'Date of Birth'
	String get date_of_birth => 'Date of Birth';

	/// en: 'days'
	String get days => 'days';

	/// en: 'days of parenting'
	String get days_of_parenting => 'days of parenting';

	/// en: 'Login or registration failed. Please try again'
	String get default_error => 'Login or registration failed. Please try again';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Delete account'
	String get delete_account => 'Delete account';

	/// en: 'This permanently deletes your account, your partner's access, and every photo, video and message in your surprise. This can't be undone.'
	String get delete_account_description => 'This permanently deletes your account, your partner\'s access, and every photo, video and message in your surprise. This can\'t be undone.';

	/// en: 'Couldn't delete the account. Check your connection and try again.'
	String get delete_account_failed => 'Couldn\'t delete the account. Check your connection and try again.';

	/// en: 'Delete your account?'
	String get delete_account_sure => 'Delete your account?';

	/// en: 'Categories already created won't be deleted.'
	String get delete_child_description => 'Categories already created won\'t be deleted.';

	/// en: 'Delete Wishes'
	String get delete_wishes => 'Delete Wishes';

	/// en: '(female) {If the wishes don’t align with the contract, you can delete them and $name can refill them} (male) {If the wishes don’t align with the contract, you can delete them and $name can refill them}'
	String delete_wishes_description({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'If the wishes don’t align with the contract, you can delete them and ${name} can refill them';
			case GenderContext.male:
				return 'If the wishes don’t align with the contract, you can delete them and ${name} can refill them';
		}
	}

	/// en: 'Description'
	String get description => 'Description';

	/// en: 'Show Results'
	String get display_result => 'Show Results';

	/// en: 'Show Wishes'
	String get display_wishes => 'Show Wishes';

	/// en: '(female) {Drag the cards (or long-press) to set the order $name sees ↕️} (male) {Drag the cards (or long-press) to set the order $name sees ↕️}'
	String drag_to_reorder({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'Drag the cards (or long-press) to set the order ${name} sees ↕️';
			case GenderContext.male:
				return 'Drag the cards (or long-press) to set the order ${name} sees ↕️';
		}
	}

	/// en: 'drag to tear'
	String get drag_to_tear => 'drag to tear';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Edit Greeting'
	String get edit_greeting => 'Edit Greeting';

	/// en: 'Edit Title'
	String get edit_title => 'Edit Title';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Email already exists'
	String get email_exist => 'Email already exists';

	/// en: 'Invalid email'
	String get email_not_valid => 'Invalid email';

	/// en: 'Empty'
	String get empty => 'Empty';

	/// en: 'Event Description'
	String get event_description => 'Event Description';

	/// en: 'Event ID'
	String get event_id => 'Event ID';

	/// en: 'Events on $date'
	String event_in_date({required Object date}) => 'Events on ${date}';

	/// en: 'Exit'
	String get exit => 'Exit';

	/// en: 'Are you sure you want to exit?'
	String get exit_app_description => 'Are you sure you want to exit?';

	/// en: 'Exit the app?'
	String get exit_app_title => 'Exit the app?';

	/// en: 'Welcome to the coolest birthday app there is! So what do you actually do here? It's simple! You fill in details about yourself and your partner, and then start choosing how to spoil them. There are three plans: Free, Standard and Platinum. The free plan has limited options, and with Standard and Platinum you can let your imagination run wild and pick as many items as you like! Here are some of the things you can choose: - An AI-written greeting – a greeting that fits you perfectly. - A shared photo album – for touching experiences. - A shared video album – for unforgettable moments. - A trivia game you build – because a little fun and interaction is always good. - A schedule on a shared calendar – so you never forget the important events. - A birthday surprise page – a special page that stays locked until you decide otherwise. - A wish list – if you'd like to spoil your partner with the things they dream about. - A memory game with your shared photos – a fun way to keep your beautiful memories. The app is still in development, and we're working hard to add more awesome features to all the plans. Have another idea? We'd love to hear it – maybe we'll make it happen for you! Good luck, and let's celebrate! 🎉🎉🎉 '
	String get explanation_screen_text => 'Welcome to the coolest birthday app there is!\n\nSo what do you actually do here? It\'s simple! You fill in details about yourself and your partner, and then start choosing how to spoil them. There are three plans: Free, Standard and Platinum. The free plan has limited options, and with Standard and Platinum you can let your imagination run wild and pick as many items as you like!\n\nHere are some of the things you can choose:\n\n- An AI-written greeting – a greeting that fits you perfectly.\n\n- A shared photo album – for touching experiences.\n\n- A shared video album – for unforgettable moments.\n\n- A trivia game you build – because a little fun and interaction is always good.\n\n- A schedule on a shared calendar – so you never forget the important events.\n\n- A birthday surprise page – a special page that stays locked until you decide otherwise.\n\n- A wish list – if you\'d like to spoil your partner with the things they dream about.\n\n- A memory game with your shared photos – a fun way to keep your beautiful memories.\n\nThe app is still in development, and we\'re working hard to add more awesome features to all the plans. Have another idea? We\'d love to hear it – maybe we\'ll make it happen for you!\n\nGood luck, and let\'s celebrate! 🎉🎉🎉\n\n';

	/// en: 'Guide to Creating the Perfect Surprise'
	String get explanation_screen_title => 'Guide to Creating the Perfect Surprise';

	/// en: 'Failed to send login request to phone. Please try again'
	String get failed_send_login_request => 'Failed to send login request to phone. Please try again';

	/// en: 'False'
	String get false_ => 'False';

	/// en: '👨‍👩‍👧 Family categories'
	String get family_categories => '👨‍👩‍👧 Family categories';

	/// en: 'The ears'
	String get feature_ears => 'The ears';

	/// en: 'The eyes'
	String get feature_eyes => 'The eyes';

	/// en: 'The hair'
	String get feature_hair => 'The hair';

	/// en: 'The hands'
	String get feature_hands => 'The hands';

	/// en: 'The laugh'
	String get feature_laugh => 'The laugh';

	/// en: 'The mouth'
	String get feature_mouth => 'The mouth';

	/// en: 'The nose'
	String get feature_nose => 'The nose';

	/// en: 'The smile'
	String get feature_smile => 'The smile';

	/// en: 'The temper 😅'
	String get feature_temper => 'The temper 😅';

	/// en: 'Female'
	String get female => 'Female';

	/// en: 'Please fill in all fields'
	String get fill_all_fields => 'Please fill in all fields';

	/// en: 'Fill in your partner's details'
	String get fill_partner_details => 'Fill in your partner\'s details';

	/// en: 'Fill in your details'
	String get fill_your_details => 'Fill in your details';

	/// en: 'Finish'
	String get finish => 'Finish';

	/// en: 'First Name'
	String get first_name => 'First Name';

	/// en: 'Set an initial password. Your partner can change the password. If left blank, the password will be 123456'
	String get first_password => 'Set an initial password. Your partner can change the password.\nIf left blank, the password will be 123456';

	/// en: 'First Question'
	String get first_question => 'First Question';

	/// en: 'Initial Registration'
	String get first_register => 'Initial Registration';

	/// en: 'First Wish'
	String get first_wish => 'First Wish';

	/// en: 'Four Answers Question'
	String get four_answers_question => 'Four Answers Question';

	/// en: 'Fourth Question'
	String get fourth_question => 'Fourth Question';

	/// en: 'Game Over'
	String get game_over => 'Game Over';

	/// en: 'Gender'
	String get gender => 'Gender';

	/// en: 'Generate Greeting'
	String get generate_greeting => 'Generate Greeting';

	/// en: 'Generate New Greeting'
	String get generate_new_greeting => 'Generate New Greeting';

	/// en: 'Write a birthday blessing for $relationship, the name is $name My name is: $myName Number of lines in the blessing: $lineNumber Number of words per line: $wordsInLineNumber The age is $age'
	String generate_text_description({required Object relationship, required Object name, required Object myName, required Object lineNumber, required Object wordsInLineNumber, required Object age}) => 'Write a birthday blessing for ${relationship}, the name is ${name}\nMy name is: ${myName}\nNumber of lines in the blessing: ${lineNumber}\nNumber of words per line: ${wordsInLineNumber}\nThe age is ${age}';

	/// en: 'Girl'
	String get girl => 'Girl';

	/// en: 'You got a full app just for this!'
	String get got_full_app => 'You got a full app just for this!';

	/// en: '(female) {Welcome $name} (male) {Welcome $name}'
	String greeter({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'Welcome ${name}';
			case GenderContext.male:
				return 'Welcome ${name}';
		}
	}

	/// en: 'Blessing Before Edit'
	String get greeting_before_edit => 'Blessing Before Edit';

	/// en: '(female) {$name has prepared the coolest surprise for you! An app built especially for your birthday! Here you will find a heartfelt personal blessing, shared photos of your most beautiful moments, and more surprises to warm your heart, because you deserve all the best in the world! Get ready, this will be an unforgettable celebration! 🎉🎉🎉} (male) {$name has prepared the coolest surprise for you! An app built especially for your birthday! Here you will find a heartfelt personal blessing, shared photos of your most beautiful moments, and more surprises to warm your heart, because you deserve all the best in the world! Get ready, this will be an unforgettable celebration! 🎉🎉🎉}'
	String greeting_first_login({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return '${name} has prepared the coolest surprise for you!\nAn app built especially for your birthday!\nHere you will find a heartfelt personal blessing,\nshared photos of your most beautiful moments,\nand more surprises to warm your heart,\nbecause you deserve all the best in the world!\nGet ready, this will be an unforgettable celebration! 🎉🎉🎉';
			case GenderContext.male:
				return '${name} has prepared the coolest surprise for you!\nAn app built especially for your birthday!\nHere you will find a heartfelt personal blessing,\nshared photos of your most beautiful moments,\nand more surprises to warm your heart,\nbecause you deserve all the best in the world!\nGet ready, this will be an unforgettable celebration! 🎉🎉🎉';
		}
	}

	/// en: '* Your names will be automatically added * Your partner's age will be automatically added * After receiving the blessing, you can edit it however you'd like'
	String get greeting_notes => '* Your names will be automatically added\n* Your partner\'s age will be automatically added\n* After receiving the blessing, you can edit it however you\'d like';

	/// en: 'Already have an account?'
	String get have_account => 'Already have an account?';

	/// en: 'Hide password'
	String get hide_password => 'Hide password';

	/// en: 'Home Screen'
	String get home_screen => 'Home Screen';

	/// en: 'hours'
	String get hours => 'hours';

	/// en: 'How it added up 📈'
	String get how_it_grew => 'How it added up 📈';

	/// en: '(female) {Indicating} (male) {Indicating}'
	String indicating({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Indicating';
			case GenderContext.male:
				return 'Indicating';
		}
	}

	/// en: 'Info'
	String get info => 'Info';

	/// en: 'Incorrect email or password. Please try again'
	String get invalid_credential => 'Incorrect email or password. Please try again';

	/// en: 'Later'
	String get later => 'Later';

	/// en: 'Less'
	String get less => 'Less';

	/// en: 'Let's continue!'
	String get lets_continue => 'Let\'s continue!';

	/// en: '(female) {Let's try!} (male) {Let's try!}'
	String lets_try({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Let\'s try!';
			case GenderContext.male:
				return 'Let\'s try!';
		}
	}

	/// en: 'A letter from $name 💌'
	String letter_from({required Object name}) => 'A letter from ${name} 💌';

	/// en: 'Ready letter $n'
	String letter_template_number({required Object n}) => 'Ready letter ${n}';

	/// en: 'Number of Lines'
	String get lines_number => 'Number of Lines';

	/// en: 'Locked'
	String get lock => 'Locked';

	/// en: 'This category is locked. To unlock it, upgrade your plan in the settings'
	String get locked_category => 'This category is locked.\nTo unlock it, upgrade your plan in the settings';

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'Login Failed'
	String get login_failed => 'Login Failed';

	/// en: 'Login Screen'
	String get login_screen => 'Login Screen';

	/// en: 'Successfully logged in!'
	String get login_successful => 'Successfully logged in!';

	/// en: 'Log in via Phone'
	String get login_via_phone => 'Log in via Phone';

	/// en: 'Login with Verification Code'
	String get login_with_otp_code => 'Login with Verification Code';

	/// en: 'Login with Password'
	String get login_with_password => 'Login with Password';

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'Who do they look like?'
	String get look_alike => 'Who do they look like?';

	/// en: 'You agreed on $agreed of $total guesses 🤝'
	String look_alike_agreed({required Object agreed, required Object total}) => 'You agreed on ${agreed} of ${total} guesses 🤝';

	/// en: '(female) {Eyes, nose, smile... who do the kids look like more? Find out who wins 👑} (male) {Eyes, nose, smile... who do the kids look like more? Find out who wins 👑}'
	String look_alike_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Eyes, nose, smile... who do the kids look like more? Find out who wins 👑';
			case GenderContext.male:
				return 'Eyes, nose, smile... who do the kids look like more? Find out who wins 👑';
		}
	}

	/// en: '(female) {Add a photo of each child and of you both, at the same age if you have one, otherwise a current one. You can guess too and see if you agreed.} (male) {Add a photo of each child and of you both, at the same age if you have one, otherwise a current one. You can guess too and see if you agreed.}'
	String look_alike_editor_explanation({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Add a photo of each child and of you both, at the same age if you have one, otherwise a current one. You can guess too and see if you agreed.';
			case GenderContext.male:
				return 'Add a photo of each child and of you both, at the same age if you have one, otherwise a current one. You can guess too and see if you agreed.';
		}
	}

	/// en: 'It's a tie! $name: the perfect mix of you both 💞'
	String look_alike_tie({required Object name}) => 'It\'s a tie! ${name}: the perfect mix of you both 💞';

	/// en: 'Who does $name look like?'
	String look_alike_title({required Object name}) => 'Who does ${name} look like?';

	/// en: '$name looks like $parent! 🎉'
	String look_alike_winner_boy({required Object name, required Object parent}) => '${name} looks like ${parent}! 🎉';

	/// en: '$name looks like $parent! 🎉'
	String look_alike_winner_girl({required Object name, required Object parent}) => '${name} looks like ${parent}! 🎉';

	/// en: 'Male'
	String get male => 'Male';

	/// en: 'Mark All'
	String get mark_all => 'Mark All';

	/// en: 'You must mark at least one question'
	String get mark_least_one_question => 'You must mark at least one question';

	/// en: '(female) {My Wife} (male) {My Husband}'
	String married({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'My Wife';
			case GenderContext.male:
				return 'My Husband';
		}
	}

	/// en: 'Max Words per Line'
	String get max_words_in_line => 'Max Words per Line';

	/// en: 'Memory Game'
	String get memory_game => 'Memory Game';

	/// en: '(female) {Create a fun memory game with 6 shared pictures of you two!} (male) {Create a fun memory game with 6 shared pictures of you two!}'
	String memory_game_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Create a fun memory game with 6 shared pictures of you two!';
			case GenderContext.male:
				return 'Create a fun memory game with 6 shared pictures of you two!';
		}
	}

	/// en: '(female) {$name finished the game with a score of $score} (male) {$name finished the game with a score of $score}'
	String memory_game_done({required GenderContext context, required Object name, required Object score}) {
		switch (context) {
			case GenderContext.female:
				return '${name} finished the game with a score of ${score}';
			case GenderContext.male:
				return '${name} finished the game with a score of ${score}';
		}
	}

	/// en: 'To unlock it, please ask $name for a new chance'
	String memory_game_lock_description({required Object name}) => 'To unlock it, please ask ${name} for a new chance';

	/// en: 'Memory Game is Locked'
	String get memory_game_lock_title => 'Memory Game is Locked';

	/// en: 'A few words (optional)'
	String get milestone_note => 'A few words (optional)';

	/// en: 'What happened?'
	String get milestone_title => 'What happened?';

	/// en: 'Write what happened'
	String get milestone_title_required => 'Write what happened';

	/// en: 'Milestones'
	String get milestones => 'Milestones';

	/// en: '$n milestones of $name'
	String milestones_count({required Object n, required Object name}) => '${n} milestones of ${name}';

	/// en: '(female) {A sweet timeline of all the firsts: first smile, first step and more 👣} (male) {A sweet timeline of all the firsts: first smile, first step and more 👣}'
	String milestones_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'A sweet timeline of all the firsts: first smile, first step and more 👣';
			case GenderContext.male:
				return 'A sweet timeline of all the firsts: first smile, first step and more 👣';
		}
	}

	/// en: '(female) {Add the firsts with a date, and a photo if you like. The age at each one is worked out for you.} (male) {Add the firsts with a date, and a photo if you like. The age at each one is worked out for you.}'
	String milestones_editor_explanation({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Add the firsts with a date, and a photo if you like. The age at each one is worked out for you.';
			case GenderContext.male:
				return 'Add the firsts with a date, and a photo if you like. The age at each one is worked out for you.';
		}
	}

	/// en: '$name's firsts'
	String milestones_title({required Object name}) => '${name}\'s firsts';

	/// en: 'minutes'
	String get minutes => 'minutes';

	/// en: 'Month'
	String get month => 'Month';

	/// en: 'More'
	String get more => 'More';

	/// en: 'In a few seconds, we’ll start building the perfect gift!'
	String get more_few_seconds => 'In a few seconds, we’ll start building the perfect gift!';

	/// en: 'And many more firsts to come...'
	String get more_firsts_coming => 'And many more firsts to come...';

	/// en: 'First crawl'
	String get ms_crawled => 'First crawl';

	/// en: 'First birthday'
	String get ms_first_birthday => 'First birthday';

	/// en: 'First day at daycare'
	String get ms_first_daycare => 'First day at daycare';

	/// en: 'First food'
	String get ms_first_food => 'First food';

	/// en: 'First haircut'
	String get ms_first_haircut => 'First haircut';

	/// en: 'First smile'
	String get ms_first_smile => 'First smile';

	/// en: 'First steps'
	String get ms_first_steps => 'First steps';

	/// en: 'First tooth'
	String get ms_first_tooth => 'First tooth';

	/// en: 'First word'
	String get ms_first_word => 'First word';

	/// en: 'First roll over'
	String get ms_rolled_over => 'First roll over';

	/// en: 'First time sitting up'
	String get ms_sat_up => 'First time sitting up';

	/// en: 'First full night's sleep'
	String get ms_slept_through => 'First full night\'s sleep';

	/// en: '(female) {My Dear} (male) {My Dear}'
	String my_dear({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'My Dear';
			case GenderContext.male:
				return 'My Dear';
		}
	}

	/// en: '$first and $last'
	String names_and({required Object first, required Object last}) => '${first} and ${last}';

	/// en: 'NEW'
	String get new_badge => 'NEW';

	/// en: 'New child'
	String get new_child => 'New child';

	/// en: 'New Password'
	String get new_password => 'New Password';

	/// en: 'Verify New Password'
	String get new_password_verification => 'Verify New Password';

	/// en: 'No'
	String get no => 'No';

	/// en: 'Don't have an account?'
	String get no_account => 'Don\'t have an account?';

	/// en: 'Text cannot be empty'
	String get no_allow_text_empty => 'Text cannot be empty';

	/// en: 'No categories have been added for this event'
	String get no_category_added => 'No categories have been added for this event';

	/// en: 'No children added yet'
	String get no_children_yet => 'No children added yet';

	/// en: 'No plans this day... yet 😉'
	String get no_events_this_day => 'No plans this day... yet 😉';

	/// en: 'No milestones yet. Time to add the first!'
	String get no_milestones_yet => 'No milestones yet. Time to add the first!';

	/// en: 'The user is not an administrative user'
	String get no_owner => 'The user is not an administrative user';

	/// en: 'No questions added yet'
	String get no_questions_add => 'No questions added yet';

	/// en: 'Not Required'
	String get no_required => 'Not Required';

	/// en: 'No wishes yet'
	String get no_wish_yet => 'No wishes yet';

	/// en: 'Not played yet'
	String get not_played_yet => 'Not played yet';

	/// en: 'not written yet'
	String get not_written_yet => 'not written yet';

	/// en: 'Nothing here yet'
	String get nothing_here_yet => 'Nothing here yet';

	/// en: 'Number of Mistakes'
	String get num_mistakes => 'Number of Mistakes';

	/// en: 'You currently have $number questions'
	String num_of_questions({required Object number}) => 'You currently have ${number} questions';

	/// en: 'OK'
	String get ok => 'OK';

	/// en: '(female) {Open} (male) {Open}'
	String open_it({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Open';
			case GenderContext.male:
				return 'Open';
		}
	}

	/// en: 'Open a New Memory Game'
	String get open_new_memory_game => 'Open a New Memory Game';

	/// en: 'Open a New Quiz'
	String get open_new_quiz_game => 'Open a New Quiz';

	/// en: 'Server error. Please try again later'
	String get operation_not_allowed => 'Server error. Please try again later';

	/// en: 'Verification Code'
	String get otp_code => 'Verification Code';

	/// en: 'You received an SMS with a verification code. Please enter it and click OK'
	String get otp_code_description => 'You received an SMS with a verification code.\nPlease enter it and click OK';

	/// en: 'PARENTING COUPON'
	String get parent_coupon_label => 'PARENTING COUPON';

	/// en: 'Parenting coupons'
	String get parent_coupons => 'Parenting coupons';

	/// en: '(female) {Write a little contract, and your partner picks 3 coupons for tired parents: real tickets you tear when redeeming 🎟️} (male) {Write a little contract, and your partner picks 3 coupons for tired parents: real tickets you tear when redeeming 🎟️}'
	String parent_coupons_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Write a little contract, and your partner picks 3 coupons for tired parents: real tickets you tear when redeeming 🎟️';
			case GenderContext.male:
				return 'Write a little contract, and your partner picks 3 coupons for tired parents: real tickets you tear when redeeming 🎟️';
		}
	}

	/// en: 'A photo of you at $age is best. Don't have one? A current one will do 😉'
	String parent_photo_hint({required Object age}) => 'A photo of you at ${age} is best. Don\'t have one? A current one will do 😉';

	/// en: 'Parenting stats'
	String get parent_stats => 'Parenting stats';

	/// en: '(female) {How many diapers, coffees, sleepless nights? Funny numbers with charts, by the days since birth 📊} (male) {How many diapers, coffees, sleepless nights? Funny numbers with charts, by the days since birth 📊}'
	String parent_stats_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'How many diapers, coffees, sleepless nights? Funny numbers with charts, by the days since birth 📊';
			case GenderContext.male:
				return 'How many diapers, coffees, sleepless nights? Funny numbers with charts, by the days since birth 📊';
		}
	}

	/// en: '(female) {How many a day on average, per child? Totals are worked out by the days since birth. 0 hides the row.} (male) {How many a day on average, per child? Totals are worked out by the days since birth. 0 hides the row.}'
	String parent_stats_editor_explanation({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'How many a day on average, per child? Totals are worked out by the days since birth. 0 hides the row.';
			case GenderContext.male:
				return 'How many a day on average, per child? Totals are worked out by the days since birth. 0 hides the row.';
		}
	}

	/// en: 'Parenting by the numbers: $name'
	String parent_stats_title({required Object name}) => 'Parenting by the numbers: ${name}';

	/// en: 'Your photos'
	String get parents_photos => 'Your photos';

	/// en: 'Partner's Info'
	String get partner_info => 'Partner\'s Info';

	/// en: 'This is your phone number. Enter your partner's number'
	String get partner_phone_is_yours => 'This is your phone number. Enter your partner\'s number';

	/// en: 'This phone number already belongs to another account'
	String get partner_phone_taken => 'This phone number already belongs to another account';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Passwords do not match'
	String get password_dont_match => 'Passwords do not match';

	/// en: 'The two passwords you entered do not match, please try again'
	String get password_dont_match_description => 'The two passwords you entered do not match, please try again';

	/// en: 'Password Verification'
	String get password_verification => 'Password Verification';

	/// en: 'Phone'
	String get phone => 'Phone';

	/// en: 'Phone number already exists'
	String get phone_exist => 'Phone number already exists';

	/// en: 'This phone number is already registered in our system. Please go to the login screen and try again'
	String get phone_exist_description => 'This phone number is already registered in our system. Please go to the login screen and try again';

	/// en: 'Phone number does not exist in the system'
	String get phone_not_exist_system => 'Phone number does not exist in the system';

	/// en: 'Invalid phone number'
	String get phone_not_valid => 'Invalid phone number';

	/// en: 'The phone number seems invalid. Please try again'
	String get phone_not_valid_description => 'The phone number seems invalid. Please try again';

	/// en: 'Phone Verification'
	String get phone_verification => 'Phone Verification';

	/// en: 'Pick Color'
	String get pick_color => 'Pick Color';

	/// en: 'Pick Date Range'
	String get pick_date_range => 'Pick Date Range';

	/// en: 'Pictures'
	String get pictures => 'Pictures';

	/// en: '(female) {Add some shared pictures that will melt your hearts} (male) {Add some shared pictures that will melt your hearts}'
	String pictures_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Add some shared pictures that will melt your hearts';
			case GenderContext.male:
				return 'Add some shared pictures that will melt your hearts';
		}
	}

	/// en: 'A birthday schedule on a shared calendar'
	String get plan_feature_calendar => 'A birthday schedule on a shared calendar';

	/// en: 'A touching greeting text'
	String get plan_feature_greeting => 'A touching greeting text';

	/// en: 'A touching greeting text - AI can write it'
	String get plan_feature_greeting_ai => 'A touching greeting text - AI can write it';

	/// en: 'Photo gallery (up to $limit photos)'
	String plan_feature_images({required Object limit}) => 'Photo gallery (up to ${limit} photos)';

	/// en: 'A memory game with your own shared photos!'
	String get plan_feature_memory_game => 'A memory game with your own shared photos!';

	/// en: 'No ads'
	String get plan_feature_no_ads => 'No ads';

	/// en: 'Birthday surprise - a locked screen until you decide to reveal it'
	String get plan_feature_surprise => 'Birthday surprise - a locked screen until you decide to reveal it';

	/// en: 'A fun and challenging trivia game'
	String get plan_feature_trivia => 'A fun and challenging trivia game';

	/// en: 'Video gallery (up to $limit videos)'
	String plan_feature_videos({required Object limit}) => 'Video gallery (up to ${limit} videos)';

	/// en: 'Wish list - let your partner ask for 3 wishes'
	String get plan_feature_wishes => 'Wish list - let your partner ask for 3 wishes';

	/// en: 'Free'
	String get plan_free => 'Free';

	/// en: 'Platinum'
	String get plan_platinum => 'Platinum';

	/// en: 'Standard'
	String get plan_standard => 'Standard';

	/// en: 'Let $name play again'
	String play_again({required Object name}) => 'Let ${name} play again';

	/// en: 'Please choose a category'
	String get please_choose_category => 'Please choose a category';

	/// en: 'Please open the app on your phone to log in'
	String get please_open_app_in_phone => 'Please open the app on your phone to log in';

	/// en: '(female) {A contract written by $name especially for you} (male) {A contract written by $name especially for you}'
	String please_read_contract({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'A contract written by ${name} especially for you';
			case GenderContext.male:
				return 'A contract written by ${name} especially for you';
		}
	}

	/// en: 'The purchase could not be completed. Please try again'
	String get purchase_failed => 'The purchase could not be completed. Please try again';

	/// en: 'The purchase is awaiting approval. Your plan will be updated once it is approved'
	String get purchase_pending => 'The purchase is awaiting approval. Your plan will be updated once it is approved';

	/// en: 'The purchase went through! Your plan will be updated shortly'
	String get purchase_saved_for_later => 'The purchase went through! Your plan will be updated shortly';

	/// en: 'Question'
	String get question => 'Question';

	/// en: 'Questions'
	String get questions => 'Questions';

	/// en: 'Quiz Game'
	String get quiz_game => 'Quiz Game';

	/// en: '(female) {Build a trivia game to see if you know who's who!} (male) {Build a trivia game to see if you know who's who!}'
	String quiz_game_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Build a trivia game to see if you know who\'s who!';
			case GenderContext.male:
				return 'Build a trivia game to see if you know who\'s who!';
		}
	}

	/// en: 'Trivia Game Completed'
	String get quiz_game_done => 'Trivia Game Completed';

	/// en: '(female) {Welcome to the trivia game! $name has prepared $number intriguing questions for you. ❤️ Reminder: You cannot change an answer once given, so answer carefully and have fun 😉 Good luck!} (male) {Welcome to the trivia game! $name has prepared $number intriguing questions for you. ❤️ Reminder: You cannot change an answer once given, so answer carefully and have fun 😉 Good luck!}'
	String quiz_game_partner_description({required GenderContext context, required Object name, required Object number}) {
		switch (context) {
			case GenderContext.female:
				return 'Welcome to the trivia game!\n${name} has prepared ${number} intriguing questions for you.\n❤️ Reminder: You cannot change an answer once given, so answer carefully and have fun 😉\nGood luck!';
			case GenderContext.male:
				return 'Welcome to the trivia game!\n${name} has prepared ${number} intriguing questions for you.\n❤️ Reminder: You cannot change an answer once given, so answer carefully and have fun 😉\nGood luck!';
		}
	}

	/// en: '(female) {$name hasn't added any questions yet} (male) {$name hasn't added any questions yet}'
	String quiz_game_partner_no_questions({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return '${name} hasn\'t added any questions yet';
			case GenderContext.male:
				return '${name} hasn\'t added any questions yet';
		}
	}

	/// en: '(female) {$name answered $answered of $total questions, $score correct} (male) {$name answered $answered of $total questions, $score correct}'
	String quiz_game_played({required GenderContext context, required Object name, required Object answered, required Object total, required Object score}) {
		switch (context) {
			case GenderContext.female:
				return '${name} answered ${answered} of ${total} questions, ${score} correct';
			case GenderContext.male:
				return '${name} answered ${answered} of ${total} questions, ${score} correct';
		}
	}

	/// en: '(female) {Not bad at all! 😄} (male) {Not bad at all! 😄}'
	String quiz_verdict_good({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Not bad at all! 😄';
			case GenderContext.male:
				return 'Not bad at all! 😄';
		}
	}

	/// en: '(female) {Wow! You really know me 🏆} (male) {Wow! You really know me 🏆}'
	String quiz_verdict_great({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Wow! You really know me 🏆';
			case GenderContext.male:
				return 'Wow! You really know me 🏆';
		}
	}

	/// en: '(female) {We still have some learning to do 😅} (male) {We still have some learning to do 😅}'
	String quiz_verdict_low({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'We still have some learning to do 😅';
			case GenderContext.male:
				return 'We still have some learning to do 😅';
		}
	}

	/// en: 'Rate the app'
	String get rate_app => 'Rate the app';

	/// en: 'Ready letters:'
	String get ready_letters => 'Ready letters:';

	/// en: 'Dark colors are recommended'
	String get recommand_drak_colors => 'Dark colors are recommended';

	/// en: 'Recommended Colors'
	String get recommended_colors => 'Recommended Colors';

	/// en: 'REDEEMED'
	String get redeemed => 'REDEEMED';

	/// en: 'Register'
	String get register => 'Register';

	/// en: 'Register Screen'
	String get register_screen => 'Register Screen';

	/// en: 'Relationship'
	String get relationship => 'Relationship';

	/// en: '(female) {Remove Question} (male) {Remove Question}'
	String remove_question({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Remove Question';
			case GenderContext.male:
				return 'Remove Question';
		}
	}

	/// en: '(female) {Remove} (male) {Remove}'
	String remove({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Remove';
			case GenderContext.male:
				return 'Remove';
		}
	}

	/// en: 'Reorder'
	String get reorder => 'Reorder';

	/// en: 'Replace photo'
	String get replace_photo => 'Replace photo';

	/// en: 'You must fill in all the answers'
	String get required_fill_all_answer => 'You must fill in all the answers';

	/// en: 'You must fill in the question'
	String get required_fill_question => 'You must fill in the question';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Save and Lock'
	String get save_and_lock => 'Save and Lock';

	/// en: 'Save & print 🎟️'
	String get save_and_print_coupons => 'Save & print 🎟️';

	/// en: 'Score'
	String get score => 'Score';

	/// en: 'Seal in the capsule 🔒'
	String get seal_letter => 'Seal in the capsule 🔒';

	/// en: 'sealed'
	String get sealed => 'sealed';

	/// en: 'Second Question'
	String get second_question => 'Second Question';

	/// en: 'Second Wish'
	String get second_wish => 'Second Wish';

	/// en: 'seconds'
	String get seconds => 'seconds';

	/// en: '(female) {"$categoryName" is locked until $name grants you permission to open it!} (male) {"$categoryName" is locked until $name grants you permission to open it!}'
	String secret_dialog({required GenderContext context, required Object categoryName, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return '"${categoryName}" is locked until ${name} grants you permission to open it!';
			case GenderContext.male:
				return '"${categoryName}" is locked until ${name} grants you permission to open it!';
		}
	}

	/// en: 'Select Time'
	String get select_time => 'Select Time';

	/// en: 'Selected Color'
	String get selected_color => 'Selected Color';

	/// en: 'Selected Time: $time'
	String selected_time({required Object time}) => 'Selected Time: ${time}';

	/// en: '(female) {Selected} (male) {Selected}'
	String selected({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Selected';
			case GenderContext.male:
				return 'Selected';
		}
	}

	/// en: 'Send Again'
	String get send_again => 'Send Again';

	/// en: 'Send Code'
	String get send_code => 'Send Code';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Sharing the app'
	String get share_app => 'Sharing the app';

	/// en: 'Create a personal birthday app for someone you love with Easy Birthday 🎉 $url'
	String share_app_message({required Object url}) => 'Create a personal birthday app for someone you love with Easy Birthday 🎉\n${url}';

	/// en: 'Password too short'
	String get short_password => 'Password too short';

	/// en: 'Password must be at least 8 characters'
	String get short_password_description => 'Password must be at least 8 characters';

	/// en: 'Show password'
	String get show_password => 'Show password';

	/// en: '(female) {Skip} (male) {Skip}'
	String skip({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Skip';
			case GenderContext.male:
				return 'Skip';
		}
	}

	/// en: 'So far'
	String get so_far => 'So far';

	/// en: 'Something went wrong. Please try again'
	String get something_went_wrong => 'Something went wrong. Please try again';

	/// en: 'Coming Soon'
	String get soon => 'Coming Soon';

	/// en: 'Soul Mate'
	String get soul_mate => 'Soul Mate';

	/// en: '$age is a special age'
	String special_age({required Object age}) => '${age} is a special age';

	/// en: '(female) {My Partner} (male) {My Partner}'
	String spouse({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'My Partner';
			case GenderContext.male:
				return 'My Partner';
		}
	}

	/// en: 'Cups of coffee'
	String get stat_coffee => 'Cups of coffee';

	/// en: 'Cups of coffee a day'
	String get stat_daily_coffee => 'Cups of coffee a day';

	/// en: 'Diapers a day'
	String get stat_daily_diapers => 'Diapers a day';

	/// en: 'Feedings a day'
	String get stat_daily_feedings => 'Feedings a day';

	/// en: 'Kisses a day'
	String get stat_daily_kisses => 'Kisses a day';

	/// en: 'Laundry loads a day'
	String get stat_daily_laundry => 'Laundry loads a day';

	/// en: 'Lullabies a day'
	String get stat_daily_lullabies => 'Lullabies a day';

	/// en: 'Night wake-ups'
	String get stat_daily_night_wakeups => 'Night wake-ups';

	/// en: 'Diapers changed'
	String get stat_diapers => 'Diapers changed';

	/// en: '$liters liters of coffee, enough to fill $baths bathtubs ☕'
	String stat_fact_coffee({required Object liters, required Object baths}) => '${liters} liters of coffee, enough to fill ${baths} bathtubs ☕';

	/// en: 'A pile $meters meters high, like a $floors-story building 🏢'
	String stat_fact_diapers({required Object meters, required Object floors}) => 'A pile ${meters} meters high, like a ${floors}-story building 🏢';

	/// en: 'About $liters liters of milk 🍼'
	String stat_fact_feedings({required Object liters}) => 'About ${liters} liters of milk 🍼';

	/// en: 'And still not enough 😍'
	String get stat_fact_kisses => 'And still not enough 😍';

	/// en: '$hours hours of folding tiny clothes 🧦'
	String stat_fact_laundry({required Object hours}) => '${hours} hours of folding tiny clothes 🧦';

	/// en: '$hours hours of live shows, unpaid 🎤'
	String stat_fact_lullabies({required Object hours}) => '${hours} hours of live shows, unpaid 🎤';

	/// en: '$hours hours awake at night, $nights full nights without sleep 🥱'
	String stat_fact_night_wakeups({required Object hours, required Object nights}) => '${hours} hours awake at night, ${nights} full nights without sleep 🥱';

	/// en: 'Feedings'
	String get stat_feedings => 'Feedings';

	/// en: 'Hidden'
	String get stat_hidden => 'Hidden';

	/// en: 'Kisses'
	String get stat_kisses => 'Kisses';

	/// en: 'Laundry loads'
	String get stat_laundry => 'Laundry loads';

	/// en: 'Lullabies'
	String get stat_lullabies => 'Lullabies';

	/// en: 'Night wake-ups'
	String get stat_night_wakeups => 'Night wake-ups';

	/// en: 'So far: $total'
	String stat_until_today({required Object total}) => 'So far: ${total}';

	/// en: '(female) {Add text or pictures, play with their order, and create the perfect surprise! The surprise will remain secret until you decide it's ready for your partner!} (male) {Add text or pictures, play with their order, and create the perfect surprise! The surprise will remain secret until you decide it's ready for your partner!}'
	String suprise_screen_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Add text or pictures, play with their order, and create the perfect surprise!\nThe surprise will remain secret until you decide it\'s ready for your partner!';
			case GenderContext.male:
				return 'Add text or pictures, play with their order, and create the perfect surprise!\nThe surprise will remain secret until you decide it\'s ready for your partner!';
		}
	}

	/// en: '(female) {Are you sure you want to delete $text?} (male) {Are you sure you want to delete $text?}'
	String sure_delete_name({required GenderContext context, required Object text}) {
		switch (context) {
			case GenderContext.female:
				return 'Are you sure you want to delete ${text}?';
			case GenderContext.male:
				return 'Are you sure you want to delete ${text}?';
		}
	}

	/// en: '(female) {Are you sure you want to delete this event?} (male) {Are you sure you want to delete this event?}'
	String sure_delete({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Are you sure you want to delete this event?';
			case GenderContext.male:
				return 'Are you sure you want to delete this event?';
		}
	}

	/// en: '(female) {Are you sure you want to log out?} (male) {Are you sure you want to log out?}'
	String sure_logout({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Are you sure you want to log out?';
			case GenderContext.male:
				return 'Are you sure you want to log out?';
		}
	}

	/// en: '(female) {Tap the gift to open it 🎁} (male) {Tap the gift to open it 🎁}'
	String tap_to_open_gift({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Tap the gift to open it 🎁';
			case GenderContext.male:
				return 'Tap the gift to open it 🎁';
		}
	}

	/// en: '(female) {Tap to open 💌} (male) {Tap to open 💌}'
	String tap_to_open({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Tap to open 💌';
			case GenderContext.male:
				return 'Tap to open 💌';
		}
	}

	/// en: '(female) {Want to redeem a coupon? Drag the stub and tear it in front of $name 😉} (male) {Want to redeem a coupon? Drag the stub and tear it in front of $name 😉}'
	String tear_coupon_explanation({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'Want to redeem a coupon? Drag the stub and tear it in front of ${name} 😉';
			case GenderContext.male:
				return 'Want to redeem a coupon? Drag the stub and tear it in front of ${name} 😉';
		}
	}

	/// en: 'Text'
	String get text => 'Text';

	/// en: 'Please fill in the text'
	String get text_appear_required => 'Please fill in the text';

	/// en: '(female) {Come on, write a heartfelt blessing or some funny text!} (male) {Come on, write a heartfelt blessing or some funny text!}'
	String text_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Come on, write a heartfelt blessing or some funny text!';
			case GenderContext.male:
				return 'Come on, write a heartfelt blessing or some funny text!';
		}
	}

	/// en: 'The Image'
	String get the_image => 'The Image';

	/// en: 'The Text'
	String get the_text => 'The Text';

	/// en: 'Third Question'
	String get third_question => 'Third Question';

	/// en: 'Third Wish'
	String get third_wish => 'Third Wish';

	/// en: 'Time capsule'
	String get time_capsule => 'Time capsule';

	/// en: '(female) {Write the kids a letter that opens only on the date you choose: next birthday, age 18... ⏳} (male) {Write the kids a letter that opens only on the date you choose: next birthday, age 18... ⏳}'
	String time_capsule_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Write the kids a letter that opens only on the date you choose: next birthday, age 18... ⏳';
			case GenderContext.male:
				return 'Write the kids a letter that opens only on the date you choose: next birthday, age 18... ⏳';
		}
	}

	/// en: '(female) {Write a letter and choose when the capsule opens. $name can add a letter too, and it all stays locked until then.} (male) {Write a letter and choose when the capsule opens. $name can add a letter too, and it all stays locked until then.}'
	String time_capsule_editor_explanation({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'Write a letter and choose when the capsule opens. ${name} can add a letter too, and it all stays locked until then.';
			case GenderContext.male:
				return 'Write a letter and choose when the capsule opens. ${name} can add a letter too, and it all stays locked until then.';
		}
	}

	/// en: 'A time capsule for $name'
	String time_capsule_title({required Object name}) => 'A time capsule for ${name}';

	/// en: 'Title'
	String get title => 'Title';

	/// en: 'The title to appear for this category'
	String get title_appear_category => 'The title to appear for this category';

	/// en: 'Please fill in the title'
	String get title_appear_required => 'Please fill in the title';

	/// en: '$name's perfect day 🗓️'
	String title_calendar({required Object name}) => '${name}\'s perfect day 🗓️';

	/// en: 'Our memory game 🧠'
	String get title_memory => 'Our memory game 🧠';

	/// en: 'Our photos 📸'
	String get title_pictures => 'Our photos 📸';

	/// en: '(female) {How well do you know me? 🤔} (male) {How well do you know me? 🤔}'
	String title_quiz({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'How well do you know me? 🤔';
			case GenderContext.male:
				return 'How well do you know me? 🤔';
		}
	}

	/// en: 'A surprise for $name 🎁'
	String title_surprise({required Object name}) => 'A surprise for ${name} 🎁';

	/// en: 'A greeting for $name 💌'
	String title_text({required Object name}) => 'A greeting for ${name} 💌';

	/// en: 'Our videos 🎬'
	String get title_videos => 'Our videos 🎬';

	/// en: '3 wishes for $name 🧞'
	String title_wishes({required Object name}) => '3 wishes for ${name} 🧞';

	/// en: 'Too many requests for this account'
	String get too_many_requests => 'Too many requests for this account';

	/// en: 'True'
	String get true_ => 'True';

	/// en: 'True or False Question'
	String get true_false_question => 'True or False Question';

	/// en: 'Two Weeks'
	String get two_weeks => 'Two Weeks';

	/// en: 'A typical day here'
	String get typical_day => 'A typical day here';

	/// en: 'Unlocked'
	String get unlock => 'Unlocked';

	/// en: 'Uploaded $file out of $files files'
	String upload_files_count({required Object file, required Object files}) => 'Uploaded ${file} out of ${files} files';

	/// en: 'Upload Images'
	String get upload_images => 'Upload Images';

	/// en: '(female) {Upload 6 images for the memory game} (male) {Upload 6 images for the memory game}'
	String upload_six_images({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Upload 6 images for the memory game';
			case GenderContext.male:
				return 'Upload 6 images for the memory game';
		}
	}

	/// en: 'Use Emojis'
	String get use_emojis => 'Use Emojis';

	/// en: 'User is disabled'
	String get user_disabled => 'User is disabled';

	/// en: 'This email was not found. Please try again'
	String get user_not_found => 'This email was not found. Please try again';

	/// en: 'Videos'
	String get videos => 'Videos';

	/// en: '(female) {Add YouTube videos that remind you how cute you are together} (male) {Add YouTube videos that remind you how cute you are together}'
	String videos_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Add YouTube videos that remind you how cute you are together';
			case GenderContext.male:
				return 'Add YouTube videos that remind you how cute you are together';
		}
	}

	/// en: 'Waiting for phone login'
	String get wait_for_phone_login => 'Waiting for phone login';

	/// en: 'Successfully logged in! You can now switch to the clock'
	String get watch_login_success => 'Successfully logged in!\nYou can now switch to the clock';

	/// en: 'We will use the selected texts to build a personalized app'
	String get we_use => 'We will use the selected texts to build a personalized app';

	/// en: 'Week'
	String get week => 'Week';

	/// en: 'Welcome!'
	String get welcome => 'Welcome!';

	/// en: '(female) {New categories for parents! Add your kids in the settings and their ages unlock special categories.} (male) {New categories for parents! Add your kids in the settings and their ages unlock special categories.}'
	String whats_new_add_children({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'New categories for parents! Add your kids in the settings and their ages unlock special categories.';
			case GenderContext.male:
				return 'New categories for parents! Add your kids in the settings and their ages unlock special categories.';
		}
	}

	/// en: '(female) {New family categories, by your kids' ages. Tap the button to try them!} (male) {New family categories, by your kids' ages. Tap the button to try them!}'
	String whats_new_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'New family categories, by your kids\' ages. Tap the button to try them!';
			case GenderContext.male:
				return 'New family categories, by your kids\' ages. Tap the button to try them!';
		}
	}

	/// en: '(female) {New for you: $title, from $name 🎁 Tap to open!} (male) {New for you: $title, from $name 🎁 Tap to open!}'
	String whats_new_partner_description({required GenderContext context, required Object title, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'New for you: ${title}, from ${name} 🎁 Tap to open!';
			case GenderContext.male:
				return 'New for you: ${title}, from ${name} 🎁 Tap to open!';
		}
	}

	/// en: '(female) {New: family categories! A letter from the kids, milestones and more. Add your kids in the settings so $name can make you family surprises 👶} (male) {New: family categories! A letter from the kids, milestones and more. Add your kids in the settings so $name can make you family surprises 👶}'
	String whats_new_partner_intro({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'New: family categories! A letter from the kids, milestones and more. Add your kids in the settings so ${name} can make you family surprises 👶';
			case GenderContext.male:
				return 'New: family categories! A letter from the kids, milestones and more. Add your kids in the settings so ${name} can make you family surprises 👶';
		}
	}

	/// en: 'You have a new surprise!'
	String get whats_new_partner_title => 'You have a new surprise!';

	/// en: 'Family categories!'
	String get whats_new_title => 'Family categories!';

	/// en: '$feature of $name: whose are they?'
	String whose_feature({required Object feature, required Object name}) => '${feature} of ${name}: whose are they?';

	/// en: 'To unlock it, please ask $name for a new chance'
	String wish_list_lock_description({required Object name}) => 'To unlock it, please ask ${name} for a new chance';

	/// en: 'Wish List is Locked'
	String get wish_list_lock_title => 'Wish List is Locked';

	/// en: 'Wishes List'
	String get wishes_list => 'Wishes List';

	/// en: '(female) {Let $name choose 3 wishes: Write a little "contract" so they can't go overboard!} (male) {Let $name choose 3 wishes: Write a little "contract" so they can't go overboard!}'
	String wishes_list_description({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.female:
				return 'Let ${name} choose 3 wishes:\nWrite a little "contract" so they can\'t go overboard!';
			case GenderContext.male:
				return 'Let ${name} choose 3 wishes:\nWrite a little "contract" so they can\'t go overboard!';
		}
	}

	/// en: 'With love'
	String get with_love => 'With love';

	/// en: 'Write schedule for: $title'
	String write_calendar_time_to({required Object title}) => 'Write schedule for: ${title}';

	/// en: 'Write a Contract'
	String get write_contract => 'Write a Contract';

	/// en: 'Write a Contract for: $title'
	String write_contract_to({required Object title}) => 'Write a Contract for: ${title}';

	/// en: 'Write text'
	String get write_text => 'Write text';

	/// en: 'Write text for: $title'
	String write_text_to({required Object title}) => 'Write text for: ${title}';

	/// en: 'Incorrect password. Please try again'
	String get wrong_password => 'Incorrect password. Please try again';

	/// en: 'Yes'
	String get yes => 'Yes';

	/// en: 'You answered correctly $answers out of $questions questions'
	String you_answer_from({required Object answers, required Object questions}) => 'You answered correctly ${answers} out of ${questions} questions';

	/// en: '(female) {You Win!} (male) {You Win!}'
	String you_win({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'You Win!';
			case GenderContext.male:
				return 'You Win!';
		}
	}

	/// en: '(female) {Your guesses (optional)} (male) {Your guesses (optional)}'
	String your_guess_optional({required GenderContext context}) {
		switch (context) {
			case GenderContext.female:
				return 'Your guesses (optional)';
			case GenderContext.male:
				return 'Your guesses (optional)';
		}
	}
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'add_children_to_unlock' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Have kids? Add them in the settings to unlock new family categories 🎉'; case GenderContext.male: return 'Have kids? Add them in the settings to unlock new family categories 🎉'; } }, 
			'add_children' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Add children'; case GenderContext.male: return 'Add children'; } }, 
			'add_child' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Add a child'; case GenderContext.male: return 'Add a child'; } }, 
			'add_event_date' => ({required GenderContext context, required Object date}) { switch (context) { case GenderContext.female: return 'Add Event to ${date}'; case GenderContext.male: return 'Add Event to ${date}'; } }, 
			'add_event' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Add Event'; case GenderContext.male: return 'Add Event'; } }, 
			'add_free_text' => 'Add Free Text',
			'add_image' => 'Add Image',
			'add_milestone' => 'Add a milestone',
			'add_photo_optional' => 'Add a photo (optional)',
			'add_picture' => 'Add picture',
			'add_pictures' => 'Add pictures',
			'add_pictures_to' => ({required Object title}) => 'Add pictures for: ${title}',
			'add_question' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Add Question'; case GenderContext.male: return 'Add Question'; } }, 
			'add_quiz_to' => ({required Object title}) => 'Add Quiz to: ${title}',
			'add_suprise' => 'Add a Surprise',
			'add_text' => 'Add text',
			'add_text_pictures_description' => ({required Object title}) => 'Add text and pictures for: ${title}',
			'add_videos' => 'Add videos',
			'add_videos_to' => ({required Object title}) => 'Add videos for: ${title}',
			'add' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Add'; case GenderContext.male: return 'Add'; } }, 
			'age' => 'Age',
			'age_and' => ({required Object first, required Object second}) => '${first} and ${second}',
			'age_day_one' => '1 day',
			'age_day_two' => '2 days',
			'age_days' => ({required Object n}) => '${n} days',
			'age_month_one' => '1 month',
			'age_month_two' => '2 months',
			'age_months' => ({required Object n}) => '${n} months',
			'age_year_one' => '1 year',
			'age_year_two' => '2 years',
			'age_years' => ({required Object n}) => '${n} years',
			'all_coupons_redeemed' => 'All coupons redeemed! 🎉',
			'app_info' => 'App Info',
			'app_name' => 'App Name',
			'app_version' => 'App Version',
			'at_age' => ({required Object age}) => 'at ${age}',
			'baby_letter' => 'A letter from the kids',
			'baby_letter_boy_1' => ({required GenderContext context, required Object age}) { switch (context) { case GenderContext.female: return 'My Mom,\nI\'m only ${age} old and can\'t write yet (they helped me a little 🙈), but one thing I already know for sure: you\'re the best mom in the world.\nThank you for every hug, every lullaby and every time you made me laugh.\nHappy birthday! I love you to the moon and back 🌙'; case GenderContext.male: return 'My Dad,\nI\'m only ${age} old and can\'t write yet (they helped me a little 🙈), but one thing I already know for sure: you\'re the best dad in the world.\nThank you for every hug, every lullaby and every time you made me laugh.\nHappy birthday! I love you to the moon and back 🌙'; } }, 
			'baby_letter_boy_2' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Mom,\nA few things I wanted to tell you:\n1. When you hold me, I feel the safest in the world.\n2. Sorry about the sleepless nights. Kind of.\n3. When you smile at me, I smile back. Always.\nHappy birthday to my very own mom!'; case GenderContext.male: return 'Dad,\nA few things I wanted to tell you:\n1. When you hold me, I feel the safest in the world.\n2. Sorry about the sleepless nights. Kind of.\n3. When you smile at me, I smile back. Always.\nHappy birthday to my very own dad!'; } }, 
			'baby_letter_boy_3' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Happy birthday Mom! 🎂\nToday you\'re allowed to sleep in (no promises 😇).\nThank you for always being there for me. Love you so so much!'; case GenderContext.male: return 'Happy birthday Dad! 🎂\nToday you\'re allowed to sleep in (no promises 😇).\nThank you for always being there for me. Love you so so much!'; } }, 
			'baby_letter_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Write a moving letter in the kids\' name, as if they wrote it themselves 👣'; case GenderContext.male: return 'Write a moving letter in the kids\' name, as if they wrote it themselves 👣'; } }, 
			'baby_letter_editor_explanation' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'Write the letter in ${name}\'s voice. Start from a ready letter and make it yours.'; case GenderContext.male: return 'Write the letter in ${name}\'s voice. Start from a ready letter and make it yours.'; } }, 
			'baby_letter_girl_1' => ({required GenderContext context, required Object age}) { switch (context) { case GenderContext.female: return 'My Mom,\nI\'m only ${age} old and can\'t write yet (they helped me a little 🙈), but one thing I already know for sure: you\'re the best mom in the world.\nThank you for every hug, every lullaby and every time you made me laugh.\nHappy birthday! I love you to the moon and back 🌙'; case GenderContext.male: return 'My Dad,\nI\'m only ${age} old and can\'t write yet (they helped me a little 🙈), but one thing I already know for sure: you\'re the best dad in the world.\nThank you for every hug, every lullaby and every time you made me laugh.\nHappy birthday! I love you to the moon and back 🌙'; } }, 
			'baby_letter_girl_2' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Mom,\nA few things I wanted to tell you:\n1. When you hold me, I feel the safest in the world.\n2. Sorry about the sleepless nights. Kind of.\n3. When you smile at me, I smile back. Always.\nHappy birthday to my very own mom!'; case GenderContext.male: return 'Dad,\nA few things I wanted to tell you:\n1. When you hold me, I feel the safest in the world.\n2. Sorry about the sleepless nights. Kind of.\n3. When you smile at me, I smile back. Always.\nHappy birthday to my very own dad!'; } }, 
			'baby_letter_girl_3' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Happy birthday Mom! 🎂\nToday you\'re allowed to sleep in (no promises 😇).\nThank you for always being there for me. Love you so so much!'; case GenderContext.male: return 'Happy birthday Dad! 🎂\nToday you\'re allowed to sleep in (no promises 😇).\nThank you for always being there for me. Love you so so much!'; } }, 
			'baby_letter_girls_1' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Our Mom,\nWe\'re still too little to write (they helped us a little 🙈), but one thing we know for sure: you\'re the best mom in the world.\nThank you for all the hugs, songs and laughs.\nHappy birthday! We love you to the moon and back 🌙'; case GenderContext.male: return 'Our Dad,\nWe\'re still too little to write (they helped us a little 🙈), but one thing we know for sure: you\'re the best dad in the world.\nThank you for all the hugs, songs and laughs.\nHappy birthday! We love you to the moon and back 🌙'; } }, 
			'baby_letter_girls_2' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Happy birthday Mom! 🎂\nToday we promise not to fight over who sits next to you (at least until the evening).\nThank you for always being there for us. Love you lots!'; case GenderContext.male: return 'Happy birthday Dad! 🎂\nToday we promise not to fight over who sits next to you (at least until the evening).\nThank you for always being there for us. Love you lots!'; } }, 
			'baby_letter_hint' => ({required Object name}) => '${name}\'s letter ✍️',
			'baby_letter_kids_1' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Our Mom,\nWe\'re still too little to write (they helped us a little 🙈), but one thing we know for sure: you\'re the best mom in the world.\nThank you for all the hugs, songs and laughs.\nHappy birthday! We love you to the moon and back 🌙'; case GenderContext.male: return 'Our Dad,\nWe\'re still too little to write (they helped us a little 🙈), but one thing we know for sure: you\'re the best dad in the world.\nThank you for all the hugs, songs and laughs.\nHappy birthday! We love you to the moon and back 🌙'; } }, 
			'baby_letter_kids_2' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Happy birthday Mom! 🎂\nToday we promise not to fight over who sits next to you (at least until the evening).\nThank you for always being there for us. Love you lots!'; case GenderContext.male: return 'Happy birthday Dad! 🎂\nToday we promise not to fight over who sits next to you (at least until the evening).\nThank you for always being there for us. Love you lots!'; } }, 
			'baby_letter_title' => ({required Object name}) => 'A letter from ${name}',
			'back' => 'Back',
			'birthday_calendar' => 'Birthday Calendar',
			'birthday_calendar_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Plan the coolest and most fun schedule for your partner\'s birthday! Create a perfect day filled with surprises and unforgettable activities.'; case GenderContext.male: return 'Plan the coolest and most fun schedule for your partner\'s birthday! Create a perfect day filled with surprises and unforgettable activities.'; } }, 
			'birthday_suprise' => 'Birthday Surprise',
			'birthday_suprise_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Create a birthday surprise, but shhh... it stays locked until your partner opens it!'; case GenderContext.male: return 'Create a birthday surprise, but shhh... it stays locked until your partner opens it!'; } }, 
			'boy' => 'Boy',
			'build_app' => 'Building the App',
			'build_app_description' => 'The app is currently being customized just for you!',
			'cancel' => 'Cancel',
			'cant_upload_more_than' => ({required GenderContext context, required Object number}) { switch (context) { case GenderContext.female: return 'You cannot upload more than ${number} files'; case GenderContext.male: return 'You cannot upload more than ${number} files'; } }, 
			'capsule_add_my_letter' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Add your letter ✍️'; case GenderContext.male: return 'Add your letter ✍️'; } }, 
			'capsule_birthday_18' => ({required Object name}) => '${name}\'s 18th birthday',
			'capsule_date_required' => 'Choose when the capsule opens',
			'capsule_edit_my_letter' => 'Edit my letter',
			'capsule_for' => ({required Object name}) => 'A time capsule for ${name}',
			'capsule_in_a_year' => 'In a year',
			'capsule_letter_hint' => ({required Object name}) => 'What would you like to tell ${name} in the future?',
			'capsule_letter_of' => ({required Object name}) => '${name}\'s letter',
			'capsule_next_birthday' => ({required Object name}) => '${name}\'s next birthday',
			'capsule_opened' => ({required Object name}) => '${name}\'s capsule is open! 🎉',
			'capsule_opens_at' => ({required Object date}) => 'Opens on ${date}',
			'capsule_opens_on' => 'When does the capsule open?',
			'capsule_other_date' => 'Another date',
			'capsule_partner_sealed' => ({required Object name}) => '💌 ${name} sealed a letter in the capsule too',
			'capsule_your_letter' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Your letter for the capsule'; case GenderContext.male: return 'Your letter for the capsule'; } }, 
			'category_deleted' => 'This category was deleted',
			'celebrant' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Celebrant'; case GenderContext.male: return 'Celebrant'; } }, 
			'change_color' => 'Change Color',
			'change_gender' => 'Change Gender',
			'change_language' => 'Change Language',
			'change_password' => 'Change Password',
			'change_plan' => 'Change Plan',
			'child_birth_date' => 'Date of birth',
			'child_birth_date_required' => 'Choose a date of birth',
			'child_name' => 'Name',
			'child_name_required' => 'Fill in a name',
			'child_photo_required' => 'Add a photo of each child',
			'child_removed' => 'Some of this category\'s children were removed in the settings',
			'children' => 'Children',
			'children_photos' => 'The kids\' photos',
			'children_unlock_explanation' => 'Your kids\' ages unlock family categories: a letter from the kids, milestones, parenting stats and more 👶',
			'choose_at_least_one_child' => 'Choose at least one child',
			'choose_category' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Choose a category'; case GenderContext.male: return 'Choose a category'; } }, 
			'choose_child' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Who is it about? (you can pick several)'; case GenderContext.male: return 'Who is it about? (you can pick several)'; } }, 
			'choose_color' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Choose a color from the palette'; case GenderContext.male: return 'Choose a color from the palette'; } }, 
			'choose_couple_profile_image' => 'Choose your couple\'s profile image',
			'choose_coupons' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Pick 3 coupons to redeem whenever you like:'; case GenderContext.male: return 'Pick 3 coupons to redeem whenever you like:'; } }, 
			'choose_currect_answer' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Choose the correct answer'; case GenderContext.male: return 'Choose the correct answer'; } }, 
			'choose_day_hint' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Pick a day to see what\'s planned 👆'; case GenderContext.male: return 'Pick a day to see what\'s planned 👆'; } }, 
			'choose_gender' => 'Choose Gender',
			'choose_language' => 'Choose Language',
			'choose_own_gender' => 'Choose your gender',
			'choose_partner_gender' => 'Choose your partner\'s gender',
			'choose_question_delete' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Select the questions you want to delete'; case GenderContext.male: return 'Select the questions you want to delete'; } }, 
			'click_here' => 'Click Here',
			'click_here_start' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Click here to start'; case GenderContext.male: return 'Click here to start'; } }, 
			'confirm_images' => 'Confirm Images?',
			'contact_call' => 'Call',
			'contact_facebook' => 'Facebook',
			'contact_instagram' => 'Instagram',
			'contact_message' => 'Message',
			'contact_method_title' => 'Choose a Contact Method',
			'contact_tiktok' => 'TikTok',
			'contact_us' => 'Contact Us',
			'contact_website' => 'Website',
			'contact_whatsapp' => 'WhatsApp',
			'continue_' => 'Continue',
			'continue_no_change' => 'Continue without changing',
			'couple_categories' => '💑 Couple categories',
			'coupon_idea_breakfast_in_bed' => 'Breakfast in bed',
			'coupon_idea_date_night' => 'Date night, babysitter\'s on me',
			'coupon_idea_diaper_pass' => 'A day off diaper duty',
			'coupon_idea_friends_night' => 'A night out with friends',
			'coupon_idea_full_night' => 'A full night without getting up 😴',
			'coupon_idea_long_shower' => 'A long, uninterrupted shower',
			'coupon_idea_massage' => 'A 30-minute massage',
			'coupon_idea_sleep_in' => 'A morning to sleep in',
			'coupon_ideas' => 'Ideas:',
			'coupon_number' => ({required Object n}) => 'Coupon ${n}',
			'coupon_seat' => 'Seat',
			'coupon_stub' => 'STUB',
			'coupon_valid_forever' => 'VALID // FOREVER',
			'coupons_left' => ({required Object n}) => 'Coupons left: ${n}',
			'create_greeting_using_ai' => 'Create Greeting Using AI',
			'current_plan' => 'Current Plan',
			'date_of_birth' => 'Date of Birth',
			'days' => 'days',
			'days_of_parenting' => 'days of parenting',
			'default_error' => 'Login or registration failed. Please try again',
			'delete' => 'Delete',
			'delete_account' => 'Delete account',
			'delete_account_description' => 'This permanently deletes your account, your partner\'s access, and every photo, video and message in your surprise. This can\'t be undone.',
			'delete_account_failed' => 'Couldn\'t delete the account. Check your connection and try again.',
			'delete_account_sure' => 'Delete your account?',
			'delete_child_description' => 'Categories already created won\'t be deleted.',
			'delete_wishes' => 'Delete Wishes',
			'delete_wishes_description' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'If the wishes don’t align with the contract, you can delete them and ${name} can refill them'; case GenderContext.male: return 'If the wishes don’t align with the contract, you can delete them and ${name} can refill them'; } }, 
			'description' => 'Description',
			'display_result' => 'Show Results',
			'display_wishes' => 'Show Wishes',
			'drag_to_reorder' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'Drag the cards (or long-press) to set the order ${name} sees ↕️'; case GenderContext.male: return 'Drag the cards (or long-press) to set the order ${name} sees ↕️'; } }, 
			'drag_to_tear' => 'drag to tear',
			'edit' => 'Edit',
			'edit_greeting' => 'Edit Greeting',
			'edit_title' => 'Edit Title',
			'email' => 'Email',
			'email_exist' => 'Email already exists',
			'email_not_valid' => 'Invalid email',
			'empty' => 'Empty',
			'event_description' => 'Event Description',
			'event_id' => 'Event ID',
			'event_in_date' => ({required Object date}) => 'Events on ${date}',
			'exit' => 'Exit',
			'exit_app_description' => 'Are you sure you want to exit?',
			'exit_app_title' => 'Exit the app?',
			'explanation_screen_text' => 'Welcome to the coolest birthday app there is!\n\nSo what do you actually do here? It\'s simple! You fill in details about yourself and your partner, and then start choosing how to spoil them. There are three plans: Free, Standard and Platinum. The free plan has limited options, and with Standard and Platinum you can let your imagination run wild and pick as many items as you like!\n\nHere are some of the things you can choose:\n\n- An AI-written greeting – a greeting that fits you perfectly.\n\n- A shared photo album – for touching experiences.\n\n- A shared video album – for unforgettable moments.\n\n- A trivia game you build – because a little fun and interaction is always good.\n\n- A schedule on a shared calendar – so you never forget the important events.\n\n- A birthday surprise page – a special page that stays locked until you decide otherwise.\n\n- A wish list – if you\'d like to spoil your partner with the things they dream about.\n\n- A memory game with your shared photos – a fun way to keep your beautiful memories.\n\nThe app is still in development, and we\'re working hard to add more awesome features to all the plans. Have another idea? We\'d love to hear it – maybe we\'ll make it happen for you!\n\nGood luck, and let\'s celebrate! 🎉🎉🎉\n\n',
			'explanation_screen_title' => 'Guide to Creating the Perfect Surprise',
			'failed_send_login_request' => 'Failed to send login request to phone. Please try again',
			'false_' => 'False',
			'family_categories' => '👨‍👩‍👧 Family categories',
			'feature_ears' => 'The ears',
			'feature_eyes' => 'The eyes',
			'feature_hair' => 'The hair',
			'feature_hands' => 'The hands',
			'feature_laugh' => 'The laugh',
			'feature_mouth' => 'The mouth',
			'feature_nose' => 'The nose',
			'feature_smile' => 'The smile',
			'feature_temper' => 'The temper 😅',
			'female' => 'Female',
			'fill_all_fields' => 'Please fill in all fields',
			'fill_partner_details' => 'Fill in your partner\'s details',
			'fill_your_details' => 'Fill in your details',
			'finish' => 'Finish',
			'first_name' => 'First Name',
			'first_password' => 'Set an initial password. Your partner can change the password.\nIf left blank, the password will be 123456',
			'first_question' => 'First Question',
			'first_register' => 'Initial Registration',
			'first_wish' => 'First Wish',
			'four_answers_question' => 'Four Answers Question',
			'fourth_question' => 'Fourth Question',
			'game_over' => 'Game Over',
			'gender' => 'Gender',
			'generate_greeting' => 'Generate Greeting',
			'generate_new_greeting' => 'Generate New Greeting',
			'generate_text_description' => ({required Object relationship, required Object name, required Object myName, required Object lineNumber, required Object wordsInLineNumber, required Object age}) => 'Write a birthday blessing for ${relationship}, the name is ${name}\nMy name is: ${myName}\nNumber of lines in the blessing: ${lineNumber}\nNumber of words per line: ${wordsInLineNumber}\nThe age is ${age}',
			'girl' => 'Girl',
			'got_full_app' => 'You got a full app just for this!',
			'greeter' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'Welcome ${name}'; case GenderContext.male: return 'Welcome ${name}'; } }, 
			'greeting_before_edit' => 'Blessing Before Edit',
			'greeting_first_login' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return '${name} has prepared the coolest surprise for you!\nAn app built especially for your birthday!\nHere you will find a heartfelt personal blessing,\nshared photos of your most beautiful moments,\nand more surprises to warm your heart,\nbecause you deserve all the best in the world!\nGet ready, this will be an unforgettable celebration! 🎉🎉🎉'; case GenderContext.male: return '${name} has prepared the coolest surprise for you!\nAn app built especially for your birthday!\nHere you will find a heartfelt personal blessing,\nshared photos of your most beautiful moments,\nand more surprises to warm your heart,\nbecause you deserve all the best in the world!\nGet ready, this will be an unforgettable celebration! 🎉🎉🎉'; } }, 
			'greeting_notes' => '* Your names will be automatically added\n* Your partner\'s age will be automatically added\n* After receiving the blessing, you can edit it however you\'d like',
			'have_account' => 'Already have an account?',
			'hide_password' => 'Hide password',
			'home_screen' => 'Home Screen',
			'hours' => 'hours',
			'how_it_grew' => 'How it added up 📈',
			'indicating' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Indicating'; case GenderContext.male: return 'Indicating'; } }, 
			'info' => 'Info',
			'invalid_credential' => 'Incorrect email or password. Please try again',
			'later' => 'Later',
			'less' => 'Less',
			'lets_continue' => 'Let\'s continue!',
			'lets_try' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Let\'s try!'; case GenderContext.male: return 'Let\'s try!'; } }, 
			'letter_from' => ({required Object name}) => 'A letter from ${name} 💌',
			'letter_template_number' => ({required Object n}) => 'Ready letter ${n}',
			'lines_number' => 'Number of Lines',
			'lock' => 'Locked',
			'locked_category' => 'This category is locked.\nTo unlock it, upgrade your plan in the settings',
			'login' => 'Login',
			'login_failed' => 'Login Failed',
			'login_screen' => 'Login Screen',
			'login_successful' => 'Successfully logged in!',
			'login_via_phone' => 'Log in via Phone',
			'login_with_otp_code' => 'Login with Verification Code',
			'login_with_password' => 'Login with Password',
			'logout' => 'Logout',
			'look_alike' => 'Who do they look like?',
			'look_alike_agreed' => ({required Object agreed, required Object total}) => 'You agreed on ${agreed} of ${total} guesses 🤝',
			'look_alike_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Eyes, nose, smile... who do the kids look like more? Find out who wins 👑'; case GenderContext.male: return 'Eyes, nose, smile... who do the kids look like more? Find out who wins 👑'; } }, 
			'look_alike_editor_explanation' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Add a photo of each child and of you both, at the same age if you have one, otherwise a current one. You can guess too and see if you agreed.'; case GenderContext.male: return 'Add a photo of each child and of you both, at the same age if you have one, otherwise a current one. You can guess too and see if you agreed.'; } }, 
			'look_alike_tie' => ({required Object name}) => 'It\'s a tie! ${name}: the perfect mix of you both 💞',
			'look_alike_title' => ({required Object name}) => 'Who does ${name} look like?',
			'look_alike_winner_boy' => ({required Object name, required Object parent}) => '${name} looks like ${parent}! 🎉',
			'look_alike_winner_girl' => ({required Object name, required Object parent}) => '${name} looks like ${parent}! 🎉',
			'male' => 'Male',
			'mark_all' => 'Mark All',
			'mark_least_one_question' => 'You must mark at least one question',
			'married' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'My Wife'; case GenderContext.male: return 'My Husband'; } }, 
			'max_words_in_line' => 'Max Words per Line',
			'memory_game' => 'Memory Game',
			'memory_game_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Create a fun memory game with 6 shared pictures of you two!'; case GenderContext.male: return 'Create a fun memory game with 6 shared pictures of you two!'; } }, 
			'memory_game_done' => ({required GenderContext context, required Object name, required Object score}) { switch (context) { case GenderContext.female: return '${name} finished the game with a score of ${score}'; case GenderContext.male: return '${name} finished the game with a score of ${score}'; } }, 
			'memory_game_lock_description' => ({required Object name}) => 'To unlock it, please ask ${name} for a new chance',
			'memory_game_lock_title' => 'Memory Game is Locked',
			'milestone_note' => 'A few words (optional)',
			'milestone_title' => 'What happened?',
			'milestone_title_required' => 'Write what happened',
			'milestones' => 'Milestones',
			'milestones_count' => ({required Object n, required Object name}) => '${n} milestones of ${name}',
			'milestones_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'A sweet timeline of all the firsts: first smile, first step and more 👣'; case GenderContext.male: return 'A sweet timeline of all the firsts: first smile, first step and more 👣'; } }, 
			'milestones_editor_explanation' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Add the firsts with a date, and a photo if you like. The age at each one is worked out for you.'; case GenderContext.male: return 'Add the firsts with a date, and a photo if you like. The age at each one is worked out for you.'; } }, 
			'milestones_title' => ({required Object name}) => '${name}\'s firsts',
			'minutes' => 'minutes',
			'month' => 'Month',
			'more' => 'More',
			'more_few_seconds' => 'In a few seconds, we’ll start building the perfect gift!',
			'more_firsts_coming' => 'And many more firsts to come...',
			'ms_crawled' => 'First crawl',
			'ms_first_birthday' => 'First birthday',
			'ms_first_daycare' => 'First day at daycare',
			'ms_first_food' => 'First food',
			'ms_first_haircut' => 'First haircut',
			'ms_first_smile' => 'First smile',
			'ms_first_steps' => 'First steps',
			'ms_first_tooth' => 'First tooth',
			'ms_first_word' => 'First word',
			'ms_rolled_over' => 'First roll over',
			'ms_sat_up' => 'First time sitting up',
			'ms_slept_through' => 'First full night\'s sleep',
			'my_dear' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'My Dear'; case GenderContext.male: return 'My Dear'; } }, 
			'names_and' => ({required Object first, required Object last}) => '${first} and ${last}',
			'new_badge' => 'NEW',
			'new_child' => 'New child',
			'new_password' => 'New Password',
			'new_password_verification' => 'Verify New Password',
			'no' => 'No',
			'no_account' => 'Don\'t have an account?',
			'no_allow_text_empty' => 'Text cannot be empty',
			'no_category_added' => 'No categories have been added for this event',
			'no_children_yet' => 'No children added yet',
			'no_events_this_day' => 'No plans this day... yet 😉',
			'no_milestones_yet' => 'No milestones yet. Time to add the first!',
			'no_owner' => 'The user is not an administrative user',
			'no_questions_add' => 'No questions added yet',
			'no_required' => 'Not Required',
			'no_wish_yet' => 'No wishes yet',
			'not_played_yet' => 'Not played yet',
			'not_written_yet' => 'not written yet',
			'nothing_here_yet' => 'Nothing here yet',
			'num_mistakes' => 'Number of Mistakes',
			'num_of_questions' => ({required Object number}) => 'You currently have ${number} questions',
			'ok' => 'OK',
			'open_it' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Open'; case GenderContext.male: return 'Open'; } }, 
			'open_new_memory_game' => 'Open a New Memory Game',
			'open_new_quiz_game' => 'Open a New Quiz',
			'operation_not_allowed' => 'Server error. Please try again later',
			'otp_code' => 'Verification Code',
			'otp_code_description' => 'You received an SMS with a verification code.\nPlease enter it and click OK',
			'parent_coupon_label' => 'PARENTING COUPON',
			'parent_coupons' => 'Parenting coupons',
			'parent_coupons_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Write a little contract, and your partner picks 3 coupons for tired parents: real tickets you tear when redeeming 🎟️'; case GenderContext.male: return 'Write a little contract, and your partner picks 3 coupons for tired parents: real tickets you tear when redeeming 🎟️'; } }, 
			'parent_photo_hint' => ({required Object age}) => 'A photo of you at ${age} is best. Don\'t have one? A current one will do 😉',
			'parent_stats' => 'Parenting stats',
			'parent_stats_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'How many diapers, coffees, sleepless nights? Funny numbers with charts, by the days since birth 📊'; case GenderContext.male: return 'How many diapers, coffees, sleepless nights? Funny numbers with charts, by the days since birth 📊'; } }, 
			'parent_stats_editor_explanation' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'How many a day on average, per child? Totals are worked out by the days since birth. 0 hides the row.'; case GenderContext.male: return 'How many a day on average, per child? Totals are worked out by the days since birth. 0 hides the row.'; } }, 
			'parent_stats_title' => ({required Object name}) => 'Parenting by the numbers: ${name}',
			'parents_photos' => 'Your photos',
			'partner_info' => 'Partner\'s Info',
			'partner_phone_is_yours' => 'This is your phone number. Enter your partner\'s number',
			'partner_phone_taken' => 'This phone number already belongs to another account',
			'password' => 'Password',
			'password_dont_match' => 'Passwords do not match',
			'password_dont_match_description' => 'The two passwords you entered do not match, please try again',
			'password_verification' => 'Password Verification',
			'phone' => 'Phone',
			'phone_exist' => 'Phone number already exists',
			'phone_exist_description' => 'This phone number is already registered in our system. Please go to the login screen and try again',
			'phone_not_exist_system' => 'Phone number does not exist in the system',
			'phone_not_valid' => 'Invalid phone number',
			'phone_not_valid_description' => 'The phone number seems invalid. Please try again',
			'phone_verification' => 'Phone Verification',
			'pick_color' => 'Pick Color',
			'pick_date_range' => 'Pick Date Range',
			'pictures' => 'Pictures',
			'pictures_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Add some shared pictures that will melt your hearts'; case GenderContext.male: return 'Add some shared pictures that will melt your hearts'; } }, 
			'plan_feature_calendar' => 'A birthday schedule on a shared calendar',
			'plan_feature_greeting' => 'A touching greeting text',
			'plan_feature_greeting_ai' => 'A touching greeting text - AI can write it',
			'plan_feature_images' => ({required Object limit}) => 'Photo gallery (up to ${limit} photos)',
			'plan_feature_memory_game' => 'A memory game with your own shared photos!',
			'plan_feature_no_ads' => 'No ads',
			'plan_feature_surprise' => 'Birthday surprise - a locked screen until you decide to reveal it',
			'plan_feature_trivia' => 'A fun and challenging trivia game',
			'plan_feature_videos' => ({required Object limit}) => 'Video gallery (up to ${limit} videos)',
			'plan_feature_wishes' => 'Wish list - let your partner ask for 3 wishes',
			'plan_free' => 'Free',
			'plan_platinum' => 'Platinum',
			'plan_standard' => 'Standard',
			'play_again' => ({required Object name}) => 'Let ${name} play again',
			'please_choose_category' => 'Please choose a category',
			'please_open_app_in_phone' => 'Please open the app on your phone to log in',
			'please_read_contract' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'A contract written by ${name} especially for you'; case GenderContext.male: return 'A contract written by ${name} especially for you'; } }, 
			'purchase_failed' => 'The purchase could not be completed. Please try again',
			'purchase_pending' => 'The purchase is awaiting approval. Your plan will be updated once it is approved',
			'purchase_saved_for_later' => 'The purchase went through! Your plan will be updated shortly',
			'question' => 'Question',
			'questions' => 'Questions',
			'quiz_game' => 'Quiz Game',
			'quiz_game_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Build a trivia game to see if you know who\'s who!'; case GenderContext.male: return 'Build a trivia game to see if you know who\'s who!'; } }, 
			'quiz_game_done' => 'Trivia Game Completed',
			'quiz_game_partner_description' => ({required GenderContext context, required Object name, required Object number}) { switch (context) { case GenderContext.female: return 'Welcome to the trivia game!\n${name} has prepared ${number} intriguing questions for you.\n❤️ Reminder: You cannot change an answer once given, so answer carefully and have fun 😉\nGood luck!'; case GenderContext.male: return 'Welcome to the trivia game!\n${name} has prepared ${number} intriguing questions for you.\n❤️ Reminder: You cannot change an answer once given, so answer carefully and have fun 😉\nGood luck!'; } }, 
			'quiz_game_partner_no_questions' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return '${name} hasn\'t added any questions yet'; case GenderContext.male: return '${name} hasn\'t added any questions yet'; } }, 
			'quiz_game_played' => ({required GenderContext context, required Object name, required Object answered, required Object total, required Object score}) { switch (context) { case GenderContext.female: return '${name} answered ${answered} of ${total} questions, ${score} correct'; case GenderContext.male: return '${name} answered ${answered} of ${total} questions, ${score} correct'; } }, 
			'quiz_verdict_good' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Not bad at all! 😄'; case GenderContext.male: return 'Not bad at all! 😄'; } }, 
			'quiz_verdict_great' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Wow! You really know me 🏆'; case GenderContext.male: return 'Wow! You really know me 🏆'; } }, 
			'quiz_verdict_low' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'We still have some learning to do 😅'; case GenderContext.male: return 'We still have some learning to do 😅'; } }, 
			'rate_app' => 'Rate the app',
			'ready_letters' => 'Ready letters:',
			'recommand_drak_colors' => 'Dark colors are recommended',
			'recommended_colors' => 'Recommended Colors',
			'redeemed' => 'REDEEMED',
			'register' => 'Register',
			'register_screen' => 'Register Screen',
			'relationship' => 'Relationship',
			'remove_question' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Remove Question'; case GenderContext.male: return 'Remove Question'; } }, 
			'remove' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Remove'; case GenderContext.male: return 'Remove'; } }, 
			'reorder' => 'Reorder',
			'replace_photo' => 'Replace photo',
			'required_fill_all_answer' => 'You must fill in all the answers',
			'required_fill_question' => 'You must fill in the question',
			'save' => 'Save',
			'save_and_lock' => 'Save and Lock',
			'save_and_print_coupons' => 'Save & print 🎟️',
			'score' => 'Score',
			'seal_letter' => 'Seal in the capsule 🔒',
			'sealed' => 'sealed',
			'second_question' => 'Second Question',
			'second_wish' => 'Second Wish',
			'seconds' => 'seconds',
			'secret_dialog' => ({required GenderContext context, required Object categoryName, required Object name}) { switch (context) { case GenderContext.female: return '"${categoryName}" is locked until ${name} grants you permission to open it!'; case GenderContext.male: return '"${categoryName}" is locked until ${name} grants you permission to open it!'; } }, 
			'select_time' => 'Select Time',
			'selected_color' => 'Selected Color',
			'selected_time' => ({required Object time}) => 'Selected Time: ${time}',
			'selected' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Selected'; case GenderContext.male: return 'Selected'; } }, 
			'send_again' => 'Send Again',
			'send_code' => 'Send Code',
			'settings' => 'Settings',
			'share_app' => 'Sharing the app',
			'share_app_message' => ({required Object url}) => 'Create a personal birthday app for someone you love with Easy Birthday 🎉\n${url}',
			'short_password' => 'Password too short',
			'short_password_description' => 'Password must be at least 8 characters',
			'show_password' => 'Show password',
			'skip' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Skip'; case GenderContext.male: return 'Skip'; } }, 
			'so_far' => 'So far',
			'something_went_wrong' => 'Something went wrong. Please try again',
			'soon' => 'Coming Soon',
			'soul_mate' => 'Soul Mate',
			'special_age' => ({required Object age}) => '${age} is a special age',
			'spouse' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'My Partner'; case GenderContext.male: return 'My Partner'; } }, 
			'stat_coffee' => 'Cups of coffee',
			'stat_daily_coffee' => 'Cups of coffee a day',
			'stat_daily_diapers' => 'Diapers a day',
			'stat_daily_feedings' => 'Feedings a day',
			'stat_daily_kisses' => 'Kisses a day',
			'stat_daily_laundry' => 'Laundry loads a day',
			'stat_daily_lullabies' => 'Lullabies a day',
			'stat_daily_night_wakeups' => 'Night wake-ups',
			'stat_diapers' => 'Diapers changed',
			'stat_fact_coffee' => ({required Object liters, required Object baths}) => '${liters} liters of coffee, enough to fill ${baths} bathtubs ☕',
			'stat_fact_diapers' => ({required Object meters, required Object floors}) => 'A pile ${meters} meters high, like a ${floors}-story building 🏢',
			'stat_fact_feedings' => ({required Object liters}) => 'About ${liters} liters of milk 🍼',
			'stat_fact_kisses' => 'And still not enough 😍',
			'stat_fact_laundry' => ({required Object hours}) => '${hours} hours of folding tiny clothes 🧦',
			'stat_fact_lullabies' => ({required Object hours}) => '${hours} hours of live shows, unpaid 🎤',
			'stat_fact_night_wakeups' => ({required Object hours, required Object nights}) => '${hours} hours awake at night, ${nights} full nights without sleep 🥱',
			'stat_feedings' => 'Feedings',
			'stat_hidden' => 'Hidden',
			'stat_kisses' => 'Kisses',
			'stat_laundry' => 'Laundry loads',
			'stat_lullabies' => 'Lullabies',
			'stat_night_wakeups' => 'Night wake-ups',
			'stat_until_today' => ({required Object total}) => 'So far: ${total}',
			'suprise_screen_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Add text or pictures, play with their order, and create the perfect surprise!\nThe surprise will remain secret until you decide it\'s ready for your partner!'; case GenderContext.male: return 'Add text or pictures, play with their order, and create the perfect surprise!\nThe surprise will remain secret until you decide it\'s ready for your partner!'; } }, 
			'sure_delete_name' => ({required GenderContext context, required Object text}) { switch (context) { case GenderContext.female: return 'Are you sure you want to delete ${text}?'; case GenderContext.male: return 'Are you sure you want to delete ${text}?'; } }, 
			'sure_delete' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Are you sure you want to delete this event?'; case GenderContext.male: return 'Are you sure you want to delete this event?'; } }, 
			'sure_logout' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Are you sure you want to log out?'; case GenderContext.male: return 'Are you sure you want to log out?'; } }, 
			'tap_to_open_gift' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Tap the gift to open it 🎁'; case GenderContext.male: return 'Tap the gift to open it 🎁'; } }, 
			'tap_to_open' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Tap to open 💌'; case GenderContext.male: return 'Tap to open 💌'; } }, 
			'tear_coupon_explanation' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'Want to redeem a coupon? Drag the stub and tear it in front of ${name} 😉'; case GenderContext.male: return 'Want to redeem a coupon? Drag the stub and tear it in front of ${name} 😉'; } }, 
			'text' => 'Text',
			'text_appear_required' => 'Please fill in the text',
			'text_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Come on, write a heartfelt blessing or some funny text!'; case GenderContext.male: return 'Come on, write a heartfelt blessing or some funny text!'; } }, 
			'the_image' => 'The Image',
			'the_text' => 'The Text',
			'third_question' => 'Third Question',
			'third_wish' => 'Third Wish',
			'time_capsule' => 'Time capsule',
			'time_capsule_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Write the kids a letter that opens only on the date you choose: next birthday, age 18... ⏳'; case GenderContext.male: return 'Write the kids a letter that opens only on the date you choose: next birthday, age 18... ⏳'; } }, 
			'time_capsule_editor_explanation' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'Write a letter and choose when the capsule opens. ${name} can add a letter too, and it all stays locked until then.'; case GenderContext.male: return 'Write a letter and choose when the capsule opens. ${name} can add a letter too, and it all stays locked until then.'; } }, 
			'time_capsule_title' => ({required Object name}) => 'A time capsule for ${name}',
			'title' => 'Title',
			'title_appear_category' => 'The title to appear for this category',
			'title_appear_required' => 'Please fill in the title',
			'title_calendar' => ({required Object name}) => '${name}\'s perfect day 🗓️',
			'title_memory' => 'Our memory game 🧠',
			'title_pictures' => 'Our photos 📸',
			'title_quiz' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'How well do you know me? 🤔'; case GenderContext.male: return 'How well do you know me? 🤔'; } }, 
			'title_surprise' => ({required Object name}) => 'A surprise for ${name} 🎁',
			'title_text' => ({required Object name}) => 'A greeting for ${name} 💌',
			'title_videos' => 'Our videos 🎬',
			'title_wishes' => ({required Object name}) => '3 wishes for ${name} 🧞',
			'too_many_requests' => 'Too many requests for this account',
			'true_' => 'True',
			'true_false_question' => 'True or False Question',
			'two_weeks' => 'Two Weeks',
			'typical_day' => 'A typical day here',
			'unlock' => 'Unlocked',
			'upload_files_count' => ({required Object file, required Object files}) => 'Uploaded ${file} out of ${files} files',
			'upload_images' => 'Upload Images',
			'upload_six_images' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Upload 6 images for the memory game'; case GenderContext.male: return 'Upload 6 images for the memory game'; } }, 
			'use_emojis' => 'Use Emojis',
			'user_disabled' => 'User is disabled',
			'user_not_found' => 'This email was not found. Please try again',
			'videos' => 'Videos',
			'videos_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Add YouTube videos that remind you how cute you are together'; case GenderContext.male: return 'Add YouTube videos that remind you how cute you are together'; } }, 
			'wait_for_phone_login' => 'Waiting for phone login',
			'watch_login_success' => 'Successfully logged in!\nYou can now switch to the clock',
			'we_use' => 'We will use the selected texts to build a personalized app',
			'week' => 'Week',
			'welcome' => 'Welcome!',
			'whats_new_add_children' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'New categories for parents! Add your kids in the settings and their ages unlock special categories.'; case GenderContext.male: return 'New categories for parents! Add your kids in the settings and their ages unlock special categories.'; } }, 
			'whats_new_description' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'New family categories, by your kids\' ages. Tap the button to try them!'; case GenderContext.male: return 'New family categories, by your kids\' ages. Tap the button to try them!'; } }, 
			'whats_new_partner_description' => ({required GenderContext context, required Object title, required Object name}) { switch (context) { case GenderContext.female: return 'New for you: ${title}, from ${name} 🎁 Tap to open!'; case GenderContext.male: return 'New for you: ${title}, from ${name} 🎁 Tap to open!'; } }, 
			'whats_new_partner_intro' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'New: family categories! A letter from the kids, milestones and more. Add your kids in the settings so ${name} can make you family surprises 👶'; case GenderContext.male: return 'New: family categories! A letter from the kids, milestones and more. Add your kids in the settings so ${name} can make you family surprises 👶'; } }, 
			'whats_new_partner_title' => 'You have a new surprise!',
			'whats_new_title' => 'Family categories!',
			'whose_feature' => ({required Object feature, required Object name}) => '${feature} of ${name}: whose are they?',
			'wish_list_lock_description' => ({required Object name}) => 'To unlock it, please ask ${name} for a new chance',
			'wish_list_lock_title' => 'Wish List is Locked',
			'wishes_list' => 'Wishes List',
			'wishes_list_description' => ({required GenderContext context, required Object name}) { switch (context) { case GenderContext.female: return 'Let ${name} choose 3 wishes:\nWrite a little "contract" so they can\'t go overboard!'; case GenderContext.male: return 'Let ${name} choose 3 wishes:\nWrite a little "contract" so they can\'t go overboard!'; } }, 
			'with_love' => 'With love',
			'write_calendar_time_to' => ({required Object title}) => 'Write schedule for: ${title}',
			'write_contract' => 'Write a Contract',
			'write_contract_to' => ({required Object title}) => 'Write a Contract for: ${title}',
			'write_text' => 'Write text',
			'write_text_to' => ({required Object title}) => 'Write text for: ${title}',
			'wrong_password' => 'Incorrect password. Please try again',
			'yes' => 'Yes',
			'you_answer_from' => ({required Object answers, required Object questions}) => 'You answered correctly ${answers} out of ${questions} questions',
			'you_win' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'You Win!'; case GenderContext.male: return 'You Win!'; } }, 
			'your_guess_optional' => ({required GenderContext context}) { switch (context) { case GenderContext.female: return 'Your guesses (optional)'; case GenderContext.male: return 'Your guesses (optional)'; } }, 
			_ => null,
		};
	}
}
