import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class InputField extends StatelessWidget {
  const InputField({
    required this.hint,
    Key? key,
  }) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      child: TextFormField(
          decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 18.w,
        ),
        hintText: hint,
        hintStyle: TextStyle(
            fontWeight: FontWeight.w400, fontSize: 12.sp, color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide:const BorderSide(
            color: Color(0xffDDE5E9),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide:const BorderSide(
            color: Color(0xffDDE5E9),
            width: 2.0,
          ),
        ),
      )),
    );
  }
}
