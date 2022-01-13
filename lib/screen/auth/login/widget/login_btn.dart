// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
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
                login(_formKey, context);
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

Future<void> login(GlobalKey<FormState> formKey, BuildContext context) async {
  if (formKey.currentState!.validate()) {
    EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );
    var response = await http.post(
      Uri.parse("https://reqres.in/api/login"),
      body: ({
        'email': 'eve.holt@reqres.in',
        'password': 'cityslicka',
      }),
    );

    if (response.statusCode == 200) {
      EasyLoading.showSuccess('Login Success');
      Timer(Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      });
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
