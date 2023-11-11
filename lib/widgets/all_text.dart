import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/comman/app_colors.dart';

class PageScreenText extends StatefulWidget {
  final String title;
  final bool size;
  final bool fontWeight;
  final bool color;
  const PageScreenText({
    super.key,
   required this.title,
    this.size = false,
    this.fontWeight = false,
    this.color = false,
  });

  @override
  State<PageScreenText> createState() => _PageScreenTextState();
}

class _PageScreenTextState extends State<PageScreenText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title ,
      style: GoogleFonts.alatsi(
          fontSize: widget.size ? 18 : 30,
          fontWeight: widget.fontWeight ? FontWeight.w400 : FontWeight.w600,
          color: AppColors.indicatorText),
    );
  }
}
