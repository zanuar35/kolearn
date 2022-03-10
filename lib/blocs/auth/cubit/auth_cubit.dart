import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void authApps() async {
    // Load the shared preferences
    emit(AuthLoading());

    // Get the shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLogin = prefs.getBool('isLogin');

    // Check if the user is logged in
    if (isLogin == true) {
      emit(AuthLoggedIn());
    }
    // If not logged in, then redirect to login page
    else {
      emit(AuthNotLoggedIn());
    }
  }
}
