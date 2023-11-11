import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/comman/app_assets.dart';
import 'package:to_do_list_app/comman/app_content.dart';
import 'package:to_do_list_app/login/login_controller/login_binding/login_binding.dart';
import 'package:to_do_list_app/login/login_view/login_view.dart';
import 'package:to_do_list_app/sign_up/sign_up_binding/sign_up_binding.dart';
import 'package:to_do_list_app/sign_up/sign_up_view/signup_view.dart';
import 'package:to_do_list_app/widgets/buttons.dart';

// class PageScreensScnd extends StatefulWidget {
//   final bool imagePath;
//   final bool title;
//   final bool description;
//   final bool buttonLabel;
//   final VoidCallback onButtonPressed;

//   const PageScreensScnd({
//     Key? key,
//    this.imagePath=false,
//    this.title=false,
//     this.description=false,
//      this.buttonLabel=false,
//      required this.onButtonPressed,
//   }) : super(key: key);

//   @override
//   State<PageScreensScnd> createState() => _PageScreensScndState();
// }

// class _PageScreensScndState extends State<PageScreensScnd> {
//   @override
//   Widget build(BuildContext context) {
//     var height = Get.height;
//     var width = Get.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           SizedBox(height: height * 0.06),
//           Column(
//             children: [
//               Image.asset(
//                 widget.imagePath ?  AppAssets.begin: AppAssets.goalsImage,
//               ),
//               SizedBox(
//                 height: height * 0.02,
//               ),
//               Text(
//                 widget.title ? AppContent.hello: AppContent.goals ,
//                 style: GoogleFonts.alatsi(
//                   fontSize: 30,
//                   fontWeight: FontWeight.w600,
//                   color: const Color.fromARGB(220, 67, 65, 65),
//                 ),
//               ),
//               SizedBox(height: height * 0.02),
//               Text(
//                 widget.description ? AppContent.baby:AppContent.track,
//                 style: GoogleFonts.recursive(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w400,
//                   color: const Color.fromARGB(220, 67, 65, 65),
//                 ),
//               ),
//               SizedBox(height: height * 0.07),
//               Buttons(
//                 text: widget.buttonLabel ? AppContent.login : AppContent.begin,
//                 onPressed: widget.onButtonPressed,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CustomScreen(
//         imagePath: AppAssets.goalsImage,
//         title: AppContent.goals,
//         description: AppContent.track,
//         buttonLabel: 'Begin',
//         onButtonPressed: () {
//           Get.to(LoginView(), binding: LoginBinding());
//         },
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:to_do_list_app/comman/app_assets.dart';
// import 'package:to_do_list_app/comman/app_content.dart';
// import 'package:to_do_list_app/login/login_controller/login_binding/login_binding.dart';
// import 'package:to_do_list_app/login/login_view/login_view.dart';
// import 'package:to_do_list_app/sign_up/sign_up_binding/sign_up_binding.dart';
// import 'package:to_do_list_app/sign_up/sign_up_view/signup_view.dart';
// import 'package:to_do_list_app/widgets/buttons.dart';

class BeginScreen extends StatelessWidget {
  const BeginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: height * 0.06),
          Column(
            children: [
              Image.asset(
                AppAssets.begin,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                AppContent.hello,
                style: GoogleFonts.alatsi(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(220, 67, 65, 65),
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                AppContent.baby,
                style: GoogleFonts.recursive(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(220, 67, 65, 65),
                ),
              ),
              SizedBox(height: height * 0.07),
              Buttons(
                text: AppContent.login,
                onPressed: () {
                  Get.to(LoginView(), binding: LoginBinding());
                },
              ),
              SizedBox(height: height * 0.04),
              Buttons(
                text: AppContent.sign,
                onPressed: () {
                  Get.to(SignUpView(), binding: SignUpBinding());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
