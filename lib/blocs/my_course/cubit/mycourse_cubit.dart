import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kolearn/core/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'mycourse_state.dart';

class MycourseCubit extends Cubit<MycourseState> {
  MycourseCubit() : super(MycourseInitial());

  void saveCourse(String courseName, String id, String jumlahMateri) async {
    String url = AppUrl.baseUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    emit(MycourseLoading());

    var response = await http.post(
        Uri.parse(
          "$url/api/myCourse",
        ),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: ({
          'course_name': courseName,
          'course_id': id,
          'jumlah_materi': jumlahMateri,
          'status': 'started',
          'is_submited': '1',
        }));

    if (response.statusCode == 200) {
      print("berhasil");
      emit(MycourseSuccess());
    } else {
      print(response.statusCode);
    }
  }
}
