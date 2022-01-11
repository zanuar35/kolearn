// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/home_page.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: 55.h),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  EasyLoading.show(status: 'Loading...');
                  try {
                    Future.delayed(Duration(milliseconds: 1900), () {
                      // Do something
                      EasyLoading.showSuccess('Login Success!');
                    });

                    Future.delayed(Duration(milliseconds: 900), () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    });
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("salah"),
                      ),
                    );
                  }
                }
              },
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
        ),
      ],
    );
  }
}
