import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/views/bottom_navigation.dart';
import 'package:ecommerce_app/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/res/theme/app_pallete.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:get/get.dart'; // Assuming you have a PrimaryButton widget

class AnimatedLoginForm extends StatefulWidget {
  final bool showLoginForm;
  final Function onCancel;

  const AnimatedLoginForm({
    Key? key,
    required this.showLoginForm,
    required this.onCancel,
  }) : super(key: key);

  @override
  State<AnimatedLoginForm> createState() => _AnimatedLoginFormState();
}

class _AnimatedLoginFormState extends State<AnimatedLoginForm> {
  final AuthController authController = Get.put(AuthController());
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // bool _rememberMe = false;
  // bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      bottom: widget.showLoginForm ? 0 : -MediaQuery.of(context).size.height,
      left: 0,
      right: 0,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 50),
                const Text(
                  'Login',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppPalette.gradient1,
                  ),
                ),
                const SizedBox(height: 18),
                AuthField(
                  hintText: "Email",
                  controller: authController.emailController,
                ),
                const SizedBox(height: 12),
                Obx(() {
                  return AuthField(
                    hintText: "Password",
                    controller: authController.passwordController,
                    isObscureText: !authController.isPasswordVisible.value,
                    iconButton: IconButton(
                        onPressed: () {
                          authController.togglePasswordVisibility();
                        },
                        icon: Icon(
                          authController.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        )),
                  );
                }),
                const SizedBox(height: 14),
                Obx(() {
                  return Row(
                    children: [
                      Checkbox(
                        activeColor: AppPalette.buttonColor,
                        value: authController.rememberMe.value,
                        onChanged: (value) {
                          authController.toggleRememberMe(value);
                        },
                      ),
                      const Text('Remember me'),
                    ],
                  );
                }),
                const SizedBox(height: 20),
                PrimaryButton(
                    title: "Login",
                    onPressed: () {
                      authController.login();
                      authController.resetForms();
                      // final email = authController.emailController.text;
                      // final password = authController.passwordController.text;

                      // if (email.isEmpty || password.isEmpty) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //         content: Text('Please fill in all fields')),
                      //   );
                      // } else {
                      //   Get.offAllNamed('/bottomnavigation_screen');
                      //   // Navigator.push(context, BottomNavigation.route());
                      //   // // Proceed with login
                      //   // ScaffoldMessenger.of(context).showSnackBar(
                      //   //   SnackBar(content: Text('Welcome, $email!')),
                      //   // );
                      // }
                    }),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        // Navigate to the registration page
                        widget.onCancel();
                      },
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
