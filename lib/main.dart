// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kolearn/blocs/course/cubit/course_cubit.dart';
import 'package:kolearn/blocs/login/cubit/login_cubit.dart';
import 'package:kolearn/blocs/logout/cubit/logout_cubit.dart';
import 'package:kolearn/blocs/materi/cubit/materi_cubit.dart';
import 'package:kolearn/blocs/register/cubit/register_cubit.dart';
import 'package:kolearn/screen/auth/login/login_screen.dart';
import 'package:kolearn/screen/auth/login/service/cubit/obscuretext_cubit.dart';

void main() {
  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ObscuretextCubit>(
              create: (context) => ObscuretextCubit()),
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => LogoutCubit(),
          ),
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
          BlocProvider(
            create: (context) => CourseCubit(),
          ),
          BlocProvider(
            create: (context) => MateriCubit(),
          )
        ],
        child: ScreenUtilInit(
          minTextAdapt: true,
          designSize: Size(414, 896),
          builder: () => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            )),
            home: LoginPage(),
            builder: EasyLoading.init(builder: (context, widget) {
              ScreenUtil.setContext(context);
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!);
            }),
          ),
        ));
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Color.fromARGB(255, 68, 68, 68).withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}
