// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterButton extends StatefulWidget {
  const RegisterButton({
    
    Key? key,
    required GlobalKey<FormState> formKey1,
  })  : _formKey1 = formKey1,
        super(key: key);

  final GlobalKey<FormState> _formKey1;
  

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (widget._formKey1.currentState!.validate()) {
         
        }
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 55.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        // primary: const Color(0xff52C3FF),
      ),
      child: Text(
        "Register",
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
