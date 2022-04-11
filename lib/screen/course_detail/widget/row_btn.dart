import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowBtn extends StatefulWidget {
  const RowBtn({
    required this.text,
    required this.child,
    required this.icon,
    Key? key,
    required this.isSubmited,
  }) : super(key: key);

  final String text;
  final Widget child;
  final int isSubmited;
  final IconData icon;

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
              color: const Color(0xffFFC560),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: widget.child),
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
            child: Icon(
              widget.icon,
              color: widget.isSubmited == 1 ? Colors.green : Colors.grey,
            ))
      ],
    );
  }
}
