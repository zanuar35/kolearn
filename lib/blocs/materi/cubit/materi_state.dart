part of 'materi_cubit.dart';

abstract class MateriState extends Equatable {}

class MateriInitial extends MateriState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class MateriLoading extends MateriState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class MateriLoaded extends MateriState {
  // final List<Materi> materi;

  // MateriLoaded({@required this.materi});

  @override
  List<Object> get props => [];
  // [materi];

  @override
  bool get stringify => true;
}
