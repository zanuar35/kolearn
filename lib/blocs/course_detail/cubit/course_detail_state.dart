part of 'course_detail_cubit.dart';

abstract class CourseDetailState extends Equatable {}

class CourseDetailInitial extends CourseDetailState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class CourseDetailLoading implements CourseDetailState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class CourseDetailSuccess implements CourseDetailState {
  final CourseDetailModel courseDetail;

  const CourseDetailSuccess(this.courseDetail);
  @override
  List<Object?> get props => [courseDetail];

  @override
  bool? get stringify => true;
}

class CourseDetailFailure implements CourseDetailState {
  final String error;

  CourseDetailFailure(this.error);

  @override
  List<Object?> get props => [error];

  @override
  bool? get stringify => true;
}
