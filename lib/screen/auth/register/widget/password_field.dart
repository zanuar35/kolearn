// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class PassTextField extends StatefulWidget {
  const PassTextField({
    required this.hint,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;

  @override
  State<PassTextField> createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60.h,
      child: TextFormField(
        style: TextStyle(fontSize: 16.sp),
        obscureText: isObscure,
        controller: widget.controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 18.w,
            ),
            hintText: widget.hint,
            prefixIcon: const Icon(Icons.lock),
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.blue,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Color(0xffDDE5E9),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Color(0xffDDE5E9),
                width: 2.0,
              ),
            ),
            suffixIcon: (isObscure == true)
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(Icons.visibility),
                  )
                : IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(Icons.visibility_off),
                  )),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Ketikkan password';
          }
          return null;
        },
      ),
    );
  }
}
