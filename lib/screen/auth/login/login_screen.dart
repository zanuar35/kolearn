// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/login/cubit/login_cubit.dart';
import 'package:kolearn/core/app_images.dart';
import 'package:kolearn/core/app_text_styles.dart';
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

  // Dispose controller
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // declare texteditingcontroller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Build UI
  @override
  Widget build(BuildContext context) {
    print("build screen");
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
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
                      child: Hero(tag: 'gambar', child: AppImage.loginImage)),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("KoLearn", style: AppTextStyles.heading24),
                          Text("Login to improve your korean",
                              style: AppTextStyles.body16),
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
                                Timer(const Duration(milliseconds: 150), () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()),
                                      (route) => false);
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
                                    duration:
                                        const Duration(milliseconds: 1500));
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
          ),
        ),
      ),
    );
  }
}
