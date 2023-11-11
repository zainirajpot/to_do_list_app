import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/comman/app_assets.dart';
import 'package:to_do_list_app/task_update_screen/task_view/task_view.dart';
import 'package:to_do_list_app/widgets/buttons.dart';
import 'package:to_do_list_app/widgets/custom_textfiled.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DateTime selectedDate = DateTime.now();
  TextEditingController _nameController = TextEditingController();

  String userName = 'Your Name';
  String selectedImagePath = '';
  List<String> listOfImages = [
    AppAssets.men,
    AppAssets.g1,
    AppAssets.g2,
    AppAssets.g3
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leadingWidth: width,
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            selectedImagePath.isEmpty
                ? Container(
                    height: height * 0.09,
                    width: width * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/p5.png'))),
                  )
                : Container(
                    height: height * 0.09,
                    width: width * 0.2,
                    child: Image.asset(selectedImagePath, fit: BoxFit.contain),
                  ),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  Text(
                    'Hello,',
                    style: GoogleFonts.alatsi(
                      fontSize:23,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(220, 67, 65, 65),
                    ),
                  ),
                  Text(
                    userName,
                    style: GoogleFonts.alatsi(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(220, 67, 65, 65),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              _showSettingsBottomSheet(context);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Buttons(
          //   text: '+ Add Task',
          //   onPressed:() {
          //         Get.to(TaskUpdateScreen());
          //       },
          //   // style: GoogleFonts.alatsi(
          //   //   fontSize: 17,
          //   //   fontWeight: FontWeight.w400,
          //   //   color: Colors.white,
          //   // ),
          // ),
          // Row(
          //   children: [

          GestureDetector(
            onTap: () {
              Get.to(TaskUpdateScreen());
            },
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.55),
              child: Container(
                height: 50,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(44),
                  color: const Color.fromARGB(255, 142, 75, 199),
                ),
                child: Center(
                    child: Text(
                  '+ Add Task',
                  style: GoogleFonts.alatsi(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                )),
              ),
            ),
          ),

          _mainExample(),
          const SizedBox(
            height: 32.0,
          ),
        ],
      ),
    );
  }

  EasyDateTimeLine _mainExample() {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
    );
  }

  void _showSettingsBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: 400,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listOfImages.length,
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedImagePath = listOfImages[index];
                          });
                        },
                        child: Image.asset(listOfImages[index],
                            height: 100, width: 100)),
                  ),
                ),
                const SizedBox(height: 40),
                CustomTextFiled(
                    prefixIcon: Icons.person, controller: _nameController),
                const SizedBox(height: 20),
                Buttons(
                  text: 'Update Profile',
                  onPressed: () {
                    // Get the new name from the text field
                    String newName = _nameController.text;
                    // Update the userName variable
                    setState(() {
                      userName = newName;
                    });
                    // Close the bottom sheet
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 20),
                const Buttons(text: 'LogOut'),
              ],
            ),
          ),
        );
      },
    );
  }
}
