// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/login/cubit/login_cubit.dart';
import 'package:kolearn/home_page.dart';
import 'package:kolearn/screen/auth/login/widget/password_textfield.dart';
import 'package:kolearn/screen/auth/login/widget/sign_up_btn.dart';
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
        color: const Color(0xffF4F7FF),
        child: ListView(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 85.h),
                width: 354.w,
                height: 227.h,
                child: Hero(
                  tag: 'gambar',
                  child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/firestore-example-43d61.appspot.com/o/undraw-Login-re-4vu2-1.png?alt=media&token=7c6d5b05-1433-4b9a-be3c-8e8036808e5c"),
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
                    PassField(
                      controller: _passwordController,
                    ),
                    SizedBox(
                      height: 29.h,
                    ),
                    BlocListener<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginLoading) {
                          EasyLoading.show(
                            status: 'loading...',
                            maskType: EasyLoadingMaskType.black,
                          );
                        }
                        if (state is LoginSuccess) {
                          EasyLoading.dismiss();
                          Timer(const Duration(seconds: 1), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          });
                        }
                      },
                      child: Container(),
                    ),
                    BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginFailed) {
                          EasyLoading.dismiss();
                          EasyLoading.showError(state.message,
                              maskType: EasyLoadingMaskType.black,
                              duration: const Duration(milliseconds: 1500));
                        }
                      },
                      builder: (context, state) {
                        return Container();
                      },
                    ),
                    LoginButton(
                        formKey: _formKey,
                        emailController: _emailController,
                        passwordController: _passwordController),
                    SizedBox(
                      height: 32.h,
                    ),
                    const SignUpButton()
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
