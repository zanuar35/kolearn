// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/screen/accountPage/widget/container_tentang.dart';
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
