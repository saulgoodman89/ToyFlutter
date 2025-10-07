import 'package:dartz/dartz.dart';
import 'package:toy_flutter/ca/core/error/failure.dart';
import 'package:toy_flutter/ca/core/usecase/usecase.dart';
import 'package:toy_flutter/ca/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:toy_flutter/ca/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia,GetConcreteNumberTriviaParams> {
  final NumberTriviaRepository repo;
  GetConcreteNumberTrivia(this.repo);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return repo.getConcreteNumberTrivia(p.number);
  }
}