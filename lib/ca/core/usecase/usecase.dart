import 'package:dartz/dartz.dart';
import 'package:toy_flutter/ca/core/error/failure.dart';

abstract class UseCase<Out , In> {
  Future<Either<Failure, Out>> call(In params);
}

class NoParams {
  const NoParams();
}