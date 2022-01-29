// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  void registerEvent(String name, String email, String pass) async {
    String url = 'https://0531-103-178-13-98.ngrok.io';

    emit(RegisterLoading());
    var response = await http.post(
      Uri.parse("$url/api/register"),
      body: ({'name': name, 'email': email, 'password': pass}),
    );
    if (response.statusCode == 201) {
      print(response.body);
      emit(RegisterSuccess());
    } else {
      Map<String, dynamic> data = jsonDecode(response.body);
      emit(RegisterFailed(message: data['message']));
    }
  }
}
