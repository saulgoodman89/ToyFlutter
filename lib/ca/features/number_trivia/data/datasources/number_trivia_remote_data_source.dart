import 'package:toy_flutter/ca/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
}

class NumberTriviaRemoteDataSourceStub implements NumberTriviaRemoteDataSource {
  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
      await Future.delayed(const Duration(milliseconds: 400));
      return NumberTriviaModel(
        number: number,
          text: 'Number $number is awesome in math!'
      );
  }

}