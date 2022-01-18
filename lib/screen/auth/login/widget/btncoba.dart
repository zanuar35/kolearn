// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:kolearn/home_page.dart';

class Tombol extends StatelessWidget {
  const Tombol({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        _formKey = formKey,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        login(
            _formKey, context, _emailController.text, _passwordController.text);
      },
      child: Text("data"),
    );
  }
}

Future<void> login(GlobalKey<FormState> formKey, BuildContext context,
    String nama, String pass) async {
  if (formKey.currentState!.validate()) {
    EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );
    var response = await http.post(
      Uri.parse("https://reqres.in/api/login"),
      body: ({
        'email': nama,
        'password': pass,
      }),
    );

    if (response.statusCode == 200) {
      EasyLoading.showSuccess('Login Success');
      Timer(Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      });
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
