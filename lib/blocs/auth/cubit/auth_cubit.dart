import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void authApps() async {
    emit(AuthLoading());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    bool? isLogin = prefs.getBool('isLogin');
    print('token :' + token);
    if (isLogin == true) {
      emit(AuthLoggedIn());
    } else {
      emit(AuthNotLoggedIn());
    }
  }
}
