import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/res/theme/app_pallete.dart';
import 'package:ecommerce_app/widgets/animated_login_form.dart';
import 'package:ecommerce_app/widgets/animated_signup_form.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:ecommerce_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              // Background Gradient and Content
              GestureDetector(
                onTap: () {
                  controller.closeForms();
                  controller.resetForms();
                },
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppPalette.gradient3,
                        AppPalette.gradient2,
                        AppPalette.gradient1,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Image.asset(
                            'assets/images/cover.png',
                            fit: BoxFit.contain,
                            width: MediaQuery.of(context).size.width * 0.8,
                          ),
                        ),
                        const SizedBox(height: 50),
                        PrimaryButton(
                          title: "Login",
                          fontSize: 18,
                          onPressed: () {
                            controller.toggleLoginForm();
                          },
                          icon: const Icon(Icons.login,
                              size: 18, color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        PrimaryButton(
                          color: AppPalette.whiteColor,
                          textColor: Colors.black,
                          fontSize: 18,
                          icon: const Icon(Icons.person_add,
                              size: 18, color: Colors.black),
                          title: "Register",
                          onPressed: () {
                            controller.toggleRegisterForm();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Top Message Text
              Positioned(
                top: 50,
                left: 20,
                child: Obx(() {
                  if (controller.showLoginForm.value) {
                    return const TextWidget(
                      text: "Welcome Back",
                      size: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    );
                  } else if (controller.showRegisterForm.value) {
                    return const TextWidget(
                      text: "Create an account",
                      size: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    );
                  }
                  return const SizedBox.shrink();
                }),
              ),

              Obx(() {
                return AnimatedLoginForm(
                    showLoginForm: controller.showLoginForm.value,
                    onCancel: () {
                      controller.toggleRegisterForm();
                      controller.resetForms();
                    });
              }),

              Obx(() {
                return AnimatedRegisterForm(
                    showRegisterForm: controller.showRegisterForm.value,
                    onCancel: () {
                      controller.toggleLoginForm();
                      controller.resetForms();
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
