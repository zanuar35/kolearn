import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kolearn/core/app_shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void authApps() async {
    // Load the shared preferences
    emit(AuthLoading());

    // Get the shared preferences
    SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();
    bool? isLogin = await sharedPreferencesHelper.getIsLogin();

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
