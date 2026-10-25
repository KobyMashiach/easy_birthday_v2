/// Route names/paths. Root routes start with '/', child routes are relative.
class Routing {
  // splash
  static const splash = '/';

  // auth
  static const login = '/login';
  static const register = '/register';
  static const otpVerification = '/otp-verification';
  static const firstLogin = '/first-login';

  // onboarding (choose color/plan are also opened from settings)
  static const onboarding = '/onboarding';
  static const chooseAppColor = '/choose-app-color';
  static const choosePlan = '/choose-plan';

  // home
  static const home = '/home';

  // category editor (owner)
  static const addText = '/add-text';
  static const generateGreeting = '/generate-greeting';
  static const addPicturesVideos = '/add-pictures-videos';
  static const addQuizGame = '/add-quiz-game';
  static const addQuestion = '/add-question';
  static const removeQuestions = '/remove-questions';
  static const addBirthdayCalendar = '/add-birthday-calendar';
  static const addBirthdaySurprise = '/add-birthday-surprise';
  static const addWishesList = '/add-wishes-list';
  static const addMemoryGame = '/add-memory-game';
  static const addTimeCapsule = '/add-time-capsule';
  static const addBabyLetter = '/add-baby-letter';
  static const addParentStats = '/add-parent-stats';
  static const addMilestones = '/add-milestones';
  static const addLookAlike = '/add-look-alike';

  // category display (partner)
  static const displayText = '/display-text';
  static const displayPicturesVideos = '/display-pictures-videos';
  static const displayQuizGame = '/display-quiz-game';
  static const doneQuiz = '/done-quiz';
  static const displayBirthdayCalendar = '/display-birthday-calendar';
  static const displayBirthdaySurprise = '/display-birthday-surprise';
  static const displayWishesList = '/display-wishes-list';
  static const displayMemoryGame = '/display-memory-game';
  static const displayTimeCapsule = '/display-time-capsule';
  static const displayParentCoupons = '/display-parent-coupons';
  static const displayBabyLetter = '/display-baby-letter';
  static const displayParentStats = '/display-parent-stats';
  static const displayMilestones = '/display-milestones';
  static const displayLookAlike = '/display-look-alike';

  // settings (children are relative to /settings)
  static const settings = '/settings';
  static const appInfo = 'app-info';
  static const changeLanguage = 'change-language';
  static const changePassword = 'change-password';
  static const genderChange = 'gender-change';
  static const buildApp = '/build-app';
  // Root route: also opened from home (dialog / what's new).
  static const children = '/children';
  static const contactUs = '/contact-us';

  // wear os
  static const wearOsLogin = '/wear-os-login';
  static const wearOsCategories = '/wear-os-categories';

  // dev
  static const developer = '/developer';
}
