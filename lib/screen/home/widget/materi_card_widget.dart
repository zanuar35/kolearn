import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MateriCard extends StatelessWidget {
  const MateriCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Text(
                "ㅏ",
                style: TextStyle(
                  fontSize: 90.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50.h,
              child: Center(
                child: Text(
                  "Basic Vowel",
                  style: TextStyle(
                    fontSize: 15.sp,
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
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: const Color(0xffF9AE2B),
        ),
      ),
    );
  }
}
