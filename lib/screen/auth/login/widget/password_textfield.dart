// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    required this.icons,
    required this.controller,
    required this.obstext,
    required this.hint,
    Key? key,
  }) : super(key: key);

  final String hint;
  final bool obstext;
  final IconData icons;
  final TextEditingController controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: 354.w,
      child: TextFormField(
        style: TextStyle(fontSize: 16.sp),
        controller: widget.controller,
        obscureText: widget.obstext,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 14.sp, color: Colors.grey),
          suffixIcon: Icon(widget.icons),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Color(0xffDDE5E9),
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Color(0xffDDE5E9),
              width: 2.0,
            ),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter password';
          }
          return null;
        },
      ),
    );
  }
}
