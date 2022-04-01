// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kolearn/core/app_url.dart';
import 'package:kolearn/models/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());

  void getUserProfile() async {
    String url = AppUrl.baseUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    UserModel userModel;

    emit(UserProfileLoading());
    try {
      var response = await http.get(Uri.parse("$url/api/user"), headers: {
        'Accept': 'application/json',
        "Authorization": "Bearer $token",
      });
      if (response.statusCode == 200) {
        userModel = UserModel.fromJson(json.decode(response.body));
        emit(UserProfileLoaded(user: userModel));
      } else {
        emit(UserProfileError());
      }
    } catch (e) {
      emit(UserProfileError());
    }
  }

  void updateUserProfile(
      String nama, String email, String telp, String gender) async {
    String url = AppUrl.baseUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    UserModel userModel;

    emit(UserProfileLoading());
    try {
      var response =
          await http.post(Uri.parse("$url/api/update-profile"), headers: {
        'Accept': 'application/json',
        "Authorization": "Bearer $token",
      }, body: {
        "name": nama,
        "email": email,
        'gender': gender,
        "telp": telp
      });
      if (response.statusCode == 200) {
        print("berhasil update profile");
        userModel = UserModel.fromJson(json.decode(response.body));

        emit(UserProfileUpdated(user: userModel));
      } else {
        emit(UserProfileError());
      }
    } catch (e) {
      emit(UserProfileError());
    }
  }
}
