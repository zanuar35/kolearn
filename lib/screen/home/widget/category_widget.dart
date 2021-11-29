import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 65.h,
      decoration: BoxDecoration(
          color: const Color(0xff52C3FF),
          borderRadius: BorderRadius.circular(30.r)),
    );
  }
}
