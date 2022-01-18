part of 'registrasi_bloc.dart';

abstract class RegistrasiEvent extends Equatable {}

class RegistrasiSubmit implements RegistrasiEvent {
  final String email;
  final String password;

  RegistrasiSubmit(this.email, this.password);
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}
