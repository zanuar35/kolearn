import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PassTextField extends StatelessWidget {
  const PassTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.w,
          ),
          hintText: 'Password lagi',
          hintStyle: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 12.sp, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Color(0xffDDE5E9),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Color(0xffDDE5E9),
              width: 2.0,
            ),
          ),
          suffixIcon: InkWell(
            child: Icon(Icons.remove_red_eye),
            onTap: () {},
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter password';
          }
          return null;
        },
      ),
    );
  }
}
