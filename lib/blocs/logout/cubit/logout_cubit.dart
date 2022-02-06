// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> logOut() async {
    emit(LogoutLoading());
    String url = 'https://9059-103-178-12-200.ngrok.io';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    print(token);
    var response = await http.post(
      Uri.parse("$url/api/logout"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      emit(LogoutSuccess());
    } else {
      emit(LogoutFailed());
    }
  }
}
