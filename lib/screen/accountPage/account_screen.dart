// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/screen/auth/login/login_screen.dart';
import 'package:kolearn/screen/coba.dart';
import 'package:kolearn/screen/edit_Profile/edit_profile.screen.dart';
import 'package:kolearn/screen/ubahPassword/ubah_password.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("My Account"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xffE6F6FF),
        // color: const Color(0xffE6F6FF),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  top: 15.h,
                ),
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: "fotoProfil",
                      child: CircleAvatar(
                        radius: 40.r,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Contoh Nama",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  "1000",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                const Text("Points"),
                              ],
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: VerticalDivider(
                                width: 4.w,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "4",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                const Text("Courses"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 17.h),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Akun",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    RowBtn(
                      icons: Icons.account_circle,
                      textBtn: "Ubah Profile",
                      isNext: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfile(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 3.h),
                    const Divider(
                      thickness: 2,
                    ),
                    SizedBox(height: 3.h),
                    RowBtn(
                      icons: Icons.lock_open,
                      textBtn: "Ubah Password",
                      isNext: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UbahPassword(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 17.h),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Tentang",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(height: 3.h),
                    RowBtn(
                      icons: Icons.verified,
                      textBtn: "Pusat Bantuan",
                      isNext: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UbahPassword(),
                          ),
                        );
                      },
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    SizedBox(height: 3.h),
                    RowBtn(
                      icons: Icons.face,
                      textBtn: "About Me",
                      isNext: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CobaPage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 3.h),
                    const Divider(
                      thickness: 2,
                    ),
                    RowBtn(
                      icons: Icons.logout,
                      textBtn: "Logout",
                      isNext: false,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowBtn extends StatelessWidget {
  RowBtn(
      {Key? key,
      required this.textBtn,
      required this.icons,
      required this.onTap,
      required this.isNext})
      : super(key: key);

  String textBtn;
  IconData icons;
  bool isNext;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Row(children: <Widget>[
          Icon(icons),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Text(
              textBtn,
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff656565),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          (isNext == true) ? const Icon(Icons.chevron_right) : Container()
        ]),
        onTap: onTap);
  }
}
