import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'materi_state.dart';

class MateriCubit extends Cubit<MateriState> {
  MateriCubit() : super(MateriInitial());

  void getMateri(int id) async {
    String url = 'https://339e-103-158-253-138.ngrok.io';
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
      var data = response.body;
      print(data);
      emit(MateriLoaded());
    }
  }
}
