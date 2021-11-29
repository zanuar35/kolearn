// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/screen/home/home_screen.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          try {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Validasi"),
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("salah"),
              ),
            );
          }
        }
      },
      child: Container(
        height: 55.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: Color(0xff52C3FF)),
        child: Center(
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 18.sp,
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
