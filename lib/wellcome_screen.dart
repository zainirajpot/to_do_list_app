import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WellComeScreen extends StatelessWidget {
  const WellComeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.06),
            Image.asset('images/login.png'),
            SizedBox(height: height * 0.01),
            Text(
              'Hello',
              style: GoogleFonts.alatsi(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(220, 67, 65, 65),
              ),
            ),
            SizedBox(height: height * 0.02),
            Text(
              'Wellcome to the best task\n manager babay',
              style: GoogleFonts.recursive(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(220, 67, 65, 65),
              ),
            ),
            SizedBox(height: height * 0.02),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: height * 0.07,
                width: width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  // border: Border.all(width: width*0.02,color: Colors.grey),
                  color: Color.fromARGB(255, 142, 75, 199),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: GoogleFonts.recursive(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
          
                color:Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: height * 0.07,
                width: width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
              
                  color: Color.fromARGB(255, 142, 75, 199),
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.recursive(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                 
                color:Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: height * 0.07,
                width: width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: width * 0.007,
                    color: Color.fromARGB(255, 142, 75, 199),
                  ),
                 
                ),
                child: Center(
                  child: Text(
                    'Register later',
                    style: GoogleFonts.recursive(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 142, 75, 199),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
