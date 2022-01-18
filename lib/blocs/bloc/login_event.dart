part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginSubmit implements LoginEvent {
  final String email;
  final String password;

  LoginSubmit(this.email, this.password);

  List<Object> get props => [];

  bool get stringify => false;
}
