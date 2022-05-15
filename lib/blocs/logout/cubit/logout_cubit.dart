// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kolearn/core/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> logOut() async {
    emit(LogoutLoading());

    // Url end-point
    String url = AppUrl.baseUrl;

    // mendapatkan prefs token dari local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    // Mengubah isLogin menjadi false
    prefs.setBool("isLogin", false);

    // Konek ke end-point rest api
    var response = await http.post(
      Uri.parse("$url/api/logout"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    );
    await prefs.clear();
    // Jika response berhasil
    if (response.statusCode == 200) {
      emit(LogoutSuccess());
    } else {
      emit(LogoutFailed());
    }
  }
}
