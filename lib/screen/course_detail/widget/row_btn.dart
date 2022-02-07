import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowBtn extends StatefulWidget {
  const RowBtn({required this.text, Key? key}) : super(key: key);

  final String text;

  @override
  _RowBtnState createState() => _RowBtnState();
}

class _RowBtnState extends State<RowBtn> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 70.h,
          width: 70.h,
          decoration: BoxDecoration(
            color: Colors.green[400],
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        Text(widget.text),
        Expanded(child: Container()),
        Container(
          width: 35.w,
          height: 35.w,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.29),
                  offset: Offset(0, 2),
                  blurRadius: 8)
            ],
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.lock_outline_rounded),
        )
      ],
    );
  }
}
