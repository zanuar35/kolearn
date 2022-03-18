part of 'notification_cubit.dart';

abstract class NotificationState extends Equatable {}

class NotificationInitial extends NotificationState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class NotificationLoading extends NotificationState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class NotificationLoaded extends NotificationState {
  final List myCourse;

  NotificationLoaded(this.myCourse);

  @override
  List<Object> get props => [myCourse];
  // [materi];

  @override
  bool get stringify => true;
}

class NotificationError extends NotificationState {
  final String error;

  NotificationError(this.error);

  @override
  List<Object> get props => [error];
  // [materi];

  @override
  bool get stringify => true;
}
