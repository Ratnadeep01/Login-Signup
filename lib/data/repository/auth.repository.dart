import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../features/auth/controllers/auth.controllers.dart';

class AuthenticationServices {
  static final RegistrationControllers _authControllers =
      Get.find<RegistrationControllers>();
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  /// ************     Verify Mobile numbers     ***************

  /// ************     Username and password registration(signUp)     ***************

  static Future<String?> registerUser() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: _authControllers.emailController.text,
        password: _authControllers.passwordController.text,
      );

      await _firebaseFirestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'email': _authControllers.emailController.text,
        'phone': _authControllers.mobileController.text,
        'userName': _authControllers.usernameController.text
      });

      _authControllers.emailController.clear();
      _authControllers.passwordController.clear();
      return null;
    } on FirebaseAuthException catch (e) {
      _authControllers.emailController.clear();
      _authControllers.passwordController.clear();
      switch (e.code) {
        case 'email-already-in-use':
          return 'The account already exists for that email.';
        case 'invalid-email':
          return 'The email address is not valid.';
        case 'operation-not-allowed':
          return 'Email/password accounts are not enabled.';
        case 'weak-password':
          return 'The password provided is too weak.';
        default:
          return 'An unknown error occurred.';
      }
    } catch (e) {
      return 'An error occurred: ${e.toString()}';
    }
  }

  /// ************     Username and password login(signIn)     ***************

  static Future<String?> authenticateUser() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: _authControllers.emailController.text,
          password: _authControllers.passwordController.text);
      _authControllers.emailController.clear();
      _authControllers.passwordController.clear();
      return null;
    } on FirebaseAuthException catch (e) {
      _authControllers.emailController.clear();
      _authControllers.passwordController.clear();
      switch (e.code) {
        case 'invalid-credential':
          return 'The email or password you entered is not valid.';
        case 'user-disabled':
          return 'The user corresponding to the given email has been disabled.';
        case 'user-not-found':
          return 'There is no user corresponding to the given email.';
        case 'wrong-password':
          return 'The password is invalid for the given email.';
        case 'too-many-requests':
          return 'Too many attempts to sign in as this user. Please try again later.';
        case 'operation-not-allowed':
          return 'Email/password accounts are not enabled.';
        default:
          return 'An unknown error occurred. ${e.code}';
      }
    } catch (e) {
      return 'An error occurred: ${e.toString()}';
    }
  }
}
