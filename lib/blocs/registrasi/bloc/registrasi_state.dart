part of 'registrasi_bloc.dart';

abstract class RegistrasiState extends Equatable {}

class RegistrasiInitial extends RegistrasiState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class RegistrasiLoading extends RegistrasiState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class RegistrasiSuccess extends RegistrasiState {
  final List<UserRegist> userRegist;

  RegistrasiSuccess(this.userRegist);

  @override
  List<Object?> get props => [userRegist];

  @override
  bool? get stringify => true;
}

class RegistrasiFailed extends RegistrasiState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}
