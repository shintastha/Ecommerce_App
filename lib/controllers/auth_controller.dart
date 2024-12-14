import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Observables for login and register forms visibility
  final RxBool showLoginForm = false.obs;
  final RxBool showRegisterForm = false.obs;
  //   final TextEditingController registerNameController = TextEditingController();
  // final TextEditingController  registerEmailController = TextEditingController();
  // final TextEditingController registerPasswordController = TextEditingController();
  // final TextEditingController registerConfirmPasswordController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;
  final RxBool rememberMe = false.obs;

  void closeForms() {
    showLoginForm.value = false;
    showRegisterForm.value = false;
  }

  // Methods to toggle visibility
  void toggleLoginForm() {
    showLoginForm.value = true;
    showRegisterForm.value = false;
  }

  void toggleRegisterForm() {
    showRegisterForm.value = true;
    showLoginForm.value = false;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  void resetForms() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    confirmPasswordController.clear();
    isPasswordVisible.value = false;
    isConfirmPasswordVisible.value = false;
  }

  void login() {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      // Replace with actual login logic
      Get.offAllNamed('/bottomnavigation_screen');
    }
  }

  void register() {
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields',
          snackPosition: SnackPosition.BOTTOM);
    } else if (password != confirmPassword) {
      Get.snackbar('Error', 'Passwords do not match',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      // Replace with actual registration logic
      Get.snackbar('Success', 'Registration successful for $email!',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
