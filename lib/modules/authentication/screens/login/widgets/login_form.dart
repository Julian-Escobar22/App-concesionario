import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_final/utils/constants/image_strings.dart';
import 'package:project_final/utils/constants/sizes.dart';
import 'package:project_final/utils/constants/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFB8E994), Color(0xFF78E08F)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImage.onLogo,
            height: 150,
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
          Text(
            AppText.loginTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSizes.sm),
          Text(
            AppText.loginSubTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
