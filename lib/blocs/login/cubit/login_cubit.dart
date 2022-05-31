// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:kolearn/core/app_shared_preferences.dart';
import 'package:kolearn/core/app_url.dart';
import 'package:kolearn/models/user/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void loginEvent(String nama, String pass) async {
    // Get url endpoint API
    String url = AppUrl.baseUrl;

    // if nama is empty
    // NotValidate state
    if (nama == '') {
      emit(NotValidated());
    }

    // Loading state
    emit(LoginLoading());

    // post data to API
    var response = await http.post(
      Uri.parse("$url/api/login"),
      body: ({'email': nama, 'password': pass}),
    );

    // if response status code is 200
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(jsonDecode(response.body));
      // print(data['user']);
      // print(data['user']['name']);
      SharedPreferencesHelper sharedPreferencesHelper =
          SharedPreferencesHelper();

      sharedPreferencesHelper.setIsLogin(true);
      sharedPreferencesHelper.setToken(data['token']);
      sharedPreferencesHelper.setUserId(data['user']['id']);
      sharedPreferencesHelper.setUserName(data['user']['name']);
      sharedPreferencesHelper.setUserNilai(nilai: data['user']['nilai']);

      // Success state
      emit(LoginSuccess(user: user));
    }
    // if response status code is not 200
    else {
      Map<String, dynamic> data = jsonDecode(response.body);
      // Error state
      emit(LoginFailed(message: data['message']));
    }
  }
}
