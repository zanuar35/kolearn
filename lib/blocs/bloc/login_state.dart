part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class LoginSuccess extends LoginState {
  final List<User> user;

  LoginSuccess(this.user);

  @override
  List<Object?> get props => [user];

  @override
  bool? get stringify => true;
}

class LoginFailed extends LoginState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}
