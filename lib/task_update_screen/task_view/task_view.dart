import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/comman/app_colors.dart';
import 'package:to_do_list_app/models_db/task_db.dart';
import 'package:to_do_list_app/task_update_screen/task_controller/task_controller.dart';
import 'package:to_do_list_app/widgets/custom_textfiled.dart';

class TaskUpdateScreen extends StatefulWidget {
  @override
  _TaskUpdateScreenState createState() => _TaskUpdateScreenState();
}

class _TaskUpdateScreenState extends State<TaskUpdateScreen> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  final DateFormat timeFormat = DateFormat('HH:mm');
  //  TimeOfDay endTime = TimeOfDay.now();
//date picker code start
  final TextEditingController _dateController = TextEditingController();
  void _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2035),
      // Date picker configuration
    );

    if (selectedDate != null) {
      setState(() {
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }
//date picker code end

  @override
  void initState() {
    super.initState();
    // Set the start time to the current time
    final currentTime = DateTime.now();
    _startTimeController.text = timeFormat.format(currentTime);
  }

//time picker code start
  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      DateTime selectedDateTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        selectedTime.hour,
        selectedTime.minute,
      );

      setState(() {
        _endTimeController.text = timeFormat.format(selectedDateTime);
      });
    }
  }
  //time picker code end

  Future<void> _selectTimes(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        _startTimeController.text = selectedTime.format(context);
      });
    }
  }

  // List of reminder options
  int _selectedRemind = 5;
  List<String> reminderOptions = [
    '5 minutes',
    '10 minutes',
    '15 minutes',
    '30 minutes',
    '1 hour'
  ];
  int _selectedColor = 0;
  // Selected reminder option
  String selectedReminder = '';

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Padding(
          padding: EdgeInsets.only(left: width * 0.1),
          child: Text(
            'Update Task',
            style: GoogleFonts.alatsi(
              fontSize: 30,
              letterSpacing: 3,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(220, 67, 65, 65),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Title',
                style: GoogleFonts.alatsi(
                  fontSize: 20,
                  //letterSpacing: 3,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(220, 67, 65, 65),
                ),
              ),
              SizedBox(height: height * 0.01),
              CustomTextFiled(controller: _titleController),
              SizedBox(height: height * 0.01),
              Text(
                'Note',
                style: GoogleFonts.alatsi(
                  fontSize: 20,
                  //letterSpacing: 3,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(220, 67, 65, 65),
                ),
              ),
              SizedBox(height: height * 0.01),
              CustomTextFiled(controller: _noteController),
              SizedBox(height: height * 0.01),
              Text(
                'Date',
                style: GoogleFonts.alatsi(
                  fontSize: 20,
                  //letterSpacing: 3,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(220, 67, 65, 65),
                ),
              ),
              SizedBox(height: height * 0.01),
              FadeInRight(
                child: Container(
                  height: height * 0.07,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      width: width * 0.007,
                      color: const Color.fromARGB(255, 142, 75, 199),
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.datetime,
                    controller: _dateController,
                    autofocus: false,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: const Icon(
                          Icons.calendar_today,
                          color: AppColors.purple,
                        ),
                      ),
                      border: InputBorder.none,

                      // filled: true,
                      // fillColor: Colors.white,
                      // contentPadding: const EdgeInsets.only(
                      //   left: 14.0,
                      //   bottom: 6.0,
                      //   top: 8.0,
                      // ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  Text(
                    'StartTimer',
                    style: GoogleFonts.alatsi(
                      fontSize: 20,
                      //letterSpacing: 3,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(220, 67, 65, 65),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.2),
                    child: Text(
                      'End Timer',
                      style: GoogleFonts.alatsi(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(220, 67, 65, 65),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          width: width * 0.007,
                          color: const Color.fromARGB(255, 142, 75, 199),
                        ),
                      ),
                      child: TextField(
                        controller: _startTimeController,
                        autofocus: false,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.watch,
                            color: Color.fromARGB(255, 142, 75, 199),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 18,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.04),
                  Expanded(
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          width: width * 0.007,
                          color: const Color.fromARGB(255, 142, 75, 199),
                        ),
                      ),
                      child: TextField(
                        controller: _endTimeController,
                        onChanged: (text) {
                          if (text.isEmpty) {
                            // If text is removed, default to the current time
                            _endTimeController.text =
                                DateFormat.Hm().format(DateTime.now());
                          }
                        },
                        autofocus: false,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _selectTime(
                                  context); // Call the function to show the time picker
                            },
                            child: const Icon(
                              Icons.watch,
                              color: Color.fromARGB(255, 142, 75, 199),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 18,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.04),
              // CustomTextFiled(hintText: "$_selectedRemind minutes early",
              // widget: DropdownButton(items: reminderOptions.map<DropdownMenuItem<String>>((int value)
              // ), onChanged: onChanged)),
              FadeInRight(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: width * 0.007,
                      color: const Color.fromARGB(255, 142, 75, 199),
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ExpansionTile(
                    shape: Border.all(
                      color: AppColors.purple,
                    ),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    iconColor: Colors.black,
                    title: Text(
                      'Reminder',
                      //  _selectedRemind,
                      style: GoogleFonts.alatsi(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(220, 67, 65, 65),
                      ),
                    ),
                    children: reminderOptions.map((option) {
                      return ListTile(
                        title: Text(option),
                        onTap: () {
                          setState(() {
                            selectedReminder = option;
                          });
                          Navigator.pop(context);
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                'Colors',
                style: GoogleFonts.alatsi(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(220, 67, 65, 65),
                ),
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: List<Widget>.generate(
                      3,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedColor = index;
                          });
                        },
                        child: CircleAvatar(
                            backgroundColor: index == 0
                                ? AppColors.greenCircle
                                : index == 1
                                    ? AppColors.blueCircle
                                    : AppColors.pinkleCircle,
                            child: _selectedColor == index
                                ? Icon(Icons.done,
                                    color: Colors
                                        .white) // Wrap IconData with Icon widget
                                : null),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _validate();
                    },
                    child: Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(44),
                        color: const Color.fromARGB(255, 142, 75, 199),
                      ),
                      child: Center(
                          child: Text(
                        'Update Task',
                        style: GoogleFonts.alatsi(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _validate() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      _addTaskToDb();
      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty)
      Get.snackbar('Required', "All fields are required !",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.otherText,
          icon: Icon(
            Icons.warning_rounded,
            color: Colors.red,
          ));
  }

  _addTaskToDb() async {
  int? value=await _taskController.addTask(
      task: TaskDb(
        title: _titleController.text,
        note: _noteController.text,
        startTime: _startTimeController.text,
        endTime: _endTimeController.text,
        isCompleted: 0,
        date: _dateController.text,
        color: _selectedColor,
        reminder: _selectedRemind,
      ),
    );
  }
}
