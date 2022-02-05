part of 'course_cubit.dart';

abstract class CourseState extends Equatable {}

class CourseInitial extends CourseState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class CourseLoading implements CourseState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class CourseSuccess implements CourseState {
  final List courses;
  const CourseSuccess(this.courses);

  @override
  List<Object?> get props => [courses];

  @override
  bool? get stringify => true;
}
