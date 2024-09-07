import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HTextFormFieldTheme {
  HTextFormFieldTheme._();

  static InputDecorationTheme customInputTheme = InputDecorationTheme(
    focusedBorder: OutlineInputBorder().copyWith(
        borderSide: const BorderSide(color: Color(0xFFA4A4A4), width: 2),
        borderRadius: BorderRadius.circular(8)),
    suffixIconColor: Color(0xFFA4A4A4),
    hintStyle: GoogleFonts.manrope(
        color: const Color(0xFFA4A4A4), fontWeight: FontWeight.w600),
    enabledBorder: OutlineInputBorder().copyWith(
        borderSide: const BorderSide(color: Color(0xFFA4A4A4), width: 2),
        borderRadius: BorderRadius.circular(8)),
    filled: false,
    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    focusedErrorBorder: OutlineInputBorder().copyWith(
        borderSide: const BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(8)),
    errorBorder: OutlineInputBorder().copyWith(
        borderSide: const BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(8)),
    errorStyle: TextStyle(color: Colors.red),
  );
}