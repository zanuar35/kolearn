import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  void loadQuiz() async {
    emit(QuizLoading());
    var jsonText = await rootBundle.loadString('assets/quiz.json');
    var response = json.decode(jsonText);
    await Future.delayed(const Duration(milliseconds: 500));
    emit(QuizLoaded(list: response));
  }
}
