part of 'quiz_cubit.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizGetNilai extends QuizState {
  final int nilai;
  const QuizGetNilai({required this.nilai});

  @override
  List<Object> get props => [nilai];
}

class QuizLoaded extends QuizState {
  final List list;
  const QuizLoaded({required this.list});

  @override
  List<Object> get props => [list];
}
