import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/bloc/login_bloc.dart';
import 'package:kolearn/screen/accountPage/widget/row_button.dart';
import 'package:kolearn/screen/auth/login/login_screen.dart';
import 'package:kolearn/screen/coba.dart';
import 'package:kolearn/screen/ubahPassword/ubah_password.dart';

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
                    builder: (context) => const UbahPassword(),
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
                BlocProvider.of<LoginBloc>(context).add(LogOut());
              },
            ),
          ],
        ),
      ),
    );
  }
}
