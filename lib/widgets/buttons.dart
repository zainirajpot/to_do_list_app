import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/comman/app_colors.dart';

class Buttons extends StatelessWidget {
  final String? text;
  final Callback? onPressed;
  const Buttons({super.key, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height * 0.07,
        width: width * 0.788,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: AppColors.purple,
        ),
        child: Center(
            child: Text(
          text!,
          style: GoogleFonts.recursive(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
