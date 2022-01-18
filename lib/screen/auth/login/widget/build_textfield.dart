// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField({
    required this.isEmail,
    required this.controller,
    required this.obstext,
    required this.hint,
    Key? key,
  }) : super(key: key);

  final String hint;
  final bool obstext;
  final bool isEmail;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: 354.w,
      child: TextFormField(
        style: TextStyle(fontSize: 16.sp),
        controller: controller,
        obscureText: obstext,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(Icons.email_rounded),
          hintStyle: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 14.sp, color: Colors.grey),
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
        validator: (isEmail == true)
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
