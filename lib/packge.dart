import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeInputScreen extends StatefulWidget {
  @override
  _TimeInputScreenState createState() => _TimeInputScreenState();
}

class _TimeInputScreenState extends State<TimeInputScreen> {
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final DateFormat timeFormat = DateFormat('HH:mm');

  @override
  void initState() {
    super.initState();
    // Set the start time to the current time
    final currentTime = DateTime.now();
    startTimeController.text = timeFormat.format(currentTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Input Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Start Time:'),
            TextField(
              controller: startTimeController,
              decoration: InputDecoration(
                hintText: 'Current Time',
              ),
              readOnly: true,
            ),
            SizedBox(height: 16),
            Text('End Time:'),
            TextField(
              controller: endTimeController,
              decoration: InputDecoration(
                hintText: 'Enter end time (HH:mm)',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String startTime = startTimeController.text;
                String endTime = endTimeController.text;

                print('Start Time: $startTime');
                print('End Time: $endTime');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:easy_date_timeline/easy_date_timeline.dart';
// import 'package:flutter/material.dart';
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(title),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _mainExample(),
//             const SizedBox(
//               height: 32.0,
//             ),
//             // _customBackgroundExample(),
//             // const SizedBox(
//             //   height: 32.0,
//             // ),
//             // _changeTodyHighlightColorExample(),
//             // const SizedBox(
//             //   height: 32.0,
//             // ),
//             // _changeDayStructureExample(),
//             // const SizedBox(
//             //   height: 32.0,
//             // ),
//             // _landscapeViewExample(),
//             // const SizedBox(
//             //   height: 32.0,
//             // ),
//             // _localeExample(),
//             // const SizedBox(
//             //   height: 32.0,
//             // ),
//             // _changeHeaderAppearanceExample(),
//             // const SizedBox(
//             //   height: 32.0,
//             // ),
//             // _customizeDayAppearanceExample(),
//             // const SizedBox(
//             //   height: 32.0,
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   EasyDateTimeLine _mainExample() {
//     return EasyDateTimeLine(
//       initialDate: DateTime.now(),
//       onDateChange: (selectedDate) {
//         //`selectedDate` the new date selected.
//       },
//     );
//   }

//   EasyDateTimeLine _customBackgroundExample() {
//     return EasyDateTimeLine(
//       initialDate: DateTime.now(),
//       onDateChange: (selectedDate) {
//         //`selectedDate` the new date selected.
//       },
//       headerProps: const EasyHeaderProps(
//         monthPickerType: MonthPickerType.switcher,
//         selectedDateFormat: SelectedDateFormat.fullDateDMY,
//       ),
//       dayProps: const EasyDayProps(
//         dayStructure: DayStructure.dayStrDayNum,
//         activeDayStyle: DayStyle(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(8)),
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color(0xff3371FF),
//                 Color(0xff8426D6),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   EasyDateTimeLine _changeTodyHighlightColorExample() {
//     return EasyDateTimeLine(
//       initialDate: DateTime.now(),
//       onDateChange: (selectedDate) {
//         //`selectedDate` the new date selected.
//       },
//       activeColor: const Color(0xff85A389),
//       dayProps: const EasyDayProps(
//         todayHighlightStyle: TodayHighlightStyle.withBackground,
//         todayHighlightColor: Color(0xffE1ECC8),
//       ),
//     );
//   }

//   EasyDateTimeLine _changeDayStructureExample() {
//     return EasyDateTimeLine(
//       initialDate: DateTime.now(),
//       onDateChange: (selectedDate) {
//         //`selectedDate` the new date selected.
//       },
//       activeColor: const Color(0xffFFBF9B),
//       headerProps: const EasyHeaderProps(
//         selectedDateFormat: SelectedDateFormat.monthOnly,
//       ),
//       dayProps: const EasyDayProps(
//         height: 56.0,
//         width: 56.0,
//         dayStructure: DayStructure.dayNumDayStr,
//         inactiveDayStyle: DayStyle(
//           borderRadius: 48.0,
//           dayNumStyle: TextStyle(
//             fontSize: 18.0,
//           ),
//         ),
//         activeDayStyle: DayStyle(
//           dayNumStyle: TextStyle(
//             fontSize: 18.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }

//   EasyDateTimeLine _localeExample() {
//     return EasyDateTimeLine(
//       initialDate: DateTime.now(),
//       onDateChange: (selectedDate) {
//         //`selectedDate` the new date selected.
//       },
//       activeColor: const Color(0xffB04759),
//       locale: "ar",
//     );
//   }

//   EasyDateTimeLine _landscapeViewExample() {
//     return EasyDateTimeLine(
//       initialDate: DateTime.now(),
//       onDateChange: (selectedDate) {
//         //`selectedDate` the new date selected.
//       },
//       activeColor: const Color(0xff116A7B),
//       dayProps: const EasyDayProps(
//         landScapeMode: true,
//         activeDayStyle: DayStyle(
//           borderRadius: 48.0,
//         ),
//         dayStructure: DayStructure.dayStrDayNum,
//       ),
//       headerProps: const EasyHeaderProps(
//         selectedDateFormat: SelectedDateFormat.fullDateDMonthAsStrY,
//       ),
//     );
//   }

//   EasyDateTimeLine _changeHeaderAppearanceExample() {
//     return EasyDateTimeLine(
//       initialDate: DateTime.now(),
//       onDateChange: (selectedDate) {
//         //`selectedDate` the new date selected.
//       },
//       activeColor: const Color(0xff37306B),
//       headerProps: const EasyHeaderProps(
//         monthPickerType: MonthPickerType.switcher,
//         selectedDateFormat: SelectedDateFormat.fullDateDayAsStrMY,
//       ),
//       dayProps: const EasyDayProps(
//         activeDayStyle: DayStyle(
//           borderRadius: 32.0,
//         ),
//         inactiveDayStyle: DayStyle(
//           borderRadius: 32.0,
//         ),
//       ),
//       timeLineProps: const EasyTimeLineProps(
//         hPadding: 16.0, // padding from left and right
//         separatorPadding: 16.0, // padding between days
//       ),
//     );
//   }

//   EasyDateTimeLine _customizeDayAppearanceExample() {
//     return EasyDateTimeLine(
//       initialDate: DateTime.now(),
//       onDateChange: (selectedDate) {
//         //`selectedDate` the new date selected.
//       },
//       dayProps: const EasyDayProps(
//         height: 56.0,
//         // You must specify the width in this case.
//         width: 124.0,
//       ),
//       headerProps: const EasyHeaderProps(
//         selectedDateFormat: SelectedDateFormat.fullDateMonthAsStrDY,
//       ),
//       itemBuilder: (BuildContext context, String dayNumber, dayName, monthName,
//           fullDate, isSelected) {
//         return Container(
//           //the same width that provided previously.
//           width: 124.0,
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           decoration: BoxDecoration(
//             color: isSelected ? const Color(0xffFF6D60) : null,
//             borderRadius: BorderRadius.circular(16.0),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 monthName,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: isSelected ? Colors.white : const Color(0xff6D5D6E),
//                 ),
//               ),
//               const SizedBox(
//                 width: 8.0,
//               ),
//               Text(
//                 dayNumber,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: isSelected ? Colors.white : const Color(0xff393646),
//                 ),
//               ),
//               const SizedBox(
//                 width: 8.0,
//               ),
//               Text(
//                 dayName,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: isSelected ? Colors.white : const Color(0xff6D5D6E),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }