import 'dart:convert';

class AnswerModel {
  final String tittle;
  final bool isRight;

  AnswerModel({
    required this.tittle,
    this.isRight = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'tittle': tittle,
      'isRight': isRight,
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      tittle: map['tittle'],
      isRight: map['isRight'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source));
}
