part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoggedIn extends AuthState {}

class AuthNotLoggedIn extends AuthState {}

class AuthLoading extends AuthState {}
