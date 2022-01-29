part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailed extends RegisterState {
  final String message;
  const RegisterFailed({required this.message});
  @override
  bool? get stringify => throw UnimplementedError();
}

class RegisterNotValid extends RegisterState{}