
import 'package:project_final/generated/app_localizations.dart';
import 'package:get/get.dart';

class AppText {
  AppText._();

  // Global texts

  // OnBoarding texts
  static String onBoardingTitle1 =
      AppLocalizations.of(Get.context!).onboarding('onBoardingTitle1');
  static String onBoardingTitle2 =
      AppLocalizations.of(Get.context!).onboarding('onBoardingTitle2');
  static String onBoardingTitle3 =
      AppLocalizations.of(Get.context!).onboarding('onBoardingTitle3');

  static String onBoardingSubTitle1 =
      AppLocalizations.of(Get.context!).onboarding('onBoardingSubTitle1');
  static String onBoardingSubTitle2 =
      AppLocalizations.of(Get.context!).onboarding('onBoardingSubTitle2');
  static String onBoardingSubTitle3 =
      AppLocalizations.of(Get.context!).onboarding('onBoardingSubTitle3');

  // -- Authentication Headings
  static String loginTitle =
      AppLocalizations.of(Get.context!).login('loginTitle');
  static String loginSubTitle =
      AppLocalizations.of(Get.context!).login('loginSubTitle');

  // -- Authentication Forms
  static String email = AppLocalizations.of(Get.context!).login('email');
  static String password = AppLocalizations.of(Get.context!).login('password');
  static String rememberMe =
      AppLocalizations.of(Get.context!).login('rememberMe');
  static String forgetPassword =
      AppLocalizations.of(Get.context!).login('forgetPassword');
  static String signIn = AppLocalizations.of(Get.context!).login('signIn');
  static String createAccount =
      AppLocalizations.of(Get.context!).login('createAccount');
  static String orSignInWith =
      AppLocalizations.of(Get.context!).login('orSignInWith');
}
