import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/comman/app_assets.dart';
import 'package:to_do_list_app/comman/app_colors.dart';
import 'package:to_do_list_app/comman/app_content.dart';
import 'package:to_do_list_app/home_page/home_controller/home_binding/hom_binding.dart';
import 'package:to_do_list_app/home_page/view/home_view.dart';
import 'package:to_do_list_app/login/login_controller/login_binding/login_binding.dart';
import 'package:to_do_list_app/login/login_view/login_view.dart';
import 'package:to_do_list_app/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:to_do_list_app/widgets/custom_textfiled.dart';

class SignUpView extends GetView<SignUpController> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 37),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInDown(
                  child: Text(
                    AppContent.hey,
                    style: GoogleFonts.alatsi(
                        fontSize: 30,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w600,
                        color: AppColors.indicatorText),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  AppContent.newAccount,
                  style: GoogleFonts.recursive(
                      letterSpacing: 3,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.indicatorText),
                ),
                SizedBox(height: height * 0.05),
                CustomTextFiled(
                  controller: controller.nameController.value,
                  hintText: AppContent.fullName,
                  prefixIcon: Icons.person,
                ),
                SizedBox(height: height * 0.03),
                CustomTextFiled(
                  controller: controller.emailController.value,
                  hintText: AppContent.email,
                  prefixIcon: Icons.email,
                ),
                SizedBox(height: height * 0.03),
                CustomTextFiled(
                  controller: controller.passwordController.value,
                  hintText: AppContent.password,
                  prefixIcon: Icons.password,
                ),
                SizedBox(height: height * 0.05),
                GestureDetector(
               onTap: () async {
                
          // Call the validation method from the controller
          bool success = await controller.validateAndSignUp();
          if (success) {
            // Validation successful, proceed with registration
            try {
              UserCredential userCredential =
                  await _auth.createUserWithEmailAndPassword(
                email: controller.emailController.value.text,
                password: controller.passwordController.value.text,
              );

              // Send a verification email to the user
              User? user = userCredential.user;
              if (user != null) {
                await user.sendEmailVerification();
              }

              Get.to(
                HomeView(),
                binding: HomeBinding(),
              );
            } catch (e) {
              Get.snackbar(
                'Error', // Title
                'Invalid email', // Message
                backgroundColor: Colors.red, // Set the background color
                colorText: Colors.white, // Set the text color
                snackPosition: SnackPosition
                    .BOTTOM, // You can change the position as needed
                duration: Duration(
                    seconds: 3), // Set the duration for the snackbar
                // You can also add more properties like borderRadius, margin, padding, etc.
              );
            }
          }
        },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        // border: Border.all(width: width*0.02,color: Colors.grey),
                        color: AppColors.purple),
                    child: Center(
                      child: Text(
                        AppContent.sign,
                        style: GoogleFonts.recursive(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppColors.whiTe),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.155),
                  child: Row(
                    children: [
                      Text(
                        'Already have an account',
                        style: GoogleFonts.recursive(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.indicatorText),
                      ),
                      SizedBox(width: width * 0.01),
                      GestureDetector(
                        onTap: () {},
                        child: GestureDetector(
                          onTap: () {
                            Get.to(LoginView(), binding: LoginBinding());
                          },
                          child: Text(
                            'Login',
                            style: GoogleFonts.recursive(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.purple),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.04),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.07),
                  child: Row(
                    children: [
                      Container(
                          height: height * 0.002,
                          width: width * 0.3,
                          color: AppColors.grey),
                      SizedBox(width: width * 0.02),
                      Text(
                        AppContent.or,
                        style: GoogleFonts.recursive(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppColors.purple),
                      ),
                      SizedBox(width: width * 0.02),
                      Container(
                          height: height * 0.002,
                          width: width * 0.3,
                          color: AppColors.grey),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.244),
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset(
                          AppAssets.google,
                          width: width * 0.122,
                          height: height * 0.4,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Container(
                        width: width *
                            0.2, // Adjust the width to your desired size
                        height: height *
                            0.4, // Adjust the height to your desired size
                        child: Image.asset(
                          AppAssets.facebook,
                          // 'images/facebook2.png',
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
