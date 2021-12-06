import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/category_widget.dart';
import 'widget/materi_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffE7F6FF),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 100.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                color: Colors.white,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Hello, ",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff747474)),
                          ),
                          Text(
                            "Contoh Lee",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 35.r,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 22.h,
                    ),
                    //  Row Search box dan setting button
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 60.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: const Offset(
                                        0, 4), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 24.w,
                        ),
                        Container(
                          height: 60.h,
                          width: 60.h,
                          decoration: BoxDecoration(
                            color: const Color(0xff52C3FF),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        )
                      ],
                    ),
                    // end  Row Search box dan setting button
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      "Courses",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 24.sp),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      children: <Widget>[
                        const CategoryWidget(),
                        SizedBox(
                          width: 50.w,
                        ),
                        const CategoryWidget(),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: <Widget>[
                        const CategoryWidget(),
                        SizedBox(
                          width: 50.w,
                        ),
                        const CategoryWidget(),
                      ],
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: Row(
                              children: <Widget>[
                                const MateriCard(),
                                SizedBox(
                                  width: 30.w,
                                ),
                                const MateriCard()
                              ],
                            ),
                          );
                        })
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
