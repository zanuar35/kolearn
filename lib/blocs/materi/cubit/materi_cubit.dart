// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:kolearn/core/app_url.dart';
import 'package:kolearn/models/materi.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'materi_state.dart';

class MateriCubit extends Cubit<MateriState> {
  MateriCubit() : super(MateriInitial());

  void getMateri(int id) async {
    String url = AppUrl.baseUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    emit(MateriLoading());
    var response = await http.get(
      Uri.parse("$url/api/materi/$id"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map dataMap = json.decode(response.body);
      Materi materi = Materi.fromJson(dataMap);
      print(response.body);
      List<Data> materiData = materi.data;
      emit(MateriLoaded(materiData));
    }
  }

  void updateMateri(int id) async {
    String url = AppUrl.baseUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    var response = await http.post(
      Uri.parse("$url/api/update-course/$id?isSubmited=1"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print("berhasil Updated");
    } else {
      print(response.statusCode);
    }
  }
}
