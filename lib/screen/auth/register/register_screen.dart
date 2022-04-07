// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/register/cubit/register_cubit.dart';
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
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _emailController = TextEditingController();
    final _passController = TextEditingController();
    final _confirmPassController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF6F9FF),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Container(
          color: Color(0xffF6F9FF),
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: ListView(
            children: <Widget>[
              Text("Buat akun Kolearn  ",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                  )),
              Text("Create account to learn obout hangeul",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  )),
              Center(
                child: Container(
                  height: 250.h,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: 29.h,
                  ),
                  child: Hero(
                    tag: 'gambar',
                    child: Image(
                      image: NetworkImage(
                          "https://firebasestorage.googleapis.com/v0/b/firestore-example-43d61.appspot.com/o/undraw-Access-account-re-8spm-1.png?alt=media&token=6fcabfd2-4347-4f94-9d2e-9bc6608ce137"),
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
                        duration: Duration(milliseconds: 1500));
                    EasyLoading.dismiss();
                    Timer(Duration(seconds: 2), () {
                      Navigator.pop(context);
                    });
                  }
                  if (state is RegisterFailed) {
                    EasyLoading.showError(state.message,
                        maskType: EasyLoadingMaskType.black,
                        duration: Duration(milliseconds: 1500));
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
              LoginBtn(),
              SizedBox(
                height: 15.h,
              ),
            ],
          )),
    );
  }
}
