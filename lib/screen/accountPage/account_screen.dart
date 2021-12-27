import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/screen/edit_Profile/edit_profile.screen.dart';

import 'widget/logout_btn.dart';

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
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 17.h),
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
                    const RowBtn(),
                    SizedBox(height: 5.h),
                    const Divider(
                      thickness: 2,
                    ),
                    SizedBox(height: 5.h),
                    const RowBtn()
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
                width: double.infinity,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 27.h,
            ),
            const LogoutBtn(),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      ),
    );
  }
}

class RowBtn extends StatelessWidget {
  const RowBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(children: <Widget>[
        const Icon(
          Icons.account_circle_rounded,
        ),
        SizedBox(
          width: 15.w,
        ),
        Expanded(
          child: Text(
            "Ubah Profile",
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xff656565),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Icon(Icons.chevron_right),
      ]),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EditProfile(),
          ),
        );
      },
    );
  }
}
