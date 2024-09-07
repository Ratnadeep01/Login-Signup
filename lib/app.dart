import 'package:assignment_intern/utility/themes/app.theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/auth/controllers/auth.controllers.dart';
import 'features/auth/views/registration.screen.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final RegistrationControllers registrationControllers =
      Get.put(RegistrationControllers());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: HAppTheme.customTheme,
      debugShowCheckedModeBanner: false,
      home: RegistrationScreen(),
    );
  }
}
