part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserModel user;
  const LoginSuccess({required this.user});

  @override
  List<Object> get props => [user];

}

class LoginFailed extends LoginState {
  final String message;
  const LoginFailed({required this.message});
  @override
  bool? get stringify => throw UnimplementedError();
}

class NotValidated extends LoginState {}
