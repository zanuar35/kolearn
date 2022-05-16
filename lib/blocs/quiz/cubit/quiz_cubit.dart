import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:kolearn/models/quiz.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  void loadQuiz() async {
    emit(QuizLoading());
    var jsonText = await rootBundle.loadString('assets/database/quiz.json');
    var response = json.decode(jsonText);
    print(response);
    await Future.delayed(const Duration(milliseconds: 500));
  emit(QuizLoaded(quizModel: response));
  }
}
