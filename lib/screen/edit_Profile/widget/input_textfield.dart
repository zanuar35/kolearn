import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    required this.hints,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final String hints;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
              hintText: hints,
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Color(0xffDDE5E9),
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Color(0xffDDE5E9),
                  width: 2.0,
                ),
              ),
            ),
          ),
        ));
  }
}
