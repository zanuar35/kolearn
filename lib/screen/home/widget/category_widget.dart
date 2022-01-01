import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 138.w,
      height: 65.h,
      decoration: BoxDecoration(
        color: const Color(0xff52C3FF),
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 55.h,
            width: 55.h,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          const Text("All Topics")
        ],
      ),
    );
  }
}
