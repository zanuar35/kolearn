// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/screen/edit_Profile/edit_profile.screen.dart';

class LogoutBtn extends StatelessWidget {
  const LogoutBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: ElevatedButton(
        onPressed: () {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    content: const Text(
                      'Ingin mengambil kuis sekarang? ',
                      textAlign: TextAlign.center,
                    ),
                    actions: <Widget>[
                      // Cancel button
                      TextButton(
                        onPressed: () =>
                            // close the dialog
                            Navigator.of(context, rootNavigator: true)
                                .pop('dialog'),
                        child: const Text('Cancel'),
                      ),
                      // Ok button
                      TextButton(
                        onPressed: () {
                          // close alert dialog
                          Navigator.of(context, rootNavigator: true)
                              .pop('dialog');
                          // navigate to new route
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditProfile()),
                          );
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ));

          // BlocProvider.of<LogoutCubit>(context).logOut();
        },
        style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width, 55.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          primary: const Color(0xff7383BF),
        ),
        child: Text(
          "Log out",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
