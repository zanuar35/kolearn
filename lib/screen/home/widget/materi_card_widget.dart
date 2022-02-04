import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/screen/course_detail/course_detail_screen.dart';

class MateriCard extends StatelessWidget {
  const MateriCard({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  final warna = const [
    Color(0xffF9AE2B),
    Color(0xff56B8EC),
    Color(0xff7383C0),
    Color(0xff5ADFDF),
    Color(0xffF9AE2B),
    Color(0xff56B8EC),
    Color(0xff7383C0),
    Color(0xff5ADFDF),
    Color(0xffF9AE2B),
    Color(0xff56B8EC),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: Text(
                "ㅏ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 90.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 50.h,
              child: Center(
                child: Text(
                  "Basic Vowel",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: const Color(0xffFFD07D).withOpacity(0.58),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: warna[index], borderRadius: BorderRadius.circular(15)),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CourseDetail(),
          ),
        );
      },
    );
  }
}
