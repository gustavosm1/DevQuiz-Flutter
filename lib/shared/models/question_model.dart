import 'dart:convert';

import 'package:devquiz/shared/models/answer_model.dart';

class QuestionModel {
  final String tittle;
  final List<AnswerModel> answers;

  QuestionModel({required this.tittle, required this.answers})
      : assert(
          answers.length == 4,
        );

  Map<String, dynamic> toMap() {
    return {
      'tittle': tittle,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      tittle: map['tittle'],
      answers: List<AnswerModel>.from(
          map['answers']?.map((x) => AnswerModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}
