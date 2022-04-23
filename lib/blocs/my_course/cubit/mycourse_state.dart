part of 'mycourse_cubit.dart';

abstract class MycourseState extends Equatable {
  const MycourseState();

  @override
  List<Object> get props => [];
}

class MycourseInitial extends MycourseState {}

class MycourseLoading extends MycourseState {}

class MycourseSuccess extends MycourseState {
  final List getCourseModel;

 const  MycourseSuccess(this.getCourseModel);


  @override
  List<Object> get props => [getCourseModel];
}

class MycourseLoaded extends MycourseState {
  final List getCourseModel;

  const MycourseLoaded(this.getCourseModel);

  @override
  List<Object> get props => [getCourseModel];
}

class MycourseSuccessUpdate extends MycourseState {}

class MycourseError extends MycourseState {
  final String error;

  const MycourseError({required this.error});

  @override
  List<Object> get props => [error];
}
