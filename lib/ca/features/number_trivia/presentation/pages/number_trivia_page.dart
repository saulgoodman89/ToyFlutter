import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toy_flutter/ca/features/number_trivia/presentation/bloc/number_trivia_event.dart';
import 'package:toy_flutter/ca/features/number_trivia/presentation/bloc/number_trivia_state.dart';
import '../bloc/number_trivia_bloc.dart';

class NumberTriviaPage extends StatefulWidget {
  const NumberTriviaPage({super.key});

  @override
  State<NumberTriviaPage> createState() => _NumberTriviaPageState();
}

class _NumberTriviaPageState extends State<NumberTriviaPage> {
  final _controller = TextEditingController(text: '13');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clean Architecture Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
              builder: (context, state) {
                if (state is NumberTriviaLoading) {
                  return const LinearProgressIndicator();
                }
                if (state is NumberTriviaLoaded) {
                  return Text(
                    '${state.trivia.number} : ${state.trivia.text}',
                    style: const TextStyle(fontSize: 18),
                  );
                }
                if (state is NumberTriviaError) {
                  return Text('Error: ${state.message}',
                      style: const TextStyle(color: Colors.red));
                }
                return const Text('숫자를 입력하고 조회해보세요!');
              },
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final n = int.tryParse(_controller.text) ?? 0;
                  context.read<NumberTriviaBloc>().add(FetchNumberTrivia(n));
                },
                child: const Text('조회'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}