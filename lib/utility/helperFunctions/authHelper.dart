import 'package:get/get_utils/src/get_utils/get_utils.dart';

class AuthHelper {
  static validateUsername(dynamic username) {
    if (username == null || username.isEmpty) {
      return "Please enter the username";
    }
  }

  static validatePassword(dynamic password) {
    if (password == null || password.isEmpty) {
      return "Please enter password";
    } else if (password.length < 8) {
      return "Password must be atleast 8 characters long";
    } else if (!RegExp(
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
        .hasMatch(password)) {
      return 'Password must include letters, numbers, and special characters';
    } else {
      return null;
    }
  }

  static validateEmail(dynamic email) {
    if (email == null || email.isEmpty) {
      return "Please enter the email";
    } else if (!GetUtils.isEmail(email)) {
      return "Please enter a valid email address";
    } else {
      return null;
    }
  }

  static validateMobileNumber(dynamic mobile) {
    if (mobile
        .toString()
        .length < 10) {
      return "This is not a valid mobile number";
    }
  }

}