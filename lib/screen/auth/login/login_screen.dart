// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/screen/auth/login/widget/password_textfield.dart';

import 'package:kolearn/screen/auth/register/register_screen.dart';

import '../../ubahPassword/ubah_password.dart';
import 'widget/build_textfield.dart';
import 'widget/login_btn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("build screen");
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Container(
        color: Color(0xffF4F7FF),
        child: ListView(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 85.h),
                width: 354.w,
                height: 227.h,
                child: Hero(
                  tag: 'gambar',
                  child: Image.network(
                      "https://i.ibb.co/Xzh8GdT/undraw-Login-re-4vu2-1.png"),
                )),
            SizedBox(
              height: 40.h,
            ),
            Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "KoLearn",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Login to improve your korean",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 60.h,
            ),
            Form(
              key: _formKey,
              child: Container(
                child: Column(
                  children: <Widget>[
                    BuildTextField(
                      controller: _emailController,
                      obstext: false,
                      isEmail: true,
                      hint: "Email",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    PassField(),
                    SizedBox(
                      height: 29.h,
                    ),
                    LoginBtn(formKey: _formKey),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 0.2,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Or login with",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 0.2,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don’t have an account ?",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        RegisterScreen(),
                                    transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) =>
                                        Align(
                                          child: SizeTransition(
                                            sizeFactor: animation,
                                            child: child,
                                          ),
                                        )),
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Color(0xff239BD8),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ])
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    )));
  }
}



/*

 suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),


*/