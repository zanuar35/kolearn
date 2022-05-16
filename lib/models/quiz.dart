import 'dart:convert';

List<QuizModel> quizModelFromJson(String str) =>
    List<QuizModel>.from(json.decode(str).map((x) => QuizModel.fromJson(x)));

String quizModelToJson(List<QuizModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizModel {
  QuizModel({
    required this.title,
    required this.imagem,
    required this.questionAnswered,
    required this.level,
    required this.questions,
  });

  String title;
  String imagem;
  int questionAnswered;
  String level;
  List<Question> questions;

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        title: json["title"],
        imagem: json["imagem"],
        questionAnswered: json["questionAnswered"],
        level: json["level"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "imagem": imagem,
        "questionAnswered": questionAnswered,
        "level": level,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  Question({
    required this.title,
    required this.answers,
  });

  String title;
  List<Answer> answers;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        title: json["title"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
      };
}

class Answer {
  Answer({
    required this.title,
    required this.isRight,
  });

  String title;
  bool isRight;

  factory Answer.fromJson(Map<String, dynamic> json) =>
      Answer(title: json["title"], isRight: json["isRight"]);

  Map<String, dynamic> toJson() => {"title": title, "isRight": isRight};
}
