import 'package:equatable/equatable.dart';
import 'package:toy_flutter/ca/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaState extends Equatable {
  const NumberTriviaState();
  @override
  List<Object?> get props => [];
}

class NumberTriviaInitial extends NumberTriviaState {}

class NumberTriviaLoading extends NumberTriviaState {}

class NumberTriviaLoaded extends NumberTriviaState {
  final NumberTrivia trivia;
  const NumberTriviaLoaded(this.trivia);
  @override
  List<Object?> get props => [trivia];
}

class NumberTriviaError extends NumberTriviaState {
  final String message;
  const NumberTriviaError(this.message);
  @override
  List<Object?> get props => [message];
}