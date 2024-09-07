import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  LoginButton(
      {super.key, required this.buttonText, required this.authFunction});

  final String buttonText;
  Callback authFunction;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      onPressed: authFunction,
      height: 60,
      minWidth: double.infinity,
      child: Center(
        child: Text(
          buttonText,
          style:
              GoogleFonts.poppins(color: const Color(0xFFFFFFFF), fontSize: 18),
        ),
      ),
    );
  }
}
