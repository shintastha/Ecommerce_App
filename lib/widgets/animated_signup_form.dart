// register_form.dart

import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/res/theme/app_pallete.dart';
import 'package:ecommerce_app/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:get/get.dart'; // Assuming you have a PrimaryButton widget

class AnimatedRegisterForm extends StatefulWidget {
  final bool showRegisterForm;
  final Function onCancel;

  const AnimatedRegisterForm({
    Key? key,
    required this.showRegisterForm,
    required this.onCancel,
  }) : super(key: key);

  @override
  State<AnimatedRegisterForm> createState() => _AnimatedRegisterFormState();
}

class _AnimatedRegisterFormState extends State<AnimatedRegisterForm> {
  final AuthController authController = Get.put(AuthController());

  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _confirmPasswordController =
  //     TextEditingController();
  // bool _isPasswordVisible = false;
  // bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      bottom: widget.showRegisterForm ? 0 : -MediaQuery.of(context).size.height,
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
                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppPalette.gradient1,
                  ),
                ),
                const SizedBox(height: 18),
                AuthField(
                  hintText: "Name",
                  controller: authController.nameController,
                ),
                const SizedBox(height: 12),
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
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 12),
                Obx(() {
                  return AuthField(
                    hintText: "Confirm Password",
                    controller: authController.confirmPasswordController,
                    isObscureText:
                        !authController.isConfirmPasswordVisible.value,
                    iconButton: IconButton(
                      onPressed: () {
                        authController.toggleConfirmPasswordVisibility();
                      },
                      icon: Icon(
                        authController.isConfirmPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 20),
                PrimaryButton(
                  title: "Register",
                  onPressed: () {
                    authController.register();
                    // final email = _emailController.text;
                    // final password = _passwordController.text;
                    // final confirmPassword = _confirmPasswordController.text;

                    // if (email.isEmpty ||
                    //     password.isEmpty ||
                    //     confirmPassword.isEmpty) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text('Please fill in all fields'),
                    //     ),
                    //   );
                    // } else if (password != confirmPassword) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text('Passwords do not match'),
                    //     ),
                    //   );
                    // } else {
                    //   // Proceed with registration
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //         content:
                    //             Text('Registration successful for $email!')),
                    //   );
                    // }
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        widget.onCancel();
                      },
                      child: const Text('Login'),
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


// // register_form.dart

// import 'package:flutter/material.dart';
// import 'package:ecommerce_app/core/theme/app_pallete.dart';
// import 'package:ecommerce_app/widgets/button.dart'; // Assuming you have a PrimaryButton widget

// class AnimatedRegisterForm extends StatelessWidget {
//   final bool showRegisterForm;
//   final Function onCancel;

//   const AnimatedRegisterForm({
//     Key? key,
//     required this.showRegisterForm,
//     required this.onCancel,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedPositioned(
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//       bottom: showRegisterForm ? 0 : -MediaQuery.of(context).size.height,
//       left: 0,
//       right: 0,
//       height: MediaQuery.of(context).size.height * 0.85,
//       child: Container(
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 "Register",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: AppPalette.gradient2,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Username",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Email",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Password",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               PrimaryButton(
//                 title: "Register",
//                 onPressed: () {
//                   // Add register logic here
//                 },
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Already have an account?"),
//                   TextButton(
//                     onPressed: () {
//                       // Navigate to the registration page
//                       onCancel();
//                     },
//                     child: const Text('Sign In'),
//                   ),
//                 ],
//               ),

//               // const SizedBox(height: 10),
//               // TextButton(
//               //   onPressed: () {
//               //     onCancel(); // Handle cancel
//               //   },
//               //   child: const Text("Cancel"),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
