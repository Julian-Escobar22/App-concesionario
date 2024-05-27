import 'package:flutter/material.dart';
import 'package:project_final/common/styles/spacing_styles.dart';
import 'package:project_final/common/widgets/login_sign_up/form_divider.dart';
import 'package:project_final/modules/authentication/screens/login/widgets/login_header.dart';
import 'package:project_final/modules/products/screens/list_product.dart';
import 'package:project_final/utils/constants/colors.dart';
import 'package:project_final/utils/constants/image_strings.dart';
import 'package:project_final/utils/constants/sizes.dart';
import 'package:project_final/utils/constants/text_strings.dart';
import 'package:project_final/utils/services/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService(); 
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  Future<void> signIn(BuildContext context) async {
    String email = _emailController.text.trim();
    String pass = _passwordController.text.trim();

    final user = await _auth.signInWithEmailAndPassword(email, pass);

    if (user != null) {
      print('Usuario si existe');
      Get.to(const ListProduct());
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('The user / password incorrect'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF5F5DC), // Beige claro
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyles.paddingWithAppBarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Logo, Title and Subtitle
                const LoginHeader(),

                /// Form
                Form(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: AppSizes.spaceBtwSections * 2,
                    ),
                    child: Column(
                      children: [
                        /// Email
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.direct_right),
                            labelText: AppText.email,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSizes.spaceBtwInputFields * 1.5),

                        /// Password
                        TextFormField(
                          obscureText: _obscurePassword,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.password_check),
                            labelText: AppText.password,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword ? Iconsax.eye_slash : Iconsax.eye,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSizes.spaceBtwInputFields),

                        /// Forget Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(AppText.forgetPassword),
                          ),
                        ),
                        const SizedBox(height: AppSizes.spaceBtwSections * 1.5),

                        /// Sign In Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              signIn(context);
                            },
                            child: Text(AppText.signIn),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwItems * 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
