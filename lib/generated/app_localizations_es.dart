import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Mi Aplicación';

  @override
  String get content => 'Hola';

  @override
  String onboarding(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'onBoardingTitle1': '¡Bienvenido a nuestro concesionario!',
        'onBoardingSubTitle1': 'Estaremos encantados de mostrarte todas nuestras opciones y toda la informacion de los vehiculos: ¡su vehiculo perfecto le espera!',
        'onBoardingTitle2': '¡Contamos con planes de financiamiento!',
        'onBoardingSubTitle2': 'Conoce la nueva BMW X1, ¡MAS PODER! Y MAS ESTILO!',
        'onBoardingTitle3': 'Encuentranos en Pasto nueva apertura Avenida los estudiantes',
        'onBoardingSubTitle3': '¡Preparate para conocer un mundo de posibilidades!',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String login(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'loginTitle': 'Bienvenido, Inicia sesion para brindarte un mejor asesoramiento',
        'loginSubTitle': 'Descubra los mejores automoviles y Motos de todas las marcas. ¡A los mejores precios!',
        'email': 'Correo electrónico',
        'password': 'Contraseña',
        'rememberMe': 'Recuérdame',
        'forgetPassword': '',
        'signIn': 'Iniciar sesión',
        'createAccount': 'Crear cuenta',
        'orSignInWith': 'O inicie sesión con',
        'other': '',
      },
    );
    return '$_temp0';
  }
}
