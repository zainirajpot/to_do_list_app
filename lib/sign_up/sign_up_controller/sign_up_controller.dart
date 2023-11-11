import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  //final  passwordncontroler=TextEditingController().obs;
  Future<bool> validateAndSignUp() async {
    if (nameController.value.text.isEmpty) {
      Get.snackbar('Error', 'Name cannot be empty');
      return false;
    } else if (emailController.value.text.isEmpty) {
      Get.snackbar('Error', 'Email cannot be empty');
      return false;
    } else if (!emailController.value.text.isEmail) {
      Get.snackbar('Error', 'Email is not valid');
      return false;
    } else if (passwordController.value.text.length < 6) {
      Get.snackbar('Error', "Your password should be at least 6 characters.");
      return false;
    } else {
      // Validation successful
      return true;
    }
  }
}
