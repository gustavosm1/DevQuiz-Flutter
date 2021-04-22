import 'dart:convert';

import 'package:devquiz/shared/models/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get parse => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.facil: "facil",
        Level.medio: "medio",
        Level.dificil: "dificil",
        Level.perito: "perito",
      }[this]!;
}

class QuizModel {
  final String tittle;
  final List<QuestionModel> questions;
  final int questionanswered;
  final String imagem;
  final Level level;

  QuizModel({
    required this.tittle,
    required this.questions,
    this.questionanswered = 0,
    required this.imagem,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'tittle': tittle,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionanswered': questionanswered,
      'imagem': imagem,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      tittle: map['tittle'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionanswered: map['questionanswered'],
      imagem: map['imagem'],
      level: map['level'].toString().parse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
