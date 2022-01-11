// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/screen/auth/login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Text("Create Kolearn  ",
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
                    margin: EdgeInsets.only(
                      top: 29.h,
                    ),
                    child: Hero(
                      tag: 'gambar',
                      child: Image(
                        image: NetworkImage(
                            "https://i.ibb.co/ypnVV2m/undraw-Access-account-re-8spm-1.png"),
                      ),
                    )),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    _InputField(
                      hint: "Full Name",
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    _InputField(
                      hint: "Email",
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    _InputField(
                      hint: "Password",
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    _InputField(
                      hint: "Confirm Password",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 55.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  primary: Color(0xff52C3FF),
                ),
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "have an account ?",
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Login Now",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xff239BD8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ]),
              SizedBox(
                height: 15.h,
              ),
            ],
          )),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.hint,
    Key? key,
  }) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      child: TextFormField(
          decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 18.w,
        ),
        hintText: hint,
        hintStyle: TextStyle(
            fontWeight: FontWeight.w400, fontSize: 12.sp, color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Color(0xffDDE5E9),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Color(0xffDDE5E9),
            width: 2.0,
          ),
        ),
      )),
    );
  }
}
