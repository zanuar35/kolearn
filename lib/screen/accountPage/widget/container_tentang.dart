import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/logout/cubit/logout_cubit.dart';
import 'package:kolearn/screen/accountPage/widget/row_button.dart';
import 'package:kolearn/screen/coba.dart';
import 'package:kolearn/screen/edit_Profile/edit_profile.screen.dart';
import 'package:kolearn/screen/quiz_screen/quiz_screen.dart';

class ContainerTentang extends StatelessWidget {
  const ContainerTentang({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 17.h),
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Tentang",
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(height: 3.h),
            RowBtn(
              icons: Icons.verified,
              textBtn: "Pusat Bantuan",
              isNext: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuizScreen(),
                  ),
                );
              },
            ),
            const Divider(
              thickness: 2,
            ),
            SizedBox(height: 3.h),
            RowBtn(
              icons: Icons.face,
              textBtn: "About Me",
              isNext: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CobaPage(),
                  ),
                );
              },
            ),
            SizedBox(height: 3.h),
            const Divider(
              thickness: 2,
            ),
            RowBtn(
              icons: Icons.logout,
              textBtn: "Logout",
              isNext: false,
              onTap: () {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: Text(
                            "Konfirmasi",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          content: const Text(
                            'Apakah Anda yakin ingin keluar dari aplikasi ini? ',
                            textAlign: TextAlign.center,
                          ),
                          actions: <Widget>[
                            // Cancel button
                            TextButton(
                              onPressed: () =>
                                  // close the dialog
                                  Navigator.of(context, rootNavigator: true)
                                      .pop('dialog'),
                              child: const Text(
                                'Cancel',
                                textAlign: TextAlign.start,
                              ),
                            ),
                            // Ok button
                            TextButton(
                              onPressed: () {
                                // close alert dialog
                                Navigator.of(context, rootNavigator: true)
                                    .pop('dialog');
                                // navigate to new route
                                BlocProvider.of<LogoutCubit>(context).logOut();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
