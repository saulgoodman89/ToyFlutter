import 'package:dartz/dartz.dart';
import 'package:toy_flutter/ca/core/error/failure.dart';
import 'package:toy_flutter/ca/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:toy_flutter/ca/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:toy_flutter/ca/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remote;

  NumberTriviaRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) async {
    try {
      final model = await remote.getConcreteNumberTrivia(number);
      return Right(model); // model은 Entity를 상속하므로 그대로 반환 가능
    } catch (_) {
      return const Left(ServerFailure());
    }
  }
}