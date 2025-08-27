import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'lang/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @sessionState.
  ///
  /// In en, this message translates to:
  /// **'Session State'**
  String get sessionState;

  /// No description provided for @sessionDuration.
  ///
  /// In en, this message translates to:
  /// **'Session Duration'**
  String get sessionDuration;

  /// No description provided for @main.
  ///
  /// In en, this message translates to:
  /// **'Main'**
  String get main;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @most_popular.
  ///
  /// In en, this message translates to:
  /// **'Most Popular'**
  String get most_popular;

  /// No description provided for @myAccount.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get myAccount;

  /// No description provided for @library.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get library;

  /// No description provided for @myPrograms.
  ///
  /// In en, this message translates to:
  /// **'My Programs'**
  String get myPrograms;

  /// No description provided for @thePrograms.
  ///
  /// In en, this message translates to:
  /// **'Programs'**
  String get thePrograms;

  /// No description provided for @mostPopular.
  ///
  /// In en, this message translates to:
  /// **'Most Popular'**
  String get mostPopular;

  /// No description provided for @forYou.
  ///
  /// In en, this message translates to:
  /// **'For You'**
  String get forYou;

  /// No description provided for @mostSellers.
  ///
  /// In en, this message translates to:
  /// **'Best Sellers'**
  String get mostSellers;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @aboutApp.
  ///
  /// In en, this message translates to:
  /// **'About the App'**
  String get aboutApp;

  /// No description provided for @accountData.
  ///
  /// In en, this message translates to:
  /// **'Account Data'**
  String get accountData;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @subscriptionManagement.
  ///
  /// In en, this message translates to:
  /// **'Subscription Management'**
  String get subscriptionManagement;

  /// No description provided for @studentManagement.
  ///
  /// In en, this message translates to:
  /// **'Student Management'**
  String get studentManagement;

  /// No description provided for @couponsAndRewards.
  ///
  /// In en, this message translates to:
  /// **'Coupons and Rewards'**
  String get couponsAndRewards;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @reportsAndComplaints.
  ///
  /// In en, this message translates to:
  /// **'Reports and Complaints'**
  String get reportsAndComplaints;

  /// No description provided for @privacyPolicyAndUsage.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy and Usage'**
  String get privacyPolicyAndUsage;

  /// No description provided for @renewNow.
  ///
  /// In en, this message translates to:
  /// **'Renew Now'**
  String get renewNow;

  /// No description provided for @coursePrice.
  ///
  /// In en, this message translates to:
  /// **'Course Price'**
  String get coursePrice;

  /// No description provided for @studentNumberInCourse.
  ///
  /// In en, this message translates to:
  /// **'Number of Students in Course'**
  String get studentNumberInCourse;

  /// No description provided for @code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get code;

  /// No description provided for @redeemPoints.
  ///
  /// In en, this message translates to:
  /// **'Redeem Points'**
  String get redeemPoints;

  /// No description provided for @pointsBalance.
  ///
  /// In en, this message translates to:
  /// **'Points Balance'**
  String get pointsBalance;

  /// No description provided for @inviteFriends.
  ///
  /// In en, this message translates to:
  /// **'Invite Friends'**
  String get inviteFriends;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @messages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// No description provided for @professors.
  ///
  /// In en, this message translates to:
  /// **'Professors'**
  String get professors;

  /// No description provided for @appManagement.
  ///
  /// In en, this message translates to:
  /// **'App Management'**
  String get appManagement;

  /// No description provided for @dates.
  ///
  /// In en, this message translates to:
  /// **'Dates'**
  String get dates;

  /// No description provided for @currentLecture.
  ///
  /// In en, this message translates to:
  /// **'Current Lecture'**
  String get currentLecture;

  /// No description provided for @assignments.
  ///
  /// In en, this message translates to:
  /// **'Assignments'**
  String get assignments;

  /// No description provided for @quizzes.
  ///
  /// In en, this message translates to:
  /// **'Quizzes'**
  String get quizzes;

  /// No description provided for @meetings.
  ///
  /// In en, this message translates to:
  /// **'Meetings'**
  String get meetings;

  /// No description provided for @nextLecture.
  ///
  /// In en, this message translates to:
  /// **'Next Lecture'**
  String get nextLecture;

  /// No description provided for @goals.
  ///
  /// In en, this message translates to:
  /// **'Goals'**
  String get goals;

  /// No description provided for @competitorsMenu.
  ///
  /// In en, this message translates to:
  /// **'Competitors Menu'**
  String get competitorsMenu;

  /// No description provided for @myStudent.
  ///
  /// In en, this message translates to:
  /// **'My Students'**
  String get myStudent;

  /// No description provided for @programLeader.
  ///
  /// In en, this message translates to:
  /// **'Program Leaders'**
  String get programLeader;

  /// No description provided for @leaderboardMenu.
  ///
  /// In en, this message translates to:
  /// **'Leaderboard Menu'**
  String get leaderboardMenu;

  /// No description provided for @setAppointmenta.
  ///
  /// In en, this message translates to:
  /// **'Set Appointments'**
  String get setAppointmenta;

  /// No description provided for @frommHour.
  ///
  /// In en, this message translates to:
  /// **'From Hour'**
  String get frommHour;

  /// No description provided for @toHour.
  ///
  /// In en, this message translates to:
  /// **'To Hour'**
  String get toHour;

  /// No description provided for @students.
  ///
  /// In en, this message translates to:
  /// **'Students'**
  String get students;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// No description provided for @chooseAppropriateLecturer.
  ///
  /// In en, this message translates to:
  /// **'Choose Appropriate Lecturer'**
  String get chooseAppropriateLecturer;

  /// No description provided for @choose.
  ///
  /// In en, this message translates to:
  /// **'Choose'**
  String get choose;

  /// No description provided for @studentSchedules.
  ///
  /// In en, this message translates to:
  /// **'Student Schedules'**
  String get studentSchedules;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @subscriptionDetails.
  ///
  /// In en, this message translates to:
  /// **'Subscription Details'**
  String get subscriptionDetails;

  /// No description provided for @packageDetails.
  ///
  /// In en, this message translates to:
  /// **'Package Details'**
  String get packageDetails;

  /// No description provided for @completePaymentProcess.
  ///
  /// In en, this message translates to:
  /// **'Complete Payment Process'**
  String get completePaymentProcess;

  /// No description provided for @confirmPaymentProcess.
  ///
  /// In en, this message translates to:
  /// **'Confirm Payment Process'**
  String get confirmPaymentProcess;

  /// No description provided for @cancelSession.
  ///
  /// In en, this message translates to:
  /// **'Cancel Session'**
  String get cancelSession;

  /// No description provided for @my_name.
  ///
  /// In en, this message translates to:
  /// **'My Name'**
  String get my_name;

  /// No description provided for @createNewAccount.
  ///
  /// In en, this message translates to:
  /// **'Create New Account'**
  String get createNewAccount;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @firstNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Mohamed'**
  String get firstNameHint;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @lastNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Ahmed'**
  String get lastNameHint;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get email;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'example@email.com'**
  String get emailHint;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @phoneHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 0123456789'**
  String get phoneHint;

  /// No description provided for @invalidPhone.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number'**
  String get invalidPhone;

  /// No description provided for @whatsappNumber.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp Number'**
  String get whatsappNumber;

  /// No description provided for @whatsappHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 0123456789'**
  String get whatsappHint;

  /// No description provided for @invalidWhatsapp.
  ///
  /// In en, this message translates to:
  /// **'Invalid WhatsApp number'**
  String get invalidWhatsapp;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @usernameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. username123'**
  String get usernameHint;

  /// No description provided for @usernameRequired.
  ///
  /// In en, this message translates to:
  /// **'Username is required'**
  String get usernameRequired;

  /// No description provided for @usernameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Username must be at least 3 characters'**
  String get usernameMinLength;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @chooseGender.
  ///
  /// In en, this message translates to:
  /// **'Choose Gender'**
  String get chooseGender;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'••••••••'**
  String get passwordHint;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get alreadyHaveAccount;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @profileImageOptional.
  ///
  /// In en, this message translates to:
  /// **'Profile Image (Optional)'**
  String get profileImageOptional;

  /// No description provided for @tapToUpload.
  ///
  /// In en, this message translates to:
  /// **'Tap to upload image'**
  String get tapToUpload;

  /// No description provided for @registrationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Registration Successful'**
  String get registrationSuccess;

  /// No description provided for @registrationFailed.
  ///
  /// In en, this message translates to:
  /// **'Registration Failed'**
  String get registrationFailed;

  /// No description provided for @pleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Please wait...'**
  String get pleaseWait;

  /// No description provided for @continueToLogin.
  ///
  /// In en, this message translates to:
  /// **'Continue to Login'**
  String get continueToLogin;

  /// No description provided for @acceptTerms.
  ///
  /// In en, this message translates to:
  /// **'I accept the terms and conditions'**
  String get acceptTerms;

  /// No description provided for @termsError.
  ///
  /// In en, this message translates to:
  /// **'You must accept the terms and conditions'**
  String get termsError;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @passwordResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully'**
  String get passwordResetSuccess;

  /// No description provided for @verificationCodeSentTo.
  ///
  /// In en, this message translates to:
  /// **'Verification code sent to'**
  String get verificationCodeSentTo;

  /// No description provided for @verificationCode.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verificationCode;

  /// No description provided for @enterVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Enter verification code'**
  String get enterVerificationCode;

  /// No description provided for @pleaseEnterVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Please enter verification code'**
  String get pleaseEnterVerificationCode;

  /// No description provided for @verificationCodeMinLength.
  ///
  /// In en, this message translates to:
  /// **'Verification code must be at least 4 digits'**
  String get verificationCodeMinLength;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @enterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get enterNewPassword;

  /// No description provided for @pleaseEnterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter new password'**
  String get pleaseEnterNewPassword;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMinLength;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get confirmNewPassword;

  /// No description provided for @pleaseConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Please confirm password'**
  String get pleaseConfirmPassword;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @resendVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Resend verification code'**
  String get resendVerificationCode;

  /// No description provided for @resendingCode.
  ///
  /// In en, this message translates to:
  /// **'Resending code...'**
  String get resendingCode;

  /// No description provided for @ourCommunity.
  ///
  /// In en, this message translates to:
  /// **'Our Community'**
  String get ourCommunity;

  /// No description provided for @failedToLoadMessages.
  ///
  /// In en, this message translates to:
  /// **'Failed to load messages'**
  String get failedToLoadMessages;

  /// No description provided for @noMessagesWithInstructors.
  ///
  /// In en, this message translates to:
  /// **'No messages with instructors'**
  String get noMessagesWithInstructors;

  /// No description provided for @startConversationWithInstructors.
  ///
  /// In en, this message translates to:
  /// **'Start a conversation with your instructors to ask questions'**
  String get startConversationWithInstructors;

  /// No description provided for @noMessagesWithClients.
  ///
  /// In en, this message translates to:
  /// **'No messages with clients'**
  String get noMessagesWithClients;

  /// No description provided for @startConversationWithClients.
  ///
  /// In en, this message translates to:
  /// **'Start a conversation with clients to follow up on their inquiries'**
  String get startConversationWithClients;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'age'**
  String get age;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @verificationCodeSent.
  ///
  /// In en, this message translates to:
  /// **'Verification code has been sent to your email'**
  String get verificationCodeSent;

  /// No description provided for @forgotPasswordQuestion.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPasswordQuestion;

  /// No description provided for @forgotPasswordDescription.
  ///
  /// In en, this message translates to:
  /// **'Don\'t worry! Enter your email and we\'ll send you a verification code to reset your password'**
  String get forgotPasswordDescription;

  /// No description provided for @pleaseEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get pleaseEnterEmail;

  /// No description provided for @pleaseEnterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get pleaseEnterValidEmail;

  /// No description provided for @sendVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Send Verification Code'**
  String get sendVerificationCode;

  /// No description provided for @backToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get backToLogin;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @tutorialFinished.
  ///
  /// In en, this message translates to:
  /// **'Tutorial finished'**
  String get tutorialFinished;

  /// No description provided for @tutorialSkipped.
  ///
  /// In en, this message translates to:
  /// **'Tutorial skipped'**
  String get tutorialSkipped;

  /// No description provided for @reviewProgramsTutorial.
  ///
  /// In en, this message translates to:
  /// **'Click here to view programs under review'**
  String get reviewProgramsTutorial;

  /// No description provided for @noSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'You have no subscriptions'**
  String get noSubscriptions;

  /// No description provided for @subscribeNow.
  ///
  /// In en, this message translates to:
  /// **'Subscribe now'**
  String get subscribeNow;

  /// No description provided for @programsUnderReview.
  ///
  /// In en, this message translates to:
  /// **'You have programs under review'**
  String get programsUnderReview;

  /// No description provided for @tapToAddSessions.
  ///
  /// In en, this message translates to:
  /// **'Tap to add sessions'**
  String get tapToAddSessions;

  /// No description provided for @alreadyStarted.
  ///
  /// In en, this message translates to:
  /// **'Already started'**
  String get alreadyStarted;

  /// No description provided for @ongoingNow.
  ///
  /// In en, this message translates to:
  /// **'Ongoing now'**
  String get ongoingNow;

  /// No description provided for @notSpecified.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get notSpecified;

  /// No description provided for @noDescription.
  ///
  /// In en, this message translates to:
  /// **'No description'**
  String get noDescription;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get minutes;

  /// No description provided for @audios.
  ///
  /// In en, this message translates to:
  /// **'Audios'**
  String get audios;

  /// No description provided for @menus.
  ///
  /// In en, this message translates to:
  /// **'Menus'**
  String get menus;

  /// No description provided for @favourite.
  ///
  /// In en, this message translates to:
  /// **'Favourite'**
  String get favourite;

  /// No description provided for @noAudios.
  ///
  /// In en, this message translates to:
  /// **'No available audios'**
  String get noAudios;

  /// No description provided for @noMenus.
  ///
  /// In en, this message translates to:
  /// **'No Available Menus'**
  String get noMenus;

  /// No description provided for @noFavs.
  ///
  /// In en, this message translates to:
  /// **'No Available Favourites'**
  String get noFavs;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @upcomingLectures.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Lectures'**
  String get upcomingLectures;

  /// No description provided for @noUpcomingLectures.
  ///
  /// In en, this message translates to:
  /// **'No upcoming lectures'**
  String get noUpcomingLectures;

  /// No description provided for @noAudioContentAvailable.
  ///
  /// In en, this message translates to:
  /// **'No audio content available'**
  String get noAudioContentAvailable;

  /// No description provided for @noItemsInThisList.
  ///
  /// In en, this message translates to:
  /// **'No items in this list'**
  String get noItemsInThisList;

  /// No description provided for @noNotifications.
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get noNotifications;

  /// No description provided for @noNotificationsFound.
  ///
  /// In en, this message translates to:
  /// **'No notifications found yet'**
  String get noNotificationsFound;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @programDetails.
  ///
  /// In en, this message translates to:
  /// **'Program Details'**
  String get programDetails;

  /// No description provided for @programs.
  ///
  /// In en, this message translates to:
  /// **'Programs'**
  String get programs;

  /// No description provided for @dataLoadError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading data'**
  String get dataLoadError;

  /// No description provided for @checkInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'Check your internet connection and try again'**
  String get checkInternetConnection;

  /// No description provided for @subscribeNowButton.
  ///
  /// In en, this message translates to:
  /// **'Subscribe Now'**
  String get subscribeNowButton;

  /// No description provided for @choosePlanDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose from a variety of packages and enjoy exclusive benefits'**
  String get choosePlanDescription;

  /// No description provided for @saveDiscount.
  ///
  /// In en, this message translates to:
  /// **'Save 20%'**
  String get saveDiscount;

  /// No description provided for @noAvailablePlans.
  ///
  /// In en, this message translates to:
  /// **'No available plans'**
  String get noAvailablePlans;

  /// No description provided for @planName.
  ///
  /// In en, this message translates to:
  /// **'Plan Name'**
  String get planName;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'monthly'**
  String get monthly;

  /// No description provided for @studentsCount.
  ///
  /// In en, this message translates to:
  /// **'Number of Students'**
  String get studentsCount;

  /// No description provided for @subscribe.
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get subscribe;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// No description provided for @startDateHint.
  ///
  /// In en, this message translates to:
  /// **'2025-05-15'**
  String get startDateHint;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @confirmLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get confirmLogout;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// No description provided for @confirmDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?'**
  String get confirmDeleteAccount;

  /// No description provided for @deleteAccountWarning.
  ///
  /// In en, this message translates to:
  /// **'All your data will be permanently deleted and this action cannot be undone.'**
  String get deleteAccountWarning;

  /// No description provided for @programSubscriptionLoadError.
  ///
  /// In en, this message translates to:
  /// **'Error loading program subscriptions'**
  String get programSubscriptionLoadError;

  /// No description provided for @librarySubscriptionLoadError.
  ///
  /// In en, this message translates to:
  /// **'Error loading library subscriptions'**
  String get librarySubscriptionLoadError;

  /// No description provided for @noProgramSubscription.
  ///
  /// In en, this message translates to:
  /// **'No program subscriptions'**
  String get noProgramSubscription;

  /// No description provided for @noLibrarySubscription.
  ///
  /// In en, this message translates to:
  /// **'No library subscriptions'**
  String get noLibrarySubscription;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @remain.
  ///
  /// In en, this message translates to:
  /// **'remain'**
  String get remain;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBack;

  /// No description provided for @educationJourneyStartsHere.
  ///
  /// In en, this message translates to:
  /// **'Your educational journey starts here.'**
  String get educationJourneyStartsHere;

  /// No description provided for @emailOrPhone.
  ///
  /// In en, this message translates to:
  /// **'Email or Phone Number'**
  String get emailOrPhone;

  /// No description provided for @example.
  ///
  /// In en, this message translates to:
  /// **'Example: '**
  String get example;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @noAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account..!  '**
  String get noAccount;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
