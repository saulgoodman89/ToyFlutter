import 'package:equatable/equatable.dart';

abstract class NumberTriviaEvent extends Equatable {
  const NumberTriviaEvent();
  @override
  List<Object?> get props => [];
}

class FetchNumberTrivia extends NumberTriviaEvent {
  final int number;
  const FetchNumberTrivia(this.number);

  @override
  List<Object?> get props => [number];
}