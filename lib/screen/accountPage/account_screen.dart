import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xffE6F6FF),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.only(top: 15.h),
              width: double.infinity,
              height: 180.h,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Expanded(
                    child: Container(
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
                          )
                        ],
                      ),
                    ),
                  ),
                ],
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
                      Row(children: <Widget>[
                        const Icon(Icons.account_circle_rounded),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: Text(
                            "Ubah Profile",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color(0xff656565),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Icon(Icons.chevron_right),
                      ]),
                      SizedBox(height: 5.h),
                      const Divider(
                        thickness: 3,
                      ),
                      SizedBox(height: 5.h),
                      Row(children: <Widget>[
                        const Icon(Icons.account_circle_rounded),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: Text(
                            "Ubah Profile",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color(0xff656565),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Icon(Icons.chevron_right),
                      ])
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
                      Row(children: <Widget>[
                        const Icon(Icons.account_circle_rounded),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: Text(
                            "Ubah Profile",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color(0xff656565),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Icon(Icons.chevron_right),
                      ]),
                      SizedBox(height: 5.h),
                      const Divider(
                        thickness: 3,
                      ),
                      SizedBox(height: 5.h),
                      Row(children: <Widget>[
                        const Icon(Icons.account_circle_rounded),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: Text(
                            "Ubah Profile",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color(0xff656565),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Icon(Icons.chevron_right),
                      ]),
                      SizedBox(height: 5.h),
                      const Divider(
                        thickness: 3,
                      ),
                      SizedBox(height: 5.h),
                      Row(children: <Widget>[
                        const Icon(Icons.account_circle_rounded),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: Text(
                            "Ubah Profile",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color(0xff656565),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Icon(Icons.chevron_right),
                      ])
                    ],
                  )),
            ),
            SizedBox(
              height: 27.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 55.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  primary: const Color(0xff7383BF),
                ),
                child: Text(
                  "Log out",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            )
          ],
        ),
      ),
    );
  }
}
