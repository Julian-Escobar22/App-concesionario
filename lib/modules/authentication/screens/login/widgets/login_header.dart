import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_final/utils/constants/image_strings.dart';
import 'package:project_final/utils/constants/sizes.dart';
import 'package:project_final/utils/constants/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImage.onLogo,
            height: 150,
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
          Center(
            child: Text(
              AppText.loginTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center, // Alinea el texto horizontalmente al centro
            ),
          ),
          const SizedBox(height: AppSizes.sm),
          Center(
            child: Text(
              AppText.loginSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center, // Alinea el texto horizontalmente al centro
            ),
          ),
        ],
      ),
    );
  }
}
