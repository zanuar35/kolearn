// ignore_for_file: sized_box_for_whitespace
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/register/cubit/register_cubit.dart';
import 'package:kolearn/core/app_images.dart';
import 'package:kolearn/core/app_text_styles.dart';
import 'package:kolearn/screen/auth/register/widget/login_btn.dart';
import 'package:kolearn/screen/auth/register/widget/password_field.dart';
import 'package:kolearn/screen/auth/register/widget/register_btn.dart';

import 'widget/input_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  // declare texteditingcontroller
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  // Build UI
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffF6F9FF),
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: Container(
            color: const Color(0xffF6F9FF),
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: ListView(
              children: <Widget>[
                Text("Buat akun Kolearn  ", style: AppTextStyles.heading24),
                Text("Create account to learn hangeul",
                    style: AppTextStyles.body16Bold),
                Center(
                  child: Container(
                    height: 250.h,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      top: 29.h,
                    ),
                    child: const Hero(
                      tag: 'gambar',
                      child: Image(
                        image: NetworkImage(AppImage.registerImage),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Form(
                  key: _formKey1,
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        InputField(
                          controller: _nameController,
                          hint: "Full Name",
                          icons: Icons.person,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          controller: _emailController,
                          hint: "Email",
                          icons: Icons.mark_email_read,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        PassTextField(
                          hint: "Password",
                          controller: _passController,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        PassTextField(
                          hint: "Konfirmasi Password",
                          controller: _confirmPassController,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocListener<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterLoading) {
                      EasyLoading.show(
                        status: 'loading...',
                        maskType: EasyLoadingMaskType.black,
                      );
                    }
                    if (state is RegisterSuccess) {
                      EasyLoading.showSuccess('Daftar berhasil!',
                          maskType: EasyLoadingMaskType.black,
                          duration: const Duration(milliseconds: 1500));
                      EasyLoading.dismiss();
                      Timer(const Duration(seconds: 2), () {
                        Navigator.pop(context);
                      });
                    }
                    if (state is RegisterFailed) {
                      EasyLoading.showError(state.message,
                          maskType: EasyLoadingMaskType.black,
                          duration: const Duration(milliseconds: 1500));
                    }
                  },
                  child: Container(),
                ),
                RegisterButton(
                  formKey1: _formKey1,
                  nameController: _nameController,
                  emailController: _emailController,
                  passController: _passController,
                  confirmPassController: _confirmPassController,
                ),
                SizedBox(
                  height: 15.h,
                ),
                const LoginBtn(),
                SizedBox(
                  height: 15.h,
                ),
              ],
            )),
      ),
    );
  }
}
