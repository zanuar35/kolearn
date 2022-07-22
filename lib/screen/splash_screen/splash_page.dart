import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/auth/cubit/auth_cubit.dart';
import 'package:kolearn/home_page.dart';
import 'package:kolearn/screen/auth/login/login_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthCubit>(context).authApps();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xffF9F2ED),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              height: 400.h,
              width: 400.w,
              curve: Curves.easeOutQuad,
              child: const Image(image: AssetImage('assets/img/logo.png')),
            ),
            SizedBox(height: 50.h),
            Center(
                child: SizedBox(
              height: 35.h,
              width: 35.h,
              child: const CircularProgressIndicator(),
            )),
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoading) {
                  Center(
                      child: SizedBox(
                    height: 15.h,
                    child: const CircularProgressIndicator(),
                  ));
                }
                if (state is AuthLoggedIn) {
                  Timer(const Duration(milliseconds: 2000), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  });
                }
                if (state is AuthNotLoggedIn) {
                  Timer(const Duration(milliseconds: 700), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  });
                }
              },
              child: Container(),
            ),
          ],
        ));
  }
}
