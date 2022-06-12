// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kolearn/core/app_shared_preferences.dart';
import 'package:kolearn/core/app_url.dart';
import 'package:kolearn/models/user/user.dart';
import 'package:kolearn/models/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());
  String url = AppUrl.baseUrl;

  void getUserProfile() async {
    SharedPreferencesHelper _sharedPreferencesHelper =
        SharedPreferencesHelper();
    String token = await _sharedPreferencesHelper.getToken();
    emit(UserProfileLoading());
    try {
      var response = await http.get(Uri.parse("$url/api/user"), headers: {
        'Accept': 'application/json',
        "Authorization": "Bearer $token",
      });
      if (response.statusCode == 200) {
        print(response.body);
        print("status code:" + response.statusCode.toString());
        var jsonResponse = json.decode(response.body);
        UserProfile userProfile = UserProfile.fromJson(jsonResponse);
        emit(UserProfileLoaded(user: userProfile));
      } else {
        emit(const UserProfileError(err: "Error"));
      }
    } catch (e) {
      print(e);
    }
  }

  void updateUserProfile(
      String nama, String email, String telp, String gender) async {
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
        emit(UserProfileError(err: response.statusCode.toString()));
      }
    } catch (e) {
      emit(UserProfileError(err: e.toString()));
    }
  }
}

/*
SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    User user;
    emit(UserProfileLoading());
    try {
      var response = await http.get(Uri.parse("$url/api/user"), headers: {
        'Accept': 'application/json',
        "Authorization": "Bearer $token",
      });
      if (response.statusCode == 200) {
        print("== response code 200 == ");
        print(response.body);
        user = User.fromJson(json.decode(response.body));
        print("Success get user profile");
        (UserProfileLoaded(user: user));
      } else {
        print("== error 1 == ");
        emit(UserProfileError(err: response.statusCode.toString()));
      }
    } catch (e) {
      print("== error 2 ==");

      emit(UserProfileError(err: e.toString()));
    }
    print(state);
*/