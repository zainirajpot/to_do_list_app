import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/comman/app_assets.dart';
import 'package:to_do_list_app/comman/app_colors.dart';
import 'package:to_do_list_app/comman/app_content.dart';
import 'package:to_do_list_app/home_page/home_controller/home_binding/hom_binding.dart';
import 'package:to_do_list_app/home_page/view/home_view.dart';
import 'package:to_do_list_app/login/login_controller/login_controller.dart';
import 'package:to_do_list_app/sign_up/sign_up_binding/sign_up_binding.dart';
import 'package:to_do_list_app/sign_up/sign_up_view/signup_view.dart';
import 'package:to_do_list_app/widgets/custom_textfiled.dart';

class LoginView extends GetView<LoginViewController> {
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
                //  SizedBox(height: height * 0.07),
                FadeInDown(
                  child: Text(
                    'WelCome!',
                    style: GoogleFonts.alatsi(
                        fontSize: 30,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w600,
                        color: AppColors.indicatorText),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  AppContent.toContinue,
                  style: GoogleFonts.recursive(
                      letterSpacing: 3,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.indicatorText),
                ),
                SizedBox(height: height * 0.05),
                CustomTextFiled(
                  hintText: AppContent.email,
                  prefixIcon: Icons.email,
                  controller: controller.emailController.value,
                ),

                SizedBox(height: height * 0.03),
                CustomTextFiled(
                  hintText: AppContent.password,
                  prefixIcon: Icons.password,
                  controller: controller.passwordController.value,
                ),

                SizedBox(height: height * 0.05),
                GestureDetector(
                  onTap: () async {
                    // Call the validation method from the controller
                    bool success = await controller.validateAndLogin();

                    if (success) {
                      bool isMatch = await controller.checkEmailAndPassword(
                        controller.emailController.value.text,
                        controller.passwordController.value.text,
                      );

                      if (isMatch) {
                        Get.snackbar(
                          'Success',
                          'Successfully logged in',
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                          snackPosition:
                              SnackPosition.TOP, // Display at the top
                          duration: Duration(seconds: 3),
                        );

                        // Navigate to the home page
                        Get.to(HomeView(), binding: HomeBinding());
                      } else {
                        Get.snackbar(
                          'Error',
                          'Email or password is incorrect',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          snackPosition:
                              SnackPosition.TOP, // Display at the top
                          duration: Duration(seconds: 3),
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
                        AppContent.login,
                        style: GoogleFonts.recursive(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
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
                        AppContent.dontAccount,
                        style: GoogleFonts.recursive(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.indicatorText),
                      ),
                      SizedBox(width: width * 0.01),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => SignUpView(),
                            binding:
                                SignUpBinding(), // Replace SignUpBinding with your actual binding class.
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: GoogleFonts.recursive(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.purple),
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
                        color: Colors.grey,
                      ),
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
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.255),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          //   _handleSignIn();
                        },
                        child: Image.asset(
                          AppAssets.google,
                          width: width * 0.122,
                          height: height * 0.4,
                        ),
                      ),
                      SizedBox(width: width * 0.04),
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

  // Future<bool> checkIfEmailExists(String email) async {
  //   try {
  //     final FirebaseAuth _auth = FirebaseAuth.instance;
  //     UserCredential? userCredential =
  //         await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: 'temporary_password', // Provide a temporary password
  //     );
  //     // If the email already exists, Firebase will throw an error
  //     // indicating that the email address is already in use.
  //     return false;
  //   } catch (e) {
  //     // If an error is thrown, that means the email already exists.
  //     return true;
  //   }
  // }
}

  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // Future<void> _handleSignIn() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser!.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     await _auth.signInWithCredential(credential);

  //     // Successfully signed in with Google account, navigate to the home page.
  //     Get.to(TaskUpdateScreen());
  //   } catch (error) {
  //     print(error);
  //     // Handle sign-in error here.
  //   }
  // }


