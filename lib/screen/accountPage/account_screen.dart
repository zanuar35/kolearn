// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/logout/cubit/logout_cubit.dart';
import 'package:kolearn/screen/accountPage/widget/container_tentang.dart';
import 'package:kolearn/screen/auth/login/login_screen.dart';
import 'widget/container_akun.dart';
import 'widget/container_badge_profile.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("My Account"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xffE6F6FF),
        child: Column(
          children: <Widget>[
            BlocListener<LogoutCubit, LogoutState>(
              listener: ((context, state) {
                if (state is LogoutLoading) {
                  EasyLoading.show(
                    status: 'loading...',
                    maskType: EasyLoadingMaskType.black,
                  );
                }
                if (state is LogoutSuccess) {
                  EasyLoading.showSuccess('Logout success!',
                      duration: Duration(milliseconds: 1500));
                  EasyLoading.dismiss();
                  Timer(Duration(milliseconds: 1200), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  });
                }
                if (state is LogoutFailed) {
                  EasyLoading.showError("Gagal Logout");
                }
              }),
              child: Container(),
            ),
            SizedBox(
              height: 10.h,
            ),
            ContainerBadgeProfile(),
            SizedBox(
              height: 10.h,
            ),
            ContainerAkun(),
            SizedBox(
              height: 10.h,
            ),
            ContainerTentang(),
          ],
        ),
      ),
    );
  }
}
