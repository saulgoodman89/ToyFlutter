import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class BlocExerciseScreen extends StatelessWidget {
  const BlocExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*
        BlockProvider
          앱 트리 중간에 Bloc 인스턴스를 제공하고 관리하기 위한 Widget
          - 지연생성 가능
          - 하위 계층 위젯 접근 가능
          - Bloc 생성 후 메모리 반환은 자동으로 진행.
       */
      home: BlocProvider(
        create: (context) => CounterBloc(), // CounterBloc 생성
        child: Center(
          /*
            BlocBuilder
              BlocProvider를 이용해 생성된 Bloc를 사용하는 widget
              Bloc 옵션 미설정 시 현 context로 bloc를 찾아 변화를 감지.
           */
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.count}',
                    style: const TextStyle(fontSize: 50),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FloatingActionButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(DecrementEvent());  // IncrementEvent를 발생시켜 CounterBloc 내 Status의 Count 값이 증가하고 UI가 변경됨.
                        },
                        child: const Icon(Icons.remove),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(IncrementEvent());
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}