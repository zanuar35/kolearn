import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCourse extends StatelessWidget {
  MyCourse({Key? key}) : super(key: key);

  final List<Color> warnaCard = [
    Colors.white,
    const Color(0xff7383C0),
    const Color(0xffF9AE2B),
    const Color(0xff5BDEDE)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7F6FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text("My Course"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 110.h,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 22.h),
                child: SizedBox(
                  height: 60.h,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.only(right: 13),
                            child: categoryCard(warnaCard[index], index));
                      }),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 24.h),
              width: double.infinity,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const MateriCard();
                  }),
            )
          ],
        ),
      )),
    );
  }

  Widget categoryCard(Color warna, int indeks) {
    return Container(
      width: 108.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: (indeks == 0) ? const Color(0xff53C0FA) : Colors.white,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 45.h,
            width: 45.h,
            decoration: BoxDecoration(shape: BoxShape.circle, color: warna),
          ),
          Text(
            "All Topics",
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class MateriCard extends StatelessWidget {
  const MateriCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25.h, left: 24.w, right: 24.w, bottom: 5.h),
      width: 360.w,
      height: 170.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 4,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Row(
          children: <Widget>[
            Container(
              height: 85.h,
              width: 85.h,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Huruf Vokal Dasar",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.book,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "12 Materi",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
