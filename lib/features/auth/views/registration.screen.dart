import 'package:assignment_intern/common/widgets/loginButton.widget.dart';
import 'package:assignment_intern/utility/constants/appConstants.dart';
import 'package:assignment_intern/utility/helperFunctions/authHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/appBar.widget.dart';
import '../../../common/widgets/customForm.widget.dart';
import '../controllers/auth.controllers.dart';
import 'login.screen.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  RegistrationControllers registrationControllers = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: Appconstants.registrationAppBar),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
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
                      key: registrationControllers.registerFormKey,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height /
                            Appconstants.formScaling,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomFormField(
                                validator: (username) {
                                  return AuthHelper.validateUsername(username);
                                },
                                obsecureText: false,
                                hint: Appconstants.usernameHintText,
                                keyboardType: TextInputType.text,
                                controller:
                                    registrationControllers.usernameController),
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
                              validator: (mobile) {
                                return AuthHelper.validateMobileNumber(mobile);
                              },
                              verifyButton: TextButton(
                                onPressed: () {},
                                child: const Text(Appconstants.verify),
                              ),
                              hint: Appconstants.mobileHintText,
                              keyboardType: TextInputType.phone,
                              controller:
                                  registrationControllers.mobileController,
                              obsecureText: false,
                            ),
                            CustomFormField(
                                validator: (password) {
                                  return AuthHelper.validatePassword(password);
                                },
                                obsecureText: true,
                                keyboardType: TextInputType.text,
                                hint: Appconstants.passwordHintText,
                                controller:
                                    registrationControllers.passwordController),
                            CustomFormField(
                                validator: (confirmPassword) {
                                  if (registrationControllers
                                          .passwordController.text !=
                                      confirmPassword) {
                                    return Appconstants.passwordNotMatch;
                                  }
                                },
                                obsecureText: true,
                                hint: Appconstants.confirmPasswordHintText,
                                keyboardType: TextInputType.text,
                                controller: registrationControllers
                                    .confirmPasswordController)
                          ],
                        ),
                      )),
                  LoginButton(
                    buttonText: Appconstants.register,
                    authFunction: () async {
                      await registrationControllers.validateRegistrationForm();
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        Get.offAll(LoginScreen());
                      },
                      child: const Text(Appconstants.alreadyAccount)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
