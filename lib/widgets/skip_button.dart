import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SkipButton extends  StatelessWidget {
   final VoidCallback? onButtonPressed;
   final String? buttonLabel;
  const SkipButton({super.key, this.onButtonPressed, this.buttonLabel});

  @override
  Widget build(BuildContext context) {
     var height = Get.height;
    var width = Get.width;
    return 
    //if (buttonLabel != null)
            Padding(
              padding: EdgeInsets.only(left: height * 0.33),
              child: GestureDetector(
                onTap: onButtonPressed,
                child: Container(
                  height: height * 0.06,
                  width: width * 0.227,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 142, 75, 199),
                  ),
                  child: Center(
                    child: Text(
                      'skip',
                     // buttonLabel!,
                      style: GoogleFonts.recursive(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            );
  }
}
