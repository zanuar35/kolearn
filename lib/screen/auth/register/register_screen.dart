// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final _passController = TextEditingController();

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
                          "https://i.ibb.co/ypnVV2m/undraw-Access-account-re-8spm-1.png"),
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
                        hint: "Full Name",
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      InputField(
                        hint: "Email",
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      PassTextField(),
                      SizedBox(
                        height: 15.h,
                      ),
                      InputField(
                        hint: "Confirm Password",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              RegisterButton(formKey1: _formKey1),
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
