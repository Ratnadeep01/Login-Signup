import 'package:assignment_intern/common/widgets/loginButton.widget.dart';
import 'package:assignment_intern/features/auth/controllers/auth.controllers.dart';
import 'package:assignment_intern/features/auth/views/registration.screen.dart';
import 'package:assignment_intern/utility/constants/appConstants.dart';
import 'package:assignment_intern/utility/helperFunctions/authHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../common/widgets/appBar.widget.dart';
import '../../../common/widgets/customForm.widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  RegistrationControllers registrationControllers = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: Appconstants.loginAppBar),
        backgroundColor: Colors.black,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Appconstants.horizontalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Form(
                    key: registrationControllers.loginFormKey,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height /
                          Appconstants.loginFormScaling,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomFormField(
                              validator: (email) {
                                return AuthHelper.validateEmail(email);
                              },
                              obsecureText: false,
                              hint: Appconstants.emailHintText,
                              keyboardType: TextInputType.emailAddress,
                              controller:
                                  registrationControllers.emailController),
                          CustomFormField(
                              validator: (password) {
                                return AuthHelper.validatePassword(password);
                              },
                              obsecureText: true,
                              keyboardType: TextInputType.text,
                              hint: Appconstants.passwordHintText,
                              controller:
                                  registrationControllers.passwordController),
                        ],
                      ),
                    )),
                LoginButton(
                  buttonText: Appconstants.login,
                  authFunction: () async {
                    await registrationControllers.authenticateUser();
                  },
                ),
                TextButton(
                    onPressed: () {
                      Get.offAll(RegistrationScreen());
                    },
                    child: const Text(Appconstants.noAccount))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
