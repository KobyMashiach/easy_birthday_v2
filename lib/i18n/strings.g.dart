/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 612 (306 per locale)
///
/// Built on 2024-12-02 at 01:20 UTC

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
	String get choose_own_gender => 'Choose your gender';
	String get choose_partner_gender => 'Choose your partner\'s gender';
	String greeter({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return 'Welcome ${name}';
			case GenderContext.female:
				return 'Welcome ${name}';
		}
	}
	String get welcome => 'Welcome!';
	String get home_screen => 'Home Screen';
	String get settings => 'Settings';
	String get contact_us => 'Contact Us';
	String get pick_color => 'Pick Color';
	String get ok => 'OK';
	String get cancel => 'Cancel';
	String get recommand_drak_colors => 'Dark colors are recommended';
	String get build_app => 'Building the App';
	String get build_app_description => 'The app is currently being customized just for you!';
	String get change_color => 'Change Color';
	String get change_gender => 'Change Gender';
	String get change_plan => 'Change Plan';
	String get choose_gender => 'Choose Gender';
	String get male => 'Male';
	String get female => 'Female';
	String get app_info => 'App Info';
	String get app_name => 'App Name';
	String get app_version => 'App Version';
	String get event_id => 'Event ID';
	String get change_language => 'Change Language';
	String get choose_language => 'Choose Language';
	String get soon => 'Coming Soon';
	String selected({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Selected';
			case GenderContext.female:
				return 'Selected';
		}
	}
	String get back => 'Back';
	String get login_screen => 'Login Screen';
	String get login => 'Login';
	String get register_screen => 'Register Screen';
	String get register => 'Register';
	String get phone => 'Phone';
	String get password => 'Password';
	String get have_account => 'Already have an account?';
	String get no_account => 'Don\'t have an account?';
	String get click_here => 'Click Here';
	String get password_verification => 'Password Verification';
	String get got_it => 'Got it';
	String get short_password => 'Password too short';
	String get password_dont_match => 'Passwords do not match';
	String get phone_exist => 'Phone number already exists';
	String get phone_not_valid => 'Invalid phone number';
	String get short_password_description => 'Password must be at least 8 characters';
	String get password_dont_match_description => 'The two passwords you entered do not match, please try again';
	String get phone_exist_description => 'This phone number is already registered in our system. Please go to the login screen and try again';
	String get phone_not_valid_description => 'The phone number seems invalid. Please try again';
	String get email => 'Email';
	String get email_exist => 'Email already exists';
	String get email_not_valid => 'Invalid email';
	String get email_exist_description => 'This email is already registered in our system. Please go to the login screen and try again';
	String get email_not_valid_description => 'The email seems invalid. Please try again';
	String get wrong_password => 'Incorrect password. Please try again';
	String get user_not_found => 'This email was not found. Please try again';
	String get user_disabled => 'User is disabled';
	String get too_many_requests => 'Too many requests for this account';
	String get operation_not_allowed => 'Server error. Please try again later';
	String get default_error => 'Login or registration failed. Please try again';
	String get invalid_credential => 'Incorrect email or password. Please try again';
	String get forgot_password => 'Forgot Password';
	String get password_recovery => 'Password Recovery';
	String get send_mail => 'Send Mail';
	String get send_code => 'Send Code';
	String get mail__recover_sent_title => 'Password recovery email sent successfully';
	String get mail__recover_sent_description => 'Please click the link in the email.\nIf you don’t see the email, check the spam folder or try again';
	String get upload_dog_image => 'Upload a picture of the dog';
	String get add_notes => 'Add Notes';
	String get contact_phone => 'Contact Phone Number';
	String get full_name => 'Full Name';
	String get first_name => 'First Name';
	String get otp_code => 'Verification Code';
	String get otp_code_description => 'You received an SMS with a verification code.\nPlease enter it and click OK';
	String get send_again => 'Send Again';
	String get login_with_password => 'Login with Password';
	String get login_with_otp_code => 'Login with Verification Code';
	String get phone_not_exist_system => 'Phone number does not exist in the system';
	String get explanation_screen_title => 'Guide to Creating the Perfect Surprise';
	String get continue_ => 'Continue';
	String get first_register => 'Initial Registration';
	String get date_of_birth => 'Date of Birth';
	String get fill_your_details => 'Fill in your details';
	String get fill_partner_details => 'Fill in your partner\'s details';
	String get first_password => 'Set an initial password. Your partner can change the password.\nIf left blank, the password will be 123456';
	String get recommended_colors => 'Recommended Colors';
	String choose_color({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Choose a color from the palette';
			case GenderContext.female:
				return 'Choose a color from the palette';
		}
	}
	String skip({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Skip';
			case GenderContext.female:
				return 'Skip';
		}
	}
	String get continue_no_change => 'Continue without changing';
	String get selected_color => 'Selected Color';
	String get finish => 'Finish';
	String get relationship => 'Relationship';
	String married({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'My Husband';
			case GenderContext.female:
				return 'My Wife';
		}
	}
	String spouse({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'My Partner';
			case GenderContext.female:
				return 'My Partner';
		}
	}
	String get soul_mate => 'Soul Mate';
	String get got_full_app => 'You got a full app just for this!';
	String get title => 'Title';
	String celebrant({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Celebrant';
			case GenderContext.female:
				return 'Celebrant';
		}
	}
	String indicating({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Indicating';
			case GenderContext.female:
				return 'Indicating';
		}
	}
	String you({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'You';
			case GenderContext.female:
				return 'You';
		}
	}
	String my_deer({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'My Dear';
			case GenderContext.female:
				return 'My Dear';
		}
	}
	String get display_result => 'Show Results';
	String get we_use => 'We will use the selected texts to build a personalized app';
	String get description => 'Description';
	String get age => 'Age';
	String get it => 'It';
	String special_age({required Object age}) => '${age} is a special age';
	String get fill_all_fields => 'Please fill in all fields';
	String get more_few_seconds => 'In a few seconds, we’ll start building the perfect gift!';
	String get logout => 'Logout';
	String sure_logout({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Are you sure you want to log out?';
			case GenderContext.female:
				return 'Are you sure you want to log out?';
		}
	}
	String get current_plan => 'Current Plan';
	String get change_password => 'Change Password';
	String get new_password => 'New Password';
	String get new_password_verification => 'Verify New Password';
	String get phone_verification => 'Phone Verification';
	String greeting_first_login({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return '${name} has prepared the coolest surprise for you!\nAn app built especially for your birthday!\nHere you will find a heartfelt personal blessing,\nshared photos of your most beautiful moments,\nand more surprises to warm your heart,\nbecause you deserve all the best in the world!\nGet ready, this will be an unforgettable celebration! 🎉🎉🎉';
			case GenderContext.female:
				return '${name} has prepared the coolest surprise for you!\nAn app built especially for your birthday!\nHere you will find a heartfelt personal blessing,\nshared photos of your most beautiful moments,\nand more surprises to warm your heart,\nbecause you deserve all the best in the world!\nGet ready, this will be an unforgettable celebration! 🎉🎉🎉';
		}
	}
	String get lets_continue => 'Let\'s continue!';
	String add({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Add';
			case GenderContext.female:
				return 'Add';
		}
	}
	String remove({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Remove';
			case GenderContext.female:
				return 'Remove';
		}
	}
	String get text => 'Text';
	String get pictures => 'Pictures';
	String get videos => 'Videos';
	String get quiz_game => 'Quiz Game';
	String get birthday_calendar => 'Birthday Calendar';
	String get birthday_suprise => 'Birthday Surprise';
	String text_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Come on, write a heartfelt blessing or some funny text!';
			case GenderContext.female:
				return 'Come on, write a heartfelt blessing or some funny text!';
		}
	}
	String pictures_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Add some shared pictures that will melt your hearts';
			case GenderContext.female:
				return 'Add some shared pictures that will melt your hearts';
		}
	}
	String videos_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Add YouTube videos that remind you how cute you are together';
			case GenderContext.female:
				return 'Add YouTube videos that remind you how cute you are together';
		}
	}
	String quiz_game_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Build a trivia game to see if you know who\'s who!';
			case GenderContext.female:
				return 'Build a trivia game to see if you know who\'s who!';
		}
	}
	String choose_category({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Choose a category';
			case GenderContext.female:
				return 'Choose a category';
		}
	}
	String birthday_calendar_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Plan the coolest and most fun schedule for your partner\'s birthday! Create a perfect day filled with surprises and unforgettable activities.';
			case GenderContext.female:
				return 'Plan the coolest and most fun schedule for your partner\'s birthday! Create a perfect day filled with surprises and unforgettable activities.';
		}
	}
	String birthday_suprise_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Create a birthday surprise, but shhh... it stays locked until your partner opens it!';
			case GenderContext.female:
				return 'Create a birthday surprise, but shhh... it stays locked until your partner opens it!';
		}
	}
	String wishes_list_description({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return 'Let ${name} choose 3 wishes:\nWrite a little "contract" so they can\'t go overboard!';
			case GenderContext.female:
				return 'Let ${name} choose 3 wishes:\nWrite a little "contract" so they can\'t go overboard!';
		}
	}
	String wishes_list_display_description({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return 'Choose 3 wishes that ${name} must fulfill!';
			case GenderContext.female:
				return 'Choose 3 wishes that ${name} must fulfill!';
		}
	}
	String get please_choose_category => 'Please choose a category';
	String get title_appear_category => 'The title to appear for this category';
	String get title_appear_required => 'Please fill in the title';
	String get text_appear_required => 'Please fill in the text';
	String get write_text => 'Write text';
	String get add_text => 'Add text';
	String get add_picture => 'Add picture';
	String get add_pictures => 'Add pictures';
	String get add_videos => 'Add videos';
	String write_text_to({required Object title}) => 'Write text for: ${title}';
	String add_pictures_to({required Object title}) => 'Add pictures for: ${title}';
	String add_videos_to({required Object title}) => 'Add videos for: ${title}';
	String get add_text_pictures_title => 'Add Text and Pictures';
	String add_text_pictures_description({required Object title}) => 'Add text and pictures for: ${title}';
	String get add_suprise => 'Add a Surprise';
	String get lock => 'Locked';
	String get unlock => 'Unlocked';
	String get no_allow_text_empty => 'Text cannot be empty';
	String get edit => 'Edit';
	String get exit => 'Exit';
	String sure_delete_name({required GenderContext context, required Object text}) {
		switch (context) {
			case GenderContext.male:
				return 'Are you sure you want to delete ${text}?';
			case GenderContext.female:
				return 'Are you sure you want to delete ${text}?';
		}
	}
	String sure_delete({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Are you sure you want to delete this event?';
			case GenderContext.female:
				return 'Are you sure you want to delete this event?';
		}
	}
	String get delete => 'Delete';
	String get mark_all => 'Mark All';
	String get cancel_marking => 'Cancel Marking';
	String upload_files_count({required Object file, required Object files}) => 'Uploaded ${file} out of ${files} files';
	String get use_emojis => 'Use Emojis';
	String get lines_number => 'Number of Lines';
	String get max_words_in_line => 'Max Words per Line';
	String get add_free_text => 'Add Free Text';
	String get yes => 'Yes';
	String get no => 'No';
	String get no_required => 'Not Required';
	String generate_text_description({required Object relationship, required Object name, required Object myName, required Object lineNumber, required Object wordsInLineNumber, required Object age}) => 'Write a birthday blessing for ${relationship}, the name is ${name}\nMy name is: ${myName}\nNumber of lines in the blessing: ${lineNumber}\nNumber of words per line: ${wordsInLineNumber}\nThe age is ${age}';
	String get partner_info => 'Partner\'s Info';
	String get info => 'Info';
	String get gender => 'Gender';
	String get greeting_notes => '* Your names will be automatically added\n* Your partner\'s age will be automatically added\n* After receiving the blessing, you can edit it however you\'d like';
	String get greeting_before_edit => 'Blessing Before Edit';
	String get generate_greeting => 'Generate Greeting';
	String get generate_new_greeting => 'Generate New Greeting';
	String get edit_greeting => 'Edit Greeting';
	String get create_greeting_using_ai => 'Create Greeting Using AI';
	String suprise_screen_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Add text or pictures, play with their order, and create the perfect surprise!\nThe surprise will remain secret until you decide it\'s ready for your partner!';
			case GenderContext.female:
				return 'Add text or pictures, play with their order, and create the perfect surprise!\nThe surprise will remain secret until you decide it\'s ready for your partner!';
		}
	}
	String get the_image => 'The Image';
	String get the_text => 'The Text';
	String secret_dialog({required GenderContext context, required Object categoryName, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return '"${categoryName}" is locked until ${name} grants you permission to open it!';
			case GenderContext.female:
				return '"${categoryName}" is locked until ${name} grants you permission to open it!';
		}
	}
	String get wishes_list => 'Wishes List';
	String get write_contract => 'Write a Contract';
	String write_contract_to({required Object title}) => 'Write a Contract for: ${title}';
	String get display_wishes => 'Show Wishes';
	String get delete_wishes => 'Delete Wishes';
	String delete_wishes_description({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return 'If the wishes don’t align with the contract, you can delete them and ${name} can refill them';
			case GenderContext.female:
				return 'If the wishes don’t align with the contract, you can delete them and ${name} can refill them';
		}
	}
	String get first_wish => 'First Wish';
	String get second_wish => 'Second Wish';
	String get third_wish => 'Third Wish';
	String get save => 'Save';
	String get save_and_lock => 'Save and Lock';
	String get wish_list_lock_title => 'Wish List is Locked';
	String wish_list_lock_description({required Object name}) => 'To unlock it, please ask ${name} for a new chance';
	String please_read_contract({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return 'A contract written by ${name} especially for you';
			case GenderContext.female:
				return 'A contract written by ${name} especially for you';
		}
	}
	String get no_wish_yet => 'No wishes yet';
	String get calendar_time => 'Schedule';
	String write_calendar_time_to({required Object title}) => 'Write schedule for: ${title}';
	String add_quiz_to({required Object title}) => 'Add Quiz to: ${title}';
	String get month => 'Month';
	String get week => 'Week';
	String get two_weeks => 'Two Weeks';
	String get pick_start_date => 'Pick Start Date';
	String get pick_end_date => 'Pick End Date';
	String get pick_date_range => 'Pick Date Range';
	String event_in_date({required Object date}) => 'Events on ${date}';
	String add_event({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Add Event';
			case GenderContext.female:
				return 'Add Event';
		}
	}
	String add_event_date({required GenderContext context, required Object date}) {
		switch (context) {
			case GenderContext.male:
				return 'Add Event to ${date}';
			case GenderContext.female:
				return 'Add Event to ${date}';
		}
	}
	String get event_description => 'Event Description';
	String get select_time => 'Select Time';
	String selected_time({required Object time}) => 'Selected Time: ${time}';
	String add_question({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Add Question';
			case GenderContext.female:
				return 'Add Question';
		}
	}
	String remove_question({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Remove Question';
			case GenderContext.female:
				return 'Remove Question';
		}
	}
	String num_of_questions({required Object number}) => 'You currently have ${number} questions';
	String get show_questions => 'Show Questions';
	String get true_ => 'True';
	String get false_ => 'False';
	String get true_false_question => 'True or False Question';
	String get four_answers_question => 'Four Answers Question';
	String get question => 'Question';
	String get questions => 'Questions';
	String choose_currect_answer({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Choose the correct answer';
			case GenderContext.female:
				return 'Choose the correct answer';
		}
	}
	String get add_image => 'Add Image';
	String get first_question => 'First Question';
	String get second_question => 'Second Question';
	String get third_question => 'Third Question';
	String get fourth_question => 'Fourth Question';
	String get required_fill_question => 'You must fill in the question';
	String get required_fill_all_answer => 'You must fill in all the answers';
	String choose_question_delete({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Select the questions you want to delete';
			case GenderContext.female:
				return 'Select the questions you want to delete';
		}
	}
	String get mark_least_one_question => 'You must mark at least one question';
	String get no_questions_add => 'No questions added yet';
	String quiz_game_partner_description({required GenderContext context, required Object name, required Object number}) {
		switch (context) {
			case GenderContext.male:
				return 'Welcome to the trivia game!\n${name} has prepared ${number} intriguing questions for you.\n❤️ Reminder: You cannot change an answer once given, so answer carefully and have fun 😉\nGood luck!';
			case GenderContext.female:
				return 'Welcome to the trivia game!\n${name} has prepared ${number} intriguing questions for you.\n❤️ Reminder: You cannot change an answer once given, so answer carefully and have fun 😉\nGood luck!';
		}
	}
	String quiz_game_partner_no_questions({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return '${name} hasn\'t added any questions yet';
			case GenderContext.female:
				return '${name} hasn\'t added any questions yet';
		}
	}
	String click_here_start({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Click here to start';
			case GenderContext.female:
				return 'Click here to start';
		}
	}
	String get quiz_game_done => 'Trivia Game Completed';
	String you_answer_from({required Object answers, required Object questions}) => 'You answered correctly ${answers} out of ${questions} questions';
	String get choose_couple_profile_image => 'Choose your couple\'s profile image';
	String get memory_game => 'Memory Game';
	String get num_mistakes => 'Number of Mistakes';
	String get score => 'Score';
	String get game_over => 'Game Over';
	String you_win({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'You Win!';
			case GenderContext.female:
				return 'You Win!';
		}
	}
	String upload_six_images({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Upload 6 images for the memory game';
			case GenderContext.female:
				return 'Upload 6 images for the memory game';
		}
	}
	String get upload_images => 'Upload Images';
	String get confirm_images => 'Confirm Images?';
	String memory_game_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'Create a fun memory game with 6 shared pictures of you two!';
			case GenderContext.female:
				return 'Create a fun memory game with 6 shared pictures of you two!';
		}
	}
	String get memory_game_lock_title => 'Memory Game is Locked';
	String memory_game_lock_description({required Object name}) => 'To unlock it, please ask ${name} for a new chance';
	String memory_game_done({required GenderContext context, required Object name, required Object score}) {
		switch (context) {
			case GenderContext.male:
				return '${name} finished the game with a score of ${score}';
			case GenderContext.female:
				return '${name} finished the game with a score of ${score}';
		}
	}
	String get open_new_memory_game => 'Open a New Memory Game';
	String cant_upload_more_than({required GenderContext context, required Object number}) {
		switch (context) {
			case GenderContext.male:
				return 'You cannot upload more than ${number} files';
			case GenderContext.female:
				return 'You cannot upload more than ${number} files';
		}
	}
	String get locked_category => 'This category is locked.\nTo unlock it, upgrade your plan in the settings';
	String get edit_title => 'Edit Title';
	String get watch_login_success => 'Successfully logged in!\nYou can now switch to the clock';
	String get login_via_phone => 'Log in via Phone';
	String get wait_for_phone_login => 'Waiting for phone login';
	String get login_successful => 'Successfully logged in!';
	String get no_owner => 'The user is not an administrative user';
	String get login_failed => 'Login Failed';
	String get please_open_app_in_phone => 'Please open the app on your phone to log in';
	String get failed_send_login_request => 'Failed to send login request to phone. Please try again';
	String get no_category_added => 'No categories have been added for this event';
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
	@override String get choose_own_gender => 'בחירת המין שלך';
	@override String get choose_partner_gender => 'בחירת מין הבן/בת זוג';
	@override String greeter({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return 'ברוך הבא ${name}';
			case GenderContext.female:
				return 'ברוכה הבאה ${name}';
		}
	}
	@override String get welcome => 'ברוכ/ה הבאה!';
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
	@override String get change_gender => 'שינוי מין';
	@override String get change_plan => 'שינוי תוכנית';
	@override String get choose_gender => 'בחר מין';
	@override String get male => 'זכר';
	@override String get female => 'נקבה';
	@override String get app_info => 'מידע על האפליקציה';
	@override String get app_name => 'שם האפליקציה';
	@override String get app_version => 'גרסת האפליקציה';
	@override String get event_id => 'מספר אירוע';
	@override String get change_language => 'שינוי שפה';
	@override String get choose_language => 'בחר שפה';
	@override String get soon => 'בקרוב';
	@override String selected({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'נבחר';
			case GenderContext.female:
				return 'נבחרה';
		}
	}
	@override String get back => 'חזור';
	@override String get login_screen => 'מסך התחברות';
	@override String get login => 'התחברות';
	@override String get register_screen => 'מסך הרשמה';
	@override String get register => 'הרשמה';
	@override String get phone => 'טלפון';
	@override String get password => 'סיסמה';
	@override String get have_account => 'יש משתמש';
	@override String get no_account => 'אין משתמש';
	@override String get click_here => 'לחץ כאן';
	@override String get password_verification => 'אימות סיסמה';
	@override String get got_it => 'בסדר, הבנתי';
	@override String get short_password => 'סיסמה קצרה מידי';
	@override String get password_dont_match => 'הסיסמאות לא תואמות';
	@override String get phone_exist => 'טלפון קיים במערכת';
	@override String get phone_not_valid => 'מספר הטלפון לא חוקי';
	@override String get short_password_description => 'הסיסמה צריכה להיות 8 תווים לפחות';
	@override String get password_dont_match_description => '2 הסיסמאות שהזנת לא תואמות, נא נסה שוב';
	@override String get phone_exist_description => 'מספר הטלפון קיים במערכת שלנו, עבור למסך ההתחברות ונסה שנית';
	@override String get phone_not_valid_description => 'כנראה שטעית במספר הטלפון, נא נסה שנית';
	@override String get email => 'אימייל';
	@override String get email_exist => 'כתובת מייל קיימת במערכת';
	@override String get email_not_valid => 'כתובת המייל לא חוקית';
	@override String get email_exist_description => 'כתובת המייל קיימת במערכת שלנו, עבור למסך ההתחברות ונסה שנית';
	@override String get email_not_valid_description => 'כנראה שטעית בכתובת המייל, נא נסה שנית';
	@override String get wrong_password => 'הסיסמה לא נכונה, נא נסה שנית';
	@override String get user_not_found => 'לא נמצאה כתובת המייל הזו, נסה שוב';
	@override String get user_disabled => 'משתמש מושבת';
	@override String get too_many_requests => 'יותר מדי בקשות להתחבר לחשבון זה';
	@override String get operation_not_allowed => 'שגיאת שרת, אנא נסה שוב מאוחר יותר';
	@override String get default_error => 'ההתחברות או ההרשמה נכשלו. בבקשה נסה שוב';
	@override String get invalid_credential => 'כתובת המייל או הסיסמה לא נכונים, נא נסה שנית';
	@override String get forgot_password => 'שכחת סיסמה';
	@override String get password_recovery => 'שחזור סיסמה';
	@override String get send_mail => 'שלח מייל';
	@override String get send_code => 'שלח קוד';
	@override String get mail__recover_sent_title => 'מייל לשחזור סיסמה נשלח בהצלחה';
	@override String get mail__recover_sent_description => 'נא לחץ על הקישור במייל.\nאם אינך רואה את המייל נסה לחפש בתיקיית הספאם או נסה שנית';
	@override String get upload_dog_image => 'העלה תמונה של הכלב';
	@override String get add_notes => 'הוספת הערות';
	@override String get contact_phone => 'מספר טלפון ליצירת קשר';
	@override String get full_name => 'שם מלא';
	@override String get first_name => 'שם פרטי';
	@override String get otp_code => 'קוד אימות';
	@override String get otp_code_description => 'קיבלת הודעת SMS עם קוד אימות.\nנא לרשום אותו וללחוץ אישור';
	@override String get send_again => 'שלח שוב';
	@override String get login_with_password => 'התחבר עם סיסמה';
	@override String get login_with_otp_code => 'התחבר עם קוד אימות';
	@override String get phone_not_exist_system => 'מספר הטלפון לא קיים במערכת';
	@override String get explanation_screen_title => 'המדריך ליצירת הפתעה מושלמת';
	@override String get continue_ => 'המשך';
	@override String get first_register => 'הרשמה ראשונית';
	@override String get date_of_birth => 'תאריך לידה';
	@override String get fill_your_details => 'מלא/י את הפרטים שלך';
	@override String get fill_partner_details => 'מלא/י את הפרטים של הבן/בת זוג שלך';
	@override String get first_password => 'בחר סיסמה התחלתית, הבן/בת זוג יוכלו לשנות את הסיסמה\nאם השדה ישאר ריק הסיסמה תהיה 123456';
	@override String get recommended_colors => 'צבעים מומלצים';
	@override String choose_color({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'בחר צבע מקשת צבעים';
			case GenderContext.female:
				return 'בחרי צבע מקשת צבעים';
		}
	}
	@override String skip({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'דלג';
			case GenderContext.female:
				return 'דלגי';
		}
	}
	@override String get continue_no_change => 'המשך ללא שינוי';
	@override String get selected_color => 'צבע נבחר';
	@override String get finish => 'סיום';
	@override String get relationship => 'מערכת יחסים';
	@override String married({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'בעלי';
			case GenderContext.female:
				return 'אשתי';
		}
	}
	@override String spouse({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'בן זוגי';
			case GenderContext.female:
				return 'בת זוגתי';
		}
	}
	@override String get soul_mate => 'נפש תאומה';
	@override String get got_full_app => 'אז קיבלת אפליקציה שלמה רק בשביל זה';
	@override String get title => 'כותרת';
	@override String celebrant({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'חוגג';
			case GenderContext.female:
				return 'חוגגת';
		}
	}
	@override String indicating({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'מציין';
			case GenderContext.female:
				return 'מציינת';
		}
	}
	@override String you({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'את';
			case GenderContext.female:
				return 'אתה';
		}
	}
	@override String my_deer({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'היקר';
			case GenderContext.female:
				return 'היקרה';
		}
	}
	@override String get display_result => 'הראה תוצאות';
	@override String get we_use => 'אנחנו נשתמש בטקסטים שבחרתם כדי לבנות את האפליקציה באופן אישי';
	@override String get description => 'תיאור';
	@override String get age => 'גיל';
	@override String get it => 'זה';
	@override String special_age({required Object age}) => 'גיל ${age} זה גיל מיוחד';
	@override String get fill_all_fields => 'מלא את כל השדות בבקשה';
	@override String get more_few_seconds => 'בעוד כמה שניות נוכל להתחיל לבנות את המתנה המושלמת!';
	@override String get logout => 'התנתקות';
	@override String sure_logout({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'אתה בטוח שאתה רוצה להתנתק?';
			case GenderContext.female:
				return 'את בטוחה שאת רוצה להתנתק?';
		}
	}
	@override String get current_plan => 'תוכנית נוכחית';
	@override String get change_password => 'שנה סיסמה';
	@override String get new_password => 'סיסמה חדשה';
	@override String get new_password_verification => 'אימות סיסמה חדשה';
	@override String get phone_verification => 'אימות טלפון';
	@override String greeting_first_login({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return '${name} הכינה לך את ההפתעה הכי מגניבה שיש!\nאפליקציה שנבנתה במיוחד בשבילך, ליום ההולדת שלך!\nכאן תמצא ברכה אישית מהלב,\nתמונות משותפות שלכם מכל הרגעים הכי יפים,\nועוד הפתעות שרק יחממו לך את הלב,\nכי מגיע לך את כל הטוב שבעולם!\nאז תתכונן, זו הולכת להיות חגיגה בלתי נשכחת!🎉🎉🎉';
			case GenderContext.female:
				return '${name} הכין לך את ההפתעה הכי מגניבה שיש!\nאפליקציה שנבנתה במיוחד בשבילך, ליום ההולדת שלך!\nכאן תמצאי ברכה אישית מהלב,\nתמונות משותפות שלכם מכל הרגעים הכי יפים,\nועוד הפתעות שרק יחממו לך את הלב,\nכי מגיע לך את כל הטוב שבעולם!\nאז תתכונני, זו הולכת להיות חגיגה בלתי נשכחת!🎉🎉🎉';
		}
	}
	@override String get lets_continue => 'בואו נתקדם!';
	@override String add({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'הוסף';
			case GenderContext.female:
				return 'הוסיפי';
		}
	}
	@override String remove({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'הסר';
			case GenderContext.female:
				return 'הסירי';
		}
	}
	@override String get text => 'טקסט';
	@override String get pictures => 'תמונות';
	@override String get videos => 'סרטונים';
	@override String get quiz_game => 'משחק טריוויה';
	@override String get birthday_calendar => 'לו"ז יום הולדת';
	@override String get birthday_suprise => 'הפתעת יום הולדת';
	@override String text_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'יאללה, תשלוף ברכה מהלב או כתוב איזה טקסט קורע שתרצה!';
			case GenderContext.female:
				return 'יאללה, תשלפי ברכה מהלב או כתבי איזה טקסט קורע שתרצי!';
		}
	}
	@override String pictures_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'הוסף כמה תמונות משותפות שימסו לכם את הלב';
			case GenderContext.female:
				return 'הוסיפי כמה תמונות משותפות שימסו לכם את הלב';
		}
	}
	@override String videos_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'הוסף סרטוני יוטיוב שמזכירים לכם כמה אתם חמודים ביחד';
			case GenderContext.female:
				return 'הוסיפי סרטוני יוטיוב שמזכירים לכם כמה אתם חמודים ביחד';
		}
	}
	@override String quiz_game_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'יאללה, תבנה משחק טריוויה שיבדוק אם אתם יודעים בכלל מי זה מי!';
			case GenderContext.female:
				return 'יאללה, תבני משחק טריוויה שיבדוק אם אתם יודעים בכלל מי זה מי!';
		}
	}
	@override String choose_category({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'בחר קטגוריה';
			case GenderContext.female:
				return 'בחרי קטגוריה';
		}
	}
	@override String birthday_calendar_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'בוא לבנות את הלו"ז הכי מגניב וכיפי ליום ההולדת של בת הזוג שלך! תכנן לה יום מושלם מלא בהפתעות ופעילויות בלתי נשכחות.';
			case GenderContext.female:
				return 'בואי לבנות את הלו"ז הכי מגניב וכיפי ליום ההולדת של בן הזוג שלך! תכנני לו יום מושלם מלא בהפתעות ופעילויות בלתי נשכחות.';
		}
	}
	@override String birthday_suprise_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'בוא לבנות את הפתעת יום ההולדת, אבל ששששש... עד שתפתח את זה, זה יישאר נעול אצל בת הזוג שלך!';
			case GenderContext.female:
				return 'בואי לבנות את הפתעת יום ההולדת, אבל ששששש... עד שתיפתחי את זה, זה יישאר נעול אצל בן הזוג שלך!';
		}
	}
	@override String wishes_list_description({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return 'הוסף אפשרות ל${name} לבחור 3 משאלות:\nרשום לה "חוזה" קטן, ככה שהיא לא תוכל להגזים!';
			case GenderContext.female:
				return 'הוספי אפשרות ל${name} לבחור 3 משאלות:\nרשמי לו "חוזה" קטן, ככה שהוא לא יוכל להגזים!';
		}
	}
	@override String wishes_list_display_description({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return 'בחר 3 משאלות ש${name} חייבת להגשים!';
			case GenderContext.female:
				return 'בחרי 3 משאלות ש${name} חייב להגשים!';
		}
	}
	@override String get please_choose_category => 'בחר קטגוריה בבקשה';
	@override String get title_appear_category => 'הכותרת שתופיע לקטגוריה זו';
	@override String get title_appear_required => 'נא למלא את הכותרת';
	@override String get text_appear_required => 'נא למלא את הטקסט';
	@override String get write_text => 'רשום טקסט';
	@override String get add_text => 'הוסף טקסט';
	@override String get add_picture => 'הוסף תמונה';
	@override String get add_pictures => 'הוסף תמונות';
	@override String get add_videos => 'הוסף סרטונים';
	@override String write_text_to({required Object title}) => 'רשום טקסט ל: ${title}';
	@override String add_pictures_to({required Object title}) => 'הוסף תמונות ל: ${title}';
	@override String add_videos_to({required Object title}) => 'הוסף סרטונים ל: ${title}';
	@override String get add_text_pictures_title => 'הוסף טקסט ותמונות';
	@override String add_text_pictures_description({required Object title}) => 'הוסף טקסט ותמונות ל: ${title}';
	@override String get add_suprise => 'הוספת הפתעה';
	@override String get lock => 'נעול';
	@override String get unlock => 'לא נעול';
	@override String get no_allow_text_empty => 'לא ניתן להשאיר טקסט ריק';
	@override String get edit => 'עריכה';
	@override String get exit => 'יציאה';
	@override String sure_delete_name({required GenderContext context, required Object text}) {
		switch (context) {
			case GenderContext.male:
				return 'אתה בטוח שאתה רוצה למחוק את ${text}?';
			case GenderContext.female:
				return 'את בטוחה שאת רוצה למחוק את ${text}?';
		}
	}
	@override String sure_delete({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'אתה בטוח שאתה רוצה למחוק את האירוע הזה?';
			case GenderContext.female:
				return 'את בטוחה שאת רוצה למחוק את האירוע הזה?';
		}
	}
	@override String get delete => 'מחיקה';
	@override String get mark_all => 'סמן הכל';
	@override String get cancel_marking => 'בטל סימון';
	@override String upload_files_count({required Object file, required Object files}) => 'הועלו ${file} מתוך ${files} קבצים';
	@override String get use_emojis => 'שימוש באימוג׳ים';
	@override String get lines_number => 'מספר שורות';
	@override String get max_words_in_line => 'מקסימום מילים בשורה';
	@override String get add_free_text => 'הוספת טקסט חופשי';
	@override String get yes => 'כן';
	@override String get no => 'לא';
	@override String get no_required => 'לא חובה';
	@override String generate_text_description({required Object relationship, required Object name, required Object myName, required Object lineNumber, required Object wordsInLineNumber, required Object age}) => 'רשום ברכת יום הולדת ל${relationship}, השם הוא ${name}\nהשם שלי הוא: ${myName}\nמספר השורות של הברכה: ${lineNumber}\nמספר המילים בשורה:${wordsInLineNumber}\nהגיל  הוא ${age}';
	@override String get partner_info => 'מידע על הבן/בת זוג';
	@override String get info => 'מידע';
	@override String get gender => 'מין';
	@override String get greeting_notes => '* השמות שלכם ירשמו באופן אוטומטי\n* הגיל של הבן/בת זוג ירשם באופן אוטומטי\n* לאחר קבלת הברכה תוכלו לערוך אותה כמו שרק תרצו';
	@override String get greeting_before_edit => 'ברכה לפני עריכה';
	@override String get generate_greeting => 'ליצור ברכה';
	@override String get generate_new_greeting => 'ליצור ברכה חדשה';
	@override String get edit_greeting => 'עריכת הברכה';
	@override String get create_greeting_using_ai => 'צור ברכה באמצעות AI';
	@override String suprise_screen_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'הוסף טקסט או תמונות, שחק עם הסדר ביניהם ותיצור את ההפתעה המושלמת!\nההפתעה תישאר סודית עד שתחליט שהיא מוכנה לבת הזוג שלך!';
			case GenderContext.female:
				return 'הוסיפי טקסט או תמונות, שחקי עם הסדר ביניהם וצרי את ההפתעה המושלמת!\nההפתעה תישאר סודית עד שתחליטי שהיא מוכנה לבן הזוג שלך!';
		}
	}
	@override String get the_image => 'התמונה';
	@override String get the_text => 'הטקסט';
	@override String secret_dialog({required GenderContext context, required Object categoryName, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return '"${categoryName}" נעול עד ש${name} תיתן לך את ההרשאה לפתוח אותה!';
			case GenderContext.female:
				return '"${categoryName}" נעול עד ש${name} יתן לך את ההרשאה לפתוח אותה!';
		}
	}
	@override String get wishes_list => 'רשימת משאלות';
	@override String get write_contract => 'רשום חוזה';
	@override String write_contract_to({required Object title}) => 'רשום חוזה ל: ${title}';
	@override String get display_wishes => 'הצג משאלות';
	@override String get delete_wishes => 'מחיקת המשאלות';
	@override String delete_wishes_description({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return 'אם המשאלות לא עומדות בחוזה ניתן למחוק ואז ${name} תוכל למלא מחדש';
			case GenderContext.female:
				return 'אם המשאלות לא עומדות בחוזה ניתן למחוק ואז ${name} יוכל למלא מחדש';
		}
	}
	@override String get first_wish => 'משאלה ראשוונה';
	@override String get second_wish => 'משאלה שנייה';
	@override String get third_wish => 'משאלה שלישית';
	@override String get save => 'שמור';
	@override String get save_and_lock => 'שמור ונעל';
	@override String get wish_list_lock_title => 'רשימת המשאלות נעולה';
	@override String wish_list_lock_description({required Object name}) => 'כדי לפתוח אותה אנא בקשו מ${name} הזדמנות חדשה';
	@override String please_read_contract({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return 'חוזה ש${name} כתבה במיוחד בשבילך';
			case GenderContext.female:
				return 'חוזה ש${name} כתב במיוחד בשבילך';
		}
	}
	@override String get no_wish_yet => 'אין עדיין משאלות';
	@override String get calendar_time => 'לו"ז';
	@override String write_calendar_time_to({required Object title}) => 'רשום לו"ז ל: ${title}';
	@override String add_quiz_to({required Object title}) => 'הוסף משחק טריוויה ל: ${title}';
	@override String get month => 'חודש';
	@override String get week => 'שבוע';
	@override String get two_weeks => 'שבועיים';
	@override String get pick_start_date => 'בחר תאריך התחלה';
	@override String get pick_end_date => 'בחר תאריך סיום';
	@override String get pick_date_range => 'בחר טווח תאריכים';
	@override String event_in_date({required Object date}) => 'אירועים בתאריך ${date}';
	@override String add_event({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'הוסף אירוע';
			case GenderContext.female:
				return 'הוסיפי אירוע';
		}
	}
	@override String add_event_date({required GenderContext context, required Object date}) {
		switch (context) {
			case GenderContext.male:
				return 'הוסף אירוע לתאריך ${date}';
			case GenderContext.female:
				return 'הוסיפי אירוע לתאריך ${date}';
		}
	}
	@override String get event_description => 'תיאור אירוע';
	@override String get select_time => 'בחירת שעה';
	@override String selected_time({required Object time}) => 'שעה שנבחרה: ${time}';
	@override String add_question({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'הוסף שאלה';
			case GenderContext.female:
				return 'הוסיפי שאלה';
		}
	}
	@override String remove_question({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'הסר שאלה';
			case GenderContext.female:
				return 'הסירי שאלה';
		}
	}
	@override String num_of_questions({required Object number}) => 'יש לך כרגע ${number} שאלות';
	@override String get show_questions => 'הצגת השאלות';
	@override String get true_ => 'נכון';
	@override String get false_ => 'לא נכון';
	@override String get true_false_question => 'שאלת נכון או לא נכון';
	@override String get four_answers_question => 'שאלת 4 תשובות';
	@override String get question => 'שאלה';
	@override String get questions => 'שאלות';
	@override String choose_currect_answer({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'בחר את התשובה הנכונה';
			case GenderContext.female:
				return 'בחרי את התשובה הנכונה';
		}
	}
	@override String get add_image => 'הוספת תמונה';
	@override String get first_question => 'שאלה ראשונה';
	@override String get second_question => 'שאלה שנייה';
	@override String get third_question => 'שאלה שלישית';
	@override String get fourth_question => 'שאלה רביעית';
	@override String get required_fill_question => 'חובה למלא את השאלה';
	@override String get required_fill_all_answer => 'חובה למלא את כל התשובות';
	@override String choose_question_delete({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'בחר את השאלות שתרצה למחוק';
			case GenderContext.female:
				return 'בחרי את השאלות שתרצי למחוק';
		}
	}
	@override String get mark_least_one_question => 'יש לסמן לפחות שאלה אחת';
	@override String get no_questions_add => 'לא הועלו שאלות עדיין';
	@override String quiz_game_partner_description({required GenderContext context, required Object name, required Object number}) {
		switch (context) {
			case GenderContext.male:
				return 'ברוך הבא למשחק הטריוויה!\n${name} הכינה לך ${number} שאלות מסקרנות.\nשים ❤️ – אי אפשר לתקן תשובה שנתת, אז ענה בכיף אבל בזהירות 😉\nבהצלחה!';
			case GenderContext.female:
				return 'ברוכה הבאה למשחק הטריוויה!\n${name} הכין לך ${number} שאלות מסקרנות.\nשימי ❤️ – אי אפשר לתקן תשובה שנתת, אז תעני בכיף אבל בזהירות 😉\nבהצלחה!';
		}
	}
	@override String quiz_game_partner_no_questions({required GenderContext context, required Object name}) {
		switch (context) {
			case GenderContext.male:
				return '${name} לא העלתה עדיין שאלות';
			case GenderContext.female:
				return '${name} לא העלה עדיין שאלות';
		}
	}
	@override String click_here_start({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'לחץ כאן להתחלה';
			case GenderContext.female:
				return 'לחצי כאן להתחלה';
		}
	}
	@override String get quiz_game_done => 'משחק הטריוויה נגמר';
	@override String you_answer_from({required Object answers, required Object questions}) => 'ענית נכון על ${answers} מתוך ${questions} שאלות';
	@override String get choose_couple_profile_image => 'בחר/י תמונת פרופיל זוגית שלכם';
	@override String get memory_game => 'משחק הזיכרון';
	@override String get num_mistakes => 'מספר טעויות';
	@override String get score => 'תוצאה';
	@override String get game_over => 'המשחק נגמר';
	@override String you_win({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'אתה ניצחת!';
			case GenderContext.female:
				return 'את ניצחת!';
		}
	}
	@override String upload_six_images({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'העלה 6 תמונות שישמשו למשחק הזיכרון';
			case GenderContext.female:
				return 'העלי 6 תמונות שישמשו למשחק הזיכרון';
		}
	}
	@override String get upload_images => 'העלאת תמונות';
	@override String get confirm_images => 'לאשר את התמונות?';
	@override String memory_game_description({required GenderContext context}) {
		switch (context) {
			case GenderContext.male:
				return 'בנה משחק זיכרון מגניב עם 6 תמונות משותפות שלכם!';
			case GenderContext.female:
				return 'בני משחק זיכרון מגניב עם 6 תמונות משותפות שלכם!';
		}
	}
	@override String get memory_game_lock_title => 'משחק הזיכרון נעול';
	@override String memory_game_lock_description({required Object name}) => 'כדי לפתוח אותו אנא בקשו מ${name} הזדמנות חדשה';
	@override String memory_game_done({required GenderContext context, required Object name, required Object score}) {
		switch (context) {
			case GenderContext.male:
				return '${name} סיימה את המשחק עם ניקוד: ${score}';
			case GenderContext.female:
				return '${name} סיים את המשחק עם ניקוד: ${score}';
		}
	}
	@override String get open_new_memory_game => 'פתיחת גישה למשחק חדש';
	@override String cant_upload_more_than({required GenderContext context, required Object number}) {
		switch (context) {
			case GenderContext.male:
				return 'אתה לא יכול להעלות יותר מ-${number} קבצים';
			case GenderContext.female:
				return 'את לא יכולה להעלות יותר מ-${number} קבצים';
		}
	}
	@override String get locked_category => 'קטגוריה זו נעולה.\nכדי לפתוח אותה יש לשדרג את התוכנית שלך בהגדרות';
	@override String get edit_title => 'ערוך כותרת';
	@override String get watch_login_success => 'התחברת בהצלחה!\nאפשר לעבור לשעון';
	@override String get login_via_phone => 'התחבר באמצעות הטלפון';
	@override String get wait_for_phone_login => 'מחכה להתחברות דרך הטלפון';
	@override String get login_successful => 'התחברת בהצלחה!';
	@override String get no_owner => 'המשתמש לא משתמש ניהולי';
	@override String get login_failed => 'ההתחברות נכשלה';
	@override String get please_open_app_in_phone => 'פתח את האפליקציה בטלפון כדי להתחבר';
	@override String get failed_send_login_request => 'נכשל בשליחת בקשה לטלפון, נא נסה שנית';
	@override String get no_category_added => 'לא הוספת קטגרויות לאירוע זה';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'hello': return 'Hello';
			case 'choose_own_gender': return 'Choose your gender';
			case 'choose_partner_gender': return 'Choose your partner\'s gender';
			case 'greeter': return ({required GenderContext context, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return 'Welcome ${name}';
					case GenderContext.female:
						return 'Welcome ${name}';
				}
			};
			case 'welcome': return 'Welcome!';
			case 'home_screen': return 'Home Screen';
			case 'settings': return 'Settings';
			case 'contact_us': return 'Contact Us';
			case 'pick_color': return 'Pick Color';
			case 'ok': return 'OK';
			case 'cancel': return 'Cancel';
			case 'recommand_drak_colors': return 'Dark colors are recommended';
			case 'build_app': return 'Building the App';
			case 'build_app_description': return 'The app is currently being customized just for you!';
			case 'change_color': return 'Change Color';
			case 'change_gender': return 'Change Gender';
			case 'change_plan': return 'Change Plan';
			case 'choose_gender': return 'Choose Gender';
			case 'male': return 'Male';
			case 'female': return 'Female';
			case 'app_info': return 'App Info';
			case 'app_name': return 'App Name';
			case 'app_version': return 'App Version';
			case 'event_id': return 'Event ID';
			case 'change_language': return 'Change Language';
			case 'choose_language': return 'Choose Language';
			case 'soon': return 'Coming Soon';
			case 'selected': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Selected';
					case GenderContext.female:
						return 'Selected';
				}
			};
			case 'back': return 'Back';
			case 'login_screen': return 'Login Screen';
			case 'login': return 'Login';
			case 'register_screen': return 'Register Screen';
			case 'register': return 'Register';
			case 'phone': return 'Phone';
			case 'password': return 'Password';
			case 'have_account': return 'Already have an account?';
			case 'no_account': return 'Don\'t have an account?';
			case 'click_here': return 'Click Here';
			case 'password_verification': return 'Password Verification';
			case 'got_it': return 'Got it';
			case 'short_password': return 'Password too short';
			case 'password_dont_match': return 'Passwords do not match';
			case 'phone_exist': return 'Phone number already exists';
			case 'phone_not_valid': return 'Invalid phone number';
			case 'short_password_description': return 'Password must be at least 8 characters';
			case 'password_dont_match_description': return 'The two passwords you entered do not match, please try again';
			case 'phone_exist_description': return 'This phone number is already registered in our system. Please go to the login screen and try again';
			case 'phone_not_valid_description': return 'The phone number seems invalid. Please try again';
			case 'email': return 'Email';
			case 'email_exist': return 'Email already exists';
			case 'email_not_valid': return 'Invalid email';
			case 'email_exist_description': return 'This email is already registered in our system. Please go to the login screen and try again';
			case 'email_not_valid_description': return 'The email seems invalid. Please try again';
			case 'wrong_password': return 'Incorrect password. Please try again';
			case 'user_not_found': return 'This email was not found. Please try again';
			case 'user_disabled': return 'User is disabled';
			case 'too_many_requests': return 'Too many requests for this account';
			case 'operation_not_allowed': return 'Server error. Please try again later';
			case 'default_error': return 'Login or registration failed. Please try again';
			case 'invalid_credential': return 'Incorrect email or password. Please try again';
			case 'forgot_password': return 'Forgot Password';
			case 'password_recovery': return 'Password Recovery';
			case 'send_mail': return 'Send Mail';
			case 'send_code': return 'Send Code';
			case 'mail__recover_sent_title': return 'Password recovery email sent successfully';
			case 'mail__recover_sent_description': return 'Please click the link in the email.\nIf you don’t see the email, check the spam folder or try again';
			case 'upload_dog_image': return 'Upload a picture of the dog';
			case 'add_notes': return 'Add Notes';
			case 'contact_phone': return 'Contact Phone Number';
			case 'full_name': return 'Full Name';
			case 'first_name': return 'First Name';
			case 'otp_code': return 'Verification Code';
			case 'otp_code_description': return 'You received an SMS with a verification code.\nPlease enter it and click OK';
			case 'send_again': return 'Send Again';
			case 'login_with_password': return 'Login with Password';
			case 'login_with_otp_code': return 'Login with Verification Code';
			case 'phone_not_exist_system': return 'Phone number does not exist in the system';
			case 'explanation_screen_title': return 'Guide to Creating the Perfect Surprise';
			case 'continue_': return 'Continue';
			case 'first_register': return 'Initial Registration';
			case 'date_of_birth': return 'Date of Birth';
			case 'fill_your_details': return 'Fill in your details';
			case 'fill_partner_details': return 'Fill in your partner\'s details';
			case 'first_password': return 'Set an initial password. Your partner can change the password.\nIf left blank, the password will be 123456';
			case 'recommended_colors': return 'Recommended Colors';
			case 'choose_color': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Choose a color from the palette';
					case GenderContext.female:
						return 'Choose a color from the palette';
				}
			};
			case 'skip': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Skip';
					case GenderContext.female:
						return 'Skip';
				}
			};
			case 'continue_no_change': return 'Continue without changing';
			case 'selected_color': return 'Selected Color';
			case 'finish': return 'Finish';
			case 'relationship': return 'Relationship';
			case 'married': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'My Husband';
					case GenderContext.female:
						return 'My Wife';
				}
			};
			case 'spouse': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'My Partner';
					case GenderContext.female:
						return 'My Partner';
				}
			};
			case 'soul_mate': return 'Soul Mate';
			case 'got_full_app': return 'You got a full app just for this!';
			case 'title': return 'Title';
			case 'celebrant': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Celebrant';
					case GenderContext.female:
						return 'Celebrant';
				}
			};
			case 'indicating': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Indicating';
					case GenderContext.female:
						return 'Indicating';
				}
			};
			case 'you': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'You';
					case GenderContext.female:
						return 'You';
				}
			};
			case 'my_deer': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'My Dear';
					case GenderContext.female:
						return 'My Dear';
				}
			};
			case 'display_result': return 'Show Results';
			case 'we_use': return 'We will use the selected texts to build a personalized app';
			case 'description': return 'Description';
			case 'age': return 'Age';
			case 'it': return 'It';
			case 'special_age': return ({required Object age}) => '${age} is a special age';
			case 'fill_all_fields': return 'Please fill in all fields';
			case 'more_few_seconds': return 'In a few seconds, we’ll start building the perfect gift!';
			case 'logout': return 'Logout';
			case 'sure_logout': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Are you sure you want to log out?';
					case GenderContext.female:
						return 'Are you sure you want to log out?';
				}
			};
			case 'current_plan': return 'Current Plan';
			case 'change_password': return 'Change Password';
			case 'new_password': return 'New Password';
			case 'new_password_verification': return 'Verify New Password';
			case 'phone_verification': return 'Phone Verification';
			case 'greeting_first_login': return ({required GenderContext context, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return '${name} has prepared the coolest surprise for you!\nAn app built especially for your birthday!\nHere you will find a heartfelt personal blessing,\nshared photos of your most beautiful moments,\nand more surprises to warm your heart,\nbecause you deserve all the best in the world!\nGet ready, this will be an unforgettable celebration! 🎉🎉🎉';
					case GenderContext.female:
						return '${name} has prepared the coolest surprise for you!\nAn app built especially for your birthday!\nHere you will find a heartfelt personal blessing,\nshared photos of your most beautiful moments,\nand more surprises to warm your heart,\nbecause you deserve all the best in the world!\nGet ready, this will be an unforgettable celebration! 🎉🎉🎉';
				}
			};
			case 'lets_continue': return 'Let\'s continue!';
			case 'add': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Add';
					case GenderContext.female:
						return 'Add';
				}
			};
			case 'remove': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Remove';
					case GenderContext.female:
						return 'Remove';
				}
			};
			case 'text': return 'Text';
			case 'pictures': return 'Pictures';
			case 'videos': return 'Videos';
			case 'quiz_game': return 'Quiz Game';
			case 'birthday_calendar': return 'Birthday Calendar';
			case 'birthday_suprise': return 'Birthday Surprise';
			case 'text_description': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Come on, write a heartfelt blessing or some funny text!';
					case GenderContext.female:
						return 'Come on, write a heartfelt blessing or some funny text!';
				}
			};
			case 'pictures_description': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Add some shared pictures that will melt your hearts';
					case GenderContext.female:
						return 'Add some shared pictures that will melt your hearts';
				}
			};
			case 'videos_description': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Add YouTube videos that remind you how cute you are together';
					case GenderContext.female:
						return 'Add YouTube videos that remind you how cute you are together';
				}
			};
			case 'quiz_game_description': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Build a trivia game to see if you know who\'s who!';
					case GenderContext.female:
						return 'Build a trivia game to see if you know who\'s who!';
				}
			};
			case 'choose_category': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Choose a category';
					case GenderContext.female:
						return 'Choose a category';
				}
			};
			case 'birthday_calendar_description': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Plan the coolest and most fun schedule for your partner\'s birthday! Create a perfect day filled with surprises and unforgettable activities.';
					case GenderContext.female:
						return 'Plan the coolest and most fun schedule for your partner\'s birthday! Create a perfect day filled with surprises and unforgettable activities.';
				}
			};
			case 'birthday_suprise_description': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Create a birthday surprise, but shhh... it stays locked until your partner opens it!';
					case GenderContext.female:
						return 'Create a birthday surprise, but shhh... it stays locked until your partner opens it!';
				}
			};
			case 'wishes_list_description': return ({required GenderContext context, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return 'Let ${name} choose 3 wishes:\nWrite a little "contract" so they can\'t go overboard!';
					case GenderContext.female:
						return 'Let ${name} choose 3 wishes:\nWrite a little "contract" so they can\'t go overboard!';
				}
			};
			case 'wishes_list_display_description': return ({required GenderContext context, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return 'Choose 3 wishes that ${name} must fulfill!';
					case GenderContext.female:
						return 'Choose 3 wishes that ${name} must fulfill!';
				}
			};
			case 'please_choose_category': return 'Please choose a category';
			case 'title_appear_category': return 'The title to appear for this category';
			case 'title_appear_required': return 'Please fill in the title';
			case 'text_appear_required': return 'Please fill in the text';
			case 'write_text': return 'Write text';
			case 'add_text': return 'Add text';
			case 'add_picture': return 'Add picture';
			case 'add_pictures': return 'Add pictures';
			case 'add_videos': return 'Add videos';
			case 'write_text_to': return ({required Object title}) => 'Write text for: ${title}';
			case 'add_pictures_to': return ({required Object title}) => 'Add pictures for: ${title}';
			case 'add_videos_to': return ({required Object title}) => 'Add videos for: ${title}';
			case 'add_text_pictures_title': return 'Add Text and Pictures';
			case 'add_text_pictures_description': return ({required Object title}) => 'Add text and pictures for: ${title}';
			case 'add_suprise': return 'Add a Surprise';
			case 'lock': return 'Locked';
			case 'unlock': return 'Unlocked';
			case 'no_allow_text_empty': return 'Text cannot be empty';
			case 'edit': return 'Edit';
			case 'exit': return 'Exit';
			case 'sure_delete_name': return ({required GenderContext context, required Object text}) {
				switch (context) {
					case GenderContext.male:
						return 'Are you sure you want to delete ${text}?';
					case GenderContext.female:
						return 'Are you sure you want to delete ${text}?';
				}
			};
			case 'sure_delete': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Are you sure you want to delete this event?';
					case GenderContext.female:
						return 'Are you sure you want to delete this event?';
				}
			};
			case 'delete': return 'Delete';
			case 'mark_all': return 'Mark All';
			case 'cancel_marking': return 'Cancel Marking';
			case 'upload_files_count': return ({required Object file, required Object files}) => 'Uploaded ${file} out of ${files} files';
			case 'use_emojis': return 'Use Emojis';
			case 'lines_number': return 'Number of Lines';
			case 'max_words_in_line': return 'Max Words per Line';
			case 'add_free_text': return 'Add Free Text';
			case 'yes': return 'Yes';
			case 'no': return 'No';
			case 'no_required': return 'Not Required';
			case 'generate_text_description': return ({required Object relationship, required Object name, required Object myName, required Object lineNumber, required Object wordsInLineNumber, required Object age}) => 'Write a birthday blessing for ${relationship}, the name is ${name}\nMy name is: ${myName}\nNumber of lines in the blessing: ${lineNumber}\nNumber of words per line: ${wordsInLineNumber}\nThe age is ${age}';
			case 'partner_info': return 'Partner\'s Info';
			case 'info': return 'Info';
			case 'gender': return 'Gender';
			case 'greeting_notes': return '* Your names will be automatically added\n* Your partner\'s age will be automatically added\n* After receiving the blessing, you can edit it however you\'d like';
			case 'greeting_before_edit': return 'Blessing Before Edit';
			case 'generate_greeting': return 'Generate Greeting';
			case 'generate_new_greeting': return 'Generate New Greeting';
			case 'edit_greeting': return 'Edit Greeting';
			case 'create_greeting_using_ai': return 'Create Greeting Using AI';
			case 'suprise_screen_description': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Add text or pictures, play with their order, and create the perfect surprise!\nThe surprise will remain secret until you decide it\'s ready for your partner!';
					case GenderContext.female:
						return 'Add text or pictures, play with their order, and create the perfect surprise!\nThe surprise will remain secret until you decide it\'s ready for your partner!';
				}
			};
			case 'the_image': return 'The Image';
			case 'the_text': return 'The Text';
			case 'secret_dialog': return ({required GenderContext context, required Object categoryName, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return '"${categoryName}" is locked until ${name} grants you permission to open it!';
					case GenderContext.female:
						return '"${categoryName}" is locked until ${name} grants you permission to open it!';
				}
			};
			case 'wishes_list': return 'Wishes List';
			case 'write_contract': return 'Write a Contract';
			case 'write_contract_to': return ({required Object title}) => 'Write a Contract for: ${title}';
			case 'display_wishes': return 'Show Wishes';
			case 'delete_wishes': return 'Delete Wishes';
			case 'delete_wishes_description': return ({required GenderContext context, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return 'If the wishes don’t align with the contract, you can delete them and ${name} can refill them';
					case GenderContext.female:
						return 'If the wishes don’t align with the contract, you can delete them and ${name} can refill them';
				}
			};
			case 'first_wish': return 'First Wish';
			case 'second_wish': return 'Second Wish';
			case 'third_wish': return 'Third Wish';
			case 'save': return 'Save';
			case 'save_and_lock': return 'Save and Lock';
			case 'wish_list_lock_title': return 'Wish List is Locked';
			case 'wish_list_lock_description': return ({required Object name}) => 'To unlock it, please ask ${name} for a new chance';
			case 'please_read_contract': return ({required GenderContext context, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return 'A contract written by ${name} especially for you';
					case GenderContext.female:
						return 'A contract written by ${name} especially for you';
				}
			};
			case 'no_wish_yet': return 'No wishes yet';
			case 'calendar_time': return 'Schedule';
			case 'write_calendar_time_to': return ({required Object title}) => 'Write schedule for: ${title}';
			case 'add_quiz_to': return ({required Object title}) => 'Add Quiz to: ${title}';
			case 'month': return 'Month';
			case 'week': return 'Week';
			case 'two_weeks': return 'Two Weeks';
			case 'pick_start_date': return 'Pick Start Date';
			case 'pick_end_date': return 'Pick End Date';
			case 'pick_date_range': return 'Pick Date Range';
			case 'event_in_date': return ({required Object date}) => 'Events on ${date}';
			case 'add_event': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Add Event';
					case GenderContext.female:
						return 'Add Event';
				}
			};
			case 'add_event_date': return ({required GenderContext context, required Object date}) {
				switch (context) {
					case GenderContext.male:
						return 'Add Event to ${date}';
					case GenderContext.female:
						return 'Add Event to ${date}';
				}
			};
			case 'event_description': return 'Event Description';
			case 'select_time': return 'Select Time';
			case 'selected_time': return ({required Object time}) => 'Selected Time: ${time}';
			case 'add_question': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Add Question';
					case GenderContext.female:
						return 'Add Question';
				}
			};
			case 'remove_question': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Remove Question';
					case GenderContext.female:
						return 'Remove Question';
				}
			};
			case 'num_of_questions': return ({required Object number}) => 'You currently have ${number} questions';
			case 'show_questions': return 'Show Questions';
			case 'true_': return 'True';
			case 'false_': return 'False';
			case 'true_false_question': return 'True or False Question';
			case 'four_answers_question': return 'Four Answers Question';
			case 'question': return 'Question';
			case 'questions': return 'Questions';
			case 'choose_currect_answer': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Choose the correct answer';
					case GenderContext.female:
						return 'Choose the correct answer';
				}
			};
			case 'add_image': return 'Add Image';
			case 'first_question': return 'First Question';
			case 'second_question': return 'Second Question';
			case 'third_question': return 'Third Question';
			case 'fourth_question': return 'Fourth Question';
			case 'required_fill_question': return 'You must fill in the question';
			case 'required_fill_all_answer': return 'You must fill in all the answers';
			case 'choose_question_delete': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Select the questions you want to delete';
					case GenderContext.female:
						return 'Select the questions you want to delete';
				}
			};
			case 'mark_least_one_question': return 'You must mark at least one question';
			case 'no_questions_add': return 'No questions added yet';
			case 'quiz_game_partner_description': return ({required GenderContext context, required Object name, required Object number}) {
				switch (context) {
					case GenderContext.male:
						return 'Welcome to the trivia game!\n${name} has prepared ${number} intriguing questions for you.\n❤️ Reminder: You cannot change an answer once given, so answer carefully and have fun 😉\nGood luck!';
					case GenderContext.female:
						return 'Welcome to the trivia game!\n${name} has prepared ${number} intriguing questions for you.\n❤️ Reminder: You cannot change an answer once given, so answer carefully and have fun 😉\nGood luck!';
				}
			};
			case 'quiz_game_partner_no_questions': return ({required GenderContext context, required Object name}) {
				switch (context) {
					case GenderContext.male:
						return '${name} hasn\'t added any questions yet';
					case GenderContext.female:
						return '${name} hasn\'t added any questions yet';
				}
			};
			case 'click_here_start': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Click here to start';
					case GenderContext.female:
						return 'Click here to start';
				}
			};
			case 'quiz_game_done': return 'Trivia Game Completed';
			case 'you_answer_from': return ({required Object answers, required Object questions}) => 'You answered correctly ${answers} out of ${questions} questions';
			case 'choose_couple_profile_image': return 'Choose your couple\'s profile image';
			case 'memory_game': return 'Memory Game';
			case 'num_mistakes': return 'Number of Mistakes';
			case 'score': return 'Score';
			case 'game_over': return 'Game Over';
			case 'you_win': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'You Win!';
					case GenderContext.female:
						return 'You Win!';
				}
			};
			case 'upload_six_images': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Upload 6 images for the memory game';
					case GenderContext.female:
						return 'Upload 6 images for the memory game';
				}
			};
			case 'upload_images': return 'Upload Images';
			case 'confirm_images': return 'Confirm Images?';
			case 'memory_game_description': return ({required GenderContext context}) {
				switch (context) {
					case GenderContext.male:
						return 'Create a fun memory game with 6 shared pictures of you two!';
					case GenderContext.female:
						return 'Create a fun memory game with 6 shared pictures of you two!';
				}
			};
			case 'memory_game_lock_title': return 'Memory Game is Locked';
			case 'memory_game_lock_description': return ({required Object name}) => 'To unlock it, please ask ${name} for a new chance';
			case 'memory_game_done': return ({required GenderContext context, required Object name, required Object score}) {
				switch (context) {
					case GenderContext.male:
						return '${name} finished the game with a score of ${score}';
					case GenderContext.female:
						return '${name} finished the game with a score of ${score}';
				}
			};
			case 'open_new_memory_game': return 'Open a New Memory Game';
			case 'cant_upload_more_than': return ({required GenderContext context, required Object number}) {
				switch (context) {
					case GenderContext.male:
						return 'You cannot upload more than ${number} files';
					case GenderContext.female:
						return 'You cannot upload more than ${number} files';
				}
			};
			case 'locked_category': return 'This category is locked.\nTo unlock it, upgrade your plan in the settings';
			case 'edit_title': return 'Edit Title';
			case 'watch_login_success': return 'Successfully logged in!\nYou can now switch to the clock';
			case 'login_via_phone': return 'Log in via Phone';
			case 'wait_for_phone_login': return 'Waiting for phone login';
			case 'login_successful': return 'Successfully logged in!';
			case 'no_owner': return 'The user is not an administrative user';
			case 'login_failed': return 'Login Failed';
			case 'please_open_app_in_phone': return 'Please open the app on your phone to log in';
			case 'failed_send_login_request': return 'Failed to send login request to phone. Please try again';
			case 'no_category_added': return 'No categories have been added for this event';
			default: return null;
		}
	}
}

extension on _StringsHe {
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
			case 'generate_text_description': return ({required Object relationship, required Object name, required Object myName, required Object lineNumber, required Object wordsInLineNumber, required Object age}) => 'רשום ברכת יום הולדת ל${relationship}, השם הוא ${name}\nהשם שלי הוא: ${myName}\nמספר השורות של הברכה: ${lineNumber}\nמספר המילים בשורה:${wordsInLineNumber}\nהגיל  הוא ${age}';
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
			case 'no_category_added': return 'לא הוספת קטגרויות לאירוע זה';
			default: return null;
		}
	}
}
