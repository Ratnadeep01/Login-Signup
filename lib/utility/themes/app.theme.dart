import 'package:assignment_intern/utility/themes/widgets/customTextButton_theme.dart';
import 'package:assignment_intern/utility/themes/widgets/customTextFormField_theme.dart';
import 'package:flutter/material.dart';

class HAppTheme {
  HAppTheme._();

  static ThemeData customTheme = ThemeData(
      useMaterial3: true,
      inputDecorationTheme: HTextFormFieldTheme.customInputTheme,
      // textTheme: HTextTheme.customTextTheme,
      textButtonTheme: HTextButtonTheme.customTextButtonTheme);
}
