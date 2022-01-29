// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRadio extends StatefulWidget {
  CustomRadio({required this.index, required this.text, Key? key})
      : super(key: key);

  int index;
  String text;
  @override
  _CustomRadioState createState() => _CustomRadioState();
}

int selected = 1;

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: (selected == widget.index)
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
              widget.text,
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
          selected = widget.index;
        });
      },
    );
  }
}
