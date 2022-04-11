part of 'changepass_cubit.dart';

abstract class ChangepassState extends Equatable {
  const ChangepassState();

  @override
  List<Object> get props => [];
}

class ChangepassInitial extends ChangepassState {}

class ChangepassLoading extends ChangepassState {}

class ChangepassSuccess extends ChangepassState {}

class ChangepassFailed extends ChangepassState {
  final String message;
  const ChangepassFailed({required this.message});

  @override
  List<Object> get props => [message];
}
