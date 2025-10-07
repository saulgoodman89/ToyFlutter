import 'package:dartz/dartz.dart';
import 'package:toy_flutter/ca/core/error/failure.dart';
import 'package:toy_flutter/ca/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure,NumberTrivia>> getConcreteNumberTrivia(int number);
}