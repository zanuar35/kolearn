import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kolearn/models/user/user_model.dart';
import 'package:kolearn/repositories/user/user_repositories.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  LoginBloc(this.userRepository) : super(LoginInitial()) {
    on<LoginSubmit>((event, emit) async {
      try {
        emit(LoginLoading());
        List<User> user =
            await userRepository.fetchUsers(event.email, event.password);
        emit(LoginSuccess(user));
      } catch (e) {
        emit(LoginFailed());
      }
    });
  }
}
