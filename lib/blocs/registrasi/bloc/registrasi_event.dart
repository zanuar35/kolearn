part of 'registrasi_bloc.dart';

abstract class RegistrasiEvent extends Equatable {}

class RegistrasiSubmit implements RegistrasiEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  RegistrasiSubmit(this.email, this.password, this.name, this.confirmPassword);
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}
