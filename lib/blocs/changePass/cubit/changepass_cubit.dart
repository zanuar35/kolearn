// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:kolearn/core/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'changepass_state.dart';

class ChangepassCubit extends Cubit<ChangepassState> {
  ChangepassCubit() : super(ChangepassInitial());

  void changePassEvent(String oldPass, newPass, confirmPass) async {
    String url = AppUrl.baseUrl;

    // mendapatkan prefs token dari local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    emit(ChangepassLoading());
    print("Loading...");

    // jika semua field tidak kosong
    if (oldPass.isNotEmpty && newPass.isNotEmpty && confirmPass.isNotEmpty) {
      var response =
          await http.post(Uri.parse("$url/api/changePass"), headers: {
        'Accept': 'application/json',
        "Authorization": 'Bearer $token'
      }, body: {
        'old_password': oldPass,
        'new_password': newPass,
        'confirm_password': confirmPass
      });
      if (response.statusCode == 200) {
        print(response.body);
        emit(ChangepassSuccess());
      } else {
        print(response.body);
        Map<String, dynamic> data = jsonDecode(response.body);
        emit(ChangepassFailed(message: data['message']));
      }
    }
    // jika salah satu field kosong
    else {
      emit(const ChangepassFailed(message: 'Password tidak boleh kosong'));
    }
  }
}
