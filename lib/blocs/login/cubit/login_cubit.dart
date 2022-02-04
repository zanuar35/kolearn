// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:kolearn/models/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void loginEvent(String nama, String pass) async {
    String url = 'https://b019-103-178-12-200.ngrok.io';

    if (nama == '') {
      emit(NotValidated());
    }

    emit(LoginLoading());
    var response = await http.post(
      Uri.parse("$url/api/login"),
      body: ({'email': nama, 'password': pass}),
    );
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, dynamic> data = jsonDecode(response.body);
      prefs.setString('token', data['token']);
      User user = User.fromJson(jsonDecode(response.body));
      emit(LoginSuccess(user: user));
    } else {
      Map<String, dynamic> data = jsonDecode(response.body);
      emit(LoginFailed(message: data['message']));
    }
  }
}
