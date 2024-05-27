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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: HelperFunctions.screenWidth() * 0.7,
            margin: const EdgeInsets.only(bottom: 20.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 231, 221),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Reducir el padding interno
              child: Image(
                width: HelperFunctions.screenWidth() * 0.5, // Reducir el ancho de la imagen
                height: HelperFunctions.screenHeight() * 0.3, // Reducir la altura de la imagen
                image: AssetImage(image),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            title,
            style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 24.0), // Ajustar el tamaño del título según sea necesario
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10.0),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 18.0), 
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
