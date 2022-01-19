import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/screen/edit_Profile/edit_profile.screen.dart';

class RowButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  const RowButton({
    Key? key,
    required this.text,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(children: <Widget>[
        const Icon(
          Icons.account_circle_rounded,
        ),
        SizedBox(
          width: 15.w,
        ),
        Expanded(
          child: Text(
            "text",
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xff656565),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Icon(Icons.chevron_right),
      ]),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  EditProfile(),
          ),
        );
      },
    );
  }
}
