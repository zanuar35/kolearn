part of 'user_profile_cubit.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final UserProfile user;

  const UserProfileLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

class UserProfileUpdated extends UserProfileState {
  final UserModel user;

  const UserProfileUpdated({required this.user});

  @override
  List<Object> get props => [user];
}

class UserProfileError extends UserProfileState {
  final String err;
  const UserProfileError({required this.err});

  @override
  List<Object> get props => [err];
}
