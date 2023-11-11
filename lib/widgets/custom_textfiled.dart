import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFiled extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final IconData? prefixIcon;
  final bool isPassword;
  final Function(DateTime)? onDateSelected; // Callback for date selection

  CustomTextFiled({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.onDateSelected, this.controller,
  }) : super(key: key);

  @override
  _CustomTextFiledState createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _textController.text = ''; // Initialize the text to an empty string
  }

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;

    return Column(
      children: [
        FadeInRight(
          child: Container(
            height: height * 0.07,
            width: width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                width: width * 0.007,
                color: Color.fromARGB(255, 142, 75, 199),
              ),
            ),
            child: TextFormField(
              controller:widget.controller,
              obscureText: widget.isPassword,
              decoration: InputDecoration(
                hintText: widget.hintText,
                prefixIcon: Icon(widget.prefixIcon),
                suffixIcon: widget.onDateSelected != null
                    ? InkWell(
                        onTap: () async {
                          if (widget.hintText == "Date" &&
                              widget.onDateSelected != null) {
                            final picked = await _showDatePicker(context);
                            if (picked != null) {
                              _textController.text =
                                  picked.toLocal().toString();
                              widget.onDateSelected!(picked);
                            }
                          }
                        },
                        child: Icon(Icons.calendar_today),
                      )
                    : null,
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
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<DateTime?> _showDatePicker(BuildContext context) async {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
  }

  @override
  void dispose() {
    _textController.dispose(); // Dispose the text controller
    super.dispose();
  }
}
