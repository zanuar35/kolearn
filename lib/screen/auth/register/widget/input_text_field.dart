import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatefulWidget {
  const InputField({
    required this.icons,
    required this.hint,
    required this.controller,
    required this.isEmail,
    Key? key,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final IconData icons;
  final bool isEmail;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60.h,
      child: TextFormField(
        autocorrect: false,
        enableSuggestions: false,
        style: TextStyle(fontSize: 16.sp),
        controller: widget.controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.w,
          ),
          hintText: widget.hint,
          prefixIcon: Icon(widget.icons),
          hintStyle: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 12.sp, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Color(0xffDDE5E9),
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1.w,
                color: Colors.red,
              )),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              width: 1.w,
              color: Colors.red,
            ),
          ),
        ),
        validator: widget.isEmail == true
            ? (value) {
                if (value!.isEmpty) {
                  return 'Please enter email';
                }
                if (RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) return null;
                return 'Please enter a valid email';
              }
            : (value) {
                if (value!.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
      ),
    );
  }
}
