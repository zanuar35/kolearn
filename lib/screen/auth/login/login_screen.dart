// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/screen/auth/register/register_screen.dart';

import 'widget/build_textfield.dart';
import 'widget/login_btn.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Container(
        color: Color(0xffF4F7FF),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 90.h),
              width: 354.w,
              height: 227.h,
              child: Image.network(
                  "https://i.ibb.co/Xzh8GdT/undraw-Login-re-4vu2-1.png"),
            ),
            SizedBox(
              height: 50.h,
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
              height: 65.h,
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
                      icons: Icons.email_rounded,
                      hint: "coba",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    BuildTextField(
                      controller: _passwordController,
                      obstext: true,
                      icons: Icons.remove_red_eye_rounded,
                      isEmail: false,
                      hint: "Password",
                    ),
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
                    Container(
                      height: 55.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0xffDDE5E9),
                            width: 2.0,
                          )),
                      child: Center(
                        child: Text(
                          "Google",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff404040),
                          ),
                        ),
                      ),
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
                                        )
                                    //     FadeTransition(
                                    //   opacity: animation,
                                    //   child: child,
                                    // ),
                                    ),
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
