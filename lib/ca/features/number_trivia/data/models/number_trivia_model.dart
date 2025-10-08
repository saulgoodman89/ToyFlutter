import 'package:toy_flutter/ca/features/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  const NumberTriviaModel({required super.number, required super.text});

  factory NumberTriviaModel.fromJson(Map<String,dynamic> json) {
    return NumberTriviaModel(
      number: json['number'] as int,
      text: json['text'] as String,
    );
  }

  Map<String , dynamic> toJson() => {'number' : number , 'text' : text};
}