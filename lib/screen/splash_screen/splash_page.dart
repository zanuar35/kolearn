import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        color: Colors.amber,
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AuthLoggedIn) {
              Timer(const Duration(seconds: 2), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              });
            }
            if (state is AuthNotLoggedIn) {
              Timer(const Duration(seconds: 2), () {
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
        ));
  }
}
