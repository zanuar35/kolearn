import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void authApps() async {
    emit(AuthLoading());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLogin = prefs.getBool('isLogin');
    if (isLogin == true) {
      emit(AuthLoggedIn());
    } else {
      emit(AuthNotLoggedIn());
    }
  }
}
