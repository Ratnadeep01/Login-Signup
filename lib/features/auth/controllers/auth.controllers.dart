import 'package:assignment_intern/features/Home/views/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repository/auth.repository.dart';
import '../views/login.screen.dart';

class RegistrationControllers extends GetxController {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  Future<void> validateRegistrationForm() async {
    if (registerFormKey.currentState!.validate()) {
      String? errorMessage = await AuthenticationServices.registerUser();
      if (errorMessage == null) {
        Get.snackbar('Success', 'User registered successfully',
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
        Get.offAll(LoginScreen());
      } else {
        Get.snackbar('Error', errorMessage,
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
      }
    }
  }

  Future<void> authenticateUser() async {
    if (loginFormKey.currentState!.validate()) {
      String? errorMessage = await AuthenticationServices.authenticateUser();
      if (errorMessage == null) {
        Get.snackbar('Success', 'Login successful',
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
        Get.offAll(const HomeScreen());
      } else {
        Get.snackbar('Error', errorMessage,
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
      }
    }
  }
}
