// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  int nilai = 0;

  void correctAnswer() {
    nilai++;
    // ignore: avoid_print
    print(nilai);
  }

  int? getNilai() {
    return nilai;
  }

  void resetNilai() {
    nilai = 0;
  }

  

  void loadQuiz() async {
    emit(QuizLoading());
    var jsonText = await rootBundle.loadString('assets/quiz.json');
    var response = json.decode(jsonText);
    await Future.delayed(const Duration(milliseconds: 500));
    emit(QuizLoaded(list: response));
  }
}
