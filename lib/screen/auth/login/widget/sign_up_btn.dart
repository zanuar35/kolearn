import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/screen/auth/register/register_screen.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text(
        "Belum punya akun?",
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(
        width: 6.w,
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const RegisterScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) => Align(
                          child: SizeTransition(
                            sizeFactor: animation,
                            child: child,
                          ),
                        )),
          );
        },
        child: Text(
          "Buat akun",
          style: TextStyle(
            color: const Color(0xff239BD8),
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      )
    ]);
  }
}
