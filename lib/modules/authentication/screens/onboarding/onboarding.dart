import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_final/modules/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:project_final/modules/authentication/screens/onboarding/widgets/onboarding_elevated_button.dart';
import 'package:project_final/modules/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:project_final/modules/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:project_final/modules/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:project_final/utils/constants/image_strings.dart';
import 'package:project_final/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 208, 182), // Gris claro
      body: Stack(
        children: [
          /// Horizontal scrollable pagesr
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: AppImage.onBoardingImage1,
                title: AppText.onBoardingTitle1,
                subTitle: AppText.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: AppImage.onBoardingImage2,
                title: AppText.onBoardingTitle2,
                subTitle: AppText.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: AppImage.onBoardingImage3,
                title: AppText.onBoardingTitle3,
                subTitle: AppText.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip button
          const OnBoardingSkip(),

          /// Dot navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular button
          const OnBoardingElevatedButton(),
        ],
      ),
    );
  }
}
