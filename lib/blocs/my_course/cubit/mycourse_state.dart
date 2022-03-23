part of 'mycourse_cubit.dart';

abstract class MycourseState extends Equatable {
  const MycourseState();

  @override
  List<Object> get props => [];
}

class MycourseInitial extends MycourseState {}

class MycourseLoading extends MycourseState {}

class MycourseSuccess extends MycourseState {}

class MycourseError extends MycourseState {
  final String error;

  const MycourseError({required this.error});

  @override
  List<Object> get props => [error];
}
