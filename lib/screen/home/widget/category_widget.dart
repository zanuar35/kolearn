// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRadio extends StatefulWidget {
  const CustomRadio({Key? key}) : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

List<String> item = ['Pemula', 'Menengah', 'Mahir'];

class _CustomRadioState extends State<CustomRadio> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: customRadio(index, item[index]));
            }),
      ),
    );
  }

  Widget customRadio(int index, String text) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: (selected == index)
              ? const Color(0xff52C3FF)
              : const Color.fromARGB(255, 238, 122, 114),
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              width: 10.w,
            ),
            Container(
              height: 55.h,
              width: 55.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 15.w,
            )
          ],
        ),
      ),
      onTap: () {
        setState(() {
          selected = index;
        });
      },
    );
  }
}
