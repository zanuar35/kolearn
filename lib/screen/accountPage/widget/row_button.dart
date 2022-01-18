import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowBtn extends StatelessWidget {
  const RowBtn(
      {Key? key,
      required this.textBtn,
      required this.icons,
      required this.onTap,
      required this.isNext})
      : super(key: key);

  final String textBtn;
  final IconData icons;
  final bool isNext;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Row(children: <Widget>[
          Icon(icons),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Text(
              textBtn,
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff656565),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          (isNext == true) ? const Icon(Icons.chevron_right) : Container()
        ]),
        onTap: onTap);
  }
}
