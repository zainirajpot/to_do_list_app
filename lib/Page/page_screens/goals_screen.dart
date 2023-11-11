import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/Page/page_screens/begin_screen.dart';
import 'package:to_do_list_app/comman/app_assets.dart';
import 'package:to_do_list_app/comman/app_content.dart';
import 'package:to_do_list_app/widgets/buttons.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

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
                AppAssets.goalsImage,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                AppContent.goals,
                style: GoogleFonts.alatsi(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(220, 67, 65, 65),
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                AppContent.track,
                style: GoogleFonts.recursive(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(220, 67, 65, 65),
                ),
              ),
              SizedBox(height: height * 0.07),
              Buttons(
                text: 'Begin',
                onPressed: () {
                  Get.to(BeginScreen());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
