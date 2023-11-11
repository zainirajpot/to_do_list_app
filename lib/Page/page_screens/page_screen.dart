import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PageScreens extends StatelessWidget {
  final String? imagePath;
   // final int pageIndex; 
  final String? title;
  final String? description;
  final String? buttonLabel;
  final VoidCallback? onButtonPressed;
  final Widget? nextScreen;

  const PageScreens({
    Key? key,
    this.imagePath,
    this.title,
    this.description,
    this.buttonLabel, 
    this.onButtonPressed,
    this.nextScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: height * 0.06),

          if (buttonLabel != null) 
          Padding(
            padding: EdgeInsets.only(left: height * 0.33),
            child: GestureDetector(
              onTap: onButtonPressed,
              child: Container(
                height: height * 0.055,
                width: width * 0.267,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 142, 75, 199),
                ),
                child: Center(
                  child: Text(
                    buttonLabel!,
                    style: GoogleFonts.recursive(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Image.asset(imagePath!),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                title!,
                style: GoogleFonts.alatsi(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(220, 67, 65, 65),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                description!,
                style: GoogleFonts.recursive(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(220, 67, 65, 65),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
