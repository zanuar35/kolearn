import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kolearn/core/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  void getNotification() async {
    String url = AppUrl.baseUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    emit(NotificationLoading());
    print("Loading");
    var response = await http.get(
      Uri.parse("$url/api/getMyCourse"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    // success get data
    if (response.statusCode == 200) {
      final Map dataMap = json.decode(response.body);
      List myCourse = dataMap['data'];
      print(myCourse[0]);
      emit(NotificationLoaded(myCourse));
    }
    // error get data
    else {
      emit(NotificationError(response.statusCode.toString()));
    }
  }
}
