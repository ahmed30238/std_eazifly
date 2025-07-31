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
  /// **'The Programs'**
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
  /// **'المحاضرة القادمة'**
  String get nextLecture;

  /// No description provided for @goals.
  ///
  /// In en, this message translates to:
  /// **'الاهداف'**
  String get goals;

  /// No description provided for @competitorsMenu.
  ///
  /// In en, this message translates to:
  /// **'قائمة المنافسين'**
  String get competitorsMenu;

  /// No description provided for @myStudent.
  ///
  /// In en, this message translates to:
  /// **'طلابي'**
  String get myStudent;

  /// No description provided for @programLeader.
  ///
  /// In en, this message translates to:
  /// **'المتصدرين بالبرنامج'**
  String get programLeader;

  /// No description provided for @leaderboardMenu.
  ///
  /// In en, this message translates to:
  /// **'قائمة المتصدرين'**
  String get leaderboardMenu;

  /// No description provided for @setAppointmenta.
  ///
  /// In en, this message translates to:
  /// **'تعيين المواعيد'**
  String get setAppointmenta;

  /// No description provided for @frommHour.
  ///
  /// In en, this message translates to:
  /// **'من الساعة'**
  String get frommHour;

  /// No description provided for @toHour.
  ///
  /// In en, this message translates to:
  /// **'إلى الساعة'**
  String get toHour;

  /// No description provided for @students.
  ///
  /// In en, this message translates to:
  /// **'الطلاب'**
  String get students;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'الأيام'**
  String get days;

  /// No description provided for @chooseAppropriateLecturer.
  ///
  /// In en, this message translates to:
  /// **'اختر المعلم المناسب'**
  String get chooseAppropriateLecturer;

  /// No description provided for @choose.
  ///
  /// In en, this message translates to:
  /// **'اختر'**
  String get choose;

  /// No description provided for @studentSchedules.
  ///
  /// In en, this message translates to:
  /// **'مواعيد الطلاب'**
  String get studentSchedules;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'التالي'**
  String get next;

  /// No description provided for @subscriptionDetails.
  ///
  /// In en, this message translates to:
  /// **'تفاصيل الاشتراك'**
  String get subscriptionDetails;

  /// No description provided for @packageDetails.
  ///
  /// In en, this message translates to:
  /// **'تفاصيل المجموعة'**
  String get packageDetails;

  /// No description provided for @completePaymentProcess.
  ///
  /// In en, this message translates to:
  /// **'اتمام عملية الدفع'**
  String get completePaymentProcess;

  /// No description provided for @confirmPaymentProcess.
  ///
  /// In en, this message translates to:
  /// **'تأكيد عملية الدفع'**
  String get confirmPaymentProcess;

  /// No description provided for @cancelSession.
  ///
  /// In en, this message translates to:
  /// **'الغاء المحاضرة'**
  String get cancelSession;

  /// No description provided for @my_name.
  ///
  /// In en, this message translates to:
  /// **'m name'**
  String get my_name;
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
