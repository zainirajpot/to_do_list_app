import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginViewController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  Future<bool> checkEmailAndPassword(String email, String password) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true; // Return true if login is successful
    } catch (e) {
      return false; // Return false if login fails
    }
  }

  // Your validation method
  Future<bool> validateAndLogin() async {
    if (emailController.value.text.isEmpty) {
      Get.snackbar('Error', 'Email cannot be empty');
      return false;
    } else if (!emailController.value.text.isEmail) {
      Get.snackbar('Error', 'Email is not valid');
      return false;
    } else if (passwordController.value.text.length < 6) {
      Get.snackbar('Error', 'Your password should be at least 6 characters.');
      return false;
    } else {
      return true; // Validation successful
    }
  }
}


// class LoginViewController extends GetxController {
//   final emailController = TextEditingController().obs;
//   final passwordController = TextEditingController().obs;


//   Future<String?> checkIfEmailExists(String email) async {
//     try {
//       final FirebaseAuth _auth = FirebaseAuth.instance;
//       await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: 'temporary_password', // Provide a temporary password
//       );
//       return email; // Return the email if login is successful
//     } catch (e) {
//       // If an error is thrown, that means the email doesn't exist.
//       return null;
//     }
//   }
//   Future<bool> validateAndLogin() async {
//     if (emailController.value.text.isEmpty) {
//       Get.snackbar('Error', 'Email cannot be empty');
//       return false;
//     } else if (!emailController.value.text.isEmail) {
//       Get.snackbar('Error', 'Email is not valid');
//       return false;
//     } else if (passwordController.value.text.length < 6) {
//       Get.snackbar('Error', "Your password should be at least 6 characters.");
//       return false;
//     } else {
//       // Validation successful, proceed with login
//       Get.snackbar('Success', 'Validation is Successful');
//       return true;
//     }
//   }
// }

// class LoginController extends GetxController {
//   final emailController = TextEditingController().obs;
//   final passwordController = TextEditingController().obs;
//   //final  passwordncontroler=TextEditingController().obs;
//   Future<bool> validateAndLogin() async {
//     if (emailController.value.text.isEmpty) {
//       Get.snackbar('Error', 'Email cannot be empty');
//       return false;
//     } else if (!emailController.value.text.isEmail) {
//       Get.snackbar('Error', 'Email is not valid');
//       return false;
//     } else if (passwordController.value.text.length < 6) {
//       Get.snackbar('Error', "Your password should be at least 6 characters.");
//       return false;
//     } else {
//       Get.snackbar('Congratulations', 'Validation is Successful');
//       return true;
//     }
//   }
// }
