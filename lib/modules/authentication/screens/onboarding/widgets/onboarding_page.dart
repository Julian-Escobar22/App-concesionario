import 'package:flutter/material.dart';
import 'package:project_final/utils/constants/sizes.dart';
import 'package:project_final/utils/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 20.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 175, 116, 84), // Usar el color de fondo del login
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image(
                width: HelperFunctions.screenWidth() * 0.6,
                height: HelperFunctions.screenHeight() * 0.4,
                image: AssetImage(image),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            title,
            style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 24.0), // Ajustar el tamaño del título según sea necesario
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.0),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 18.0), // Ajustar el tamaño del texto según sea necesario
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
