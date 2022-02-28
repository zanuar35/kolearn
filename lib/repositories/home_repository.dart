import 'dart:convert';
import 'package:kolearn/models/course.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<List<Course>> fetchCourse() async {
    String url = 'https://e6ba-103-158-253-138.ngrok.io';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    List<Course> course = [];

    await http.get(
      Uri.parse("$url/api/course"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    ).then((value) {
      Iterable it = json.decode(value.body);
      course = it.map((model) => Course.fromJson(model)).toList();
    });

    return course;
  }
}
