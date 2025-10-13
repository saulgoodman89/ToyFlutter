import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toy_flutter/ca/core/error/failure.dart';
import 'package:toy_flutter/ca/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:toy_flutter/ca/features/number_trivia/domain/usecaes/get_concrete_number_trivia.dart';
import 'package:toy_flutter/ca/features/number_trivia/presentation/bloc/number_trivia_event.dart';
import 'package:toy_flutter/ca/features/number_trivia/presentation/bloc/number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getTrivia;

  NumberTriviaBloc(this.getTrivia) : super(NumberTriviaInitial()) {
    on<FetchNumberTrivia>((event, emit) async {
      emit(NumberTriviaLoading());
      final result = await getTrivia(GetConcreteNumberTriviaParams(event.number));
      result.fold(
            (Failure f) => emit(NumberTriviaError(f.message)),
            (NumberTrivia trivia) => emit(NumberTriviaLoaded(trivia)),
      );
    });
  }
}