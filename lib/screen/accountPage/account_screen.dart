import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/logout_btn.dart';
import 'widget/row_btn.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text("My Account"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red[100],
        // color: const Color(0xffE6F6FF),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10.h,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                width: double.infinity,
                height: 200.h,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40.r,
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 17.h),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      const RowButton(
                        iconData: Icons.account_circle_rounded,
                        text: "Ubah Profile",
                      ),
                      SizedBox(height: 5.h),
                      const Divider(
                        thickness: 2,
                      ),
                      SizedBox(height: 5.h),
                      const RowButton(
                        iconData: Icons.account_circle_rounded,
                        text: "Ubah kata sandi",
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 10.h,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.h, vertical: 17.w),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      const RowButton(
                        iconData: Icons.account_circle_rounded,
                        text: "Syarat dan Ketentuan",
                      ),
                      SizedBox(height: 5.h),
                      const Divider(
                        thickness: 2,
                      ),
                      SizedBox(height: 5.h),
                      const RowButton(
                        iconData: Icons.account_circle_rounded,
                        text: "Kebijakan Privasi",
                      ),
                      SizedBox(height: 5.h),
                      const Divider(
                        thickness: 2,
                      ),
                      SizedBox(height: 5.h),
                      const RowButton(
                        iconData: Icons.account_circle_rounded,
                        text: "Pusat bantuan",
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 27.h,
            ),
            const LogoutBtn(),
            SizedBox(
              height: 50.h,
            )
          ],
        ),
      ),
    );
  }
}
