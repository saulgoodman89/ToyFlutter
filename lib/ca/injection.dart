import 'package:get_it/get_it.dart';
import 'package:toy_flutter/ca/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:toy_flutter/ca/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:toy_flutter/ca/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:toy_flutter/ca/features/number_trivia/domain/usecaes/get_concrete_number_trivia.dart';
final sl = GetIt.instance; // service locator

Future<void> initDependencies() async {
  // DataSources
  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
        () => NumberTriviaRemoteDataSourceStub(),
  );

  // Repository
  sl.registerLazySingleton<NumberTriviaRepository>(
        () => NumberTriviaRepositoryImpl(remote: sl()),
  );

  // UseCases
  sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
}