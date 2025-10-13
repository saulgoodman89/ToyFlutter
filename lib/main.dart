import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toy_flutter/Bloc/bloc_counter_screen.dart';
import 'package:toy_flutter/GetX/get_screen.dart';
import 'package:toy_flutter/bluetooth_bloc/bt_status_screen.dart';
import 'package:toy_flutter/ca/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:toy_flutter/ca/features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'package:toy_flutter/ca/injection.dart' as di;
import 'package:toy_flutter/code_canvas.dart';
import 'package:toy_flutter/custom_widget/radar_widget.dart';
import 'package:toy_flutter/flutter_grammar/operator.dart';
import 'package:toy_flutter/grammar/mixin/manager.dart';

import 'async/future_ex.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initDependencies();
  runApp(const MyApp());
/*  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('레이더 애니메이션 예제')),
        body: Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: RadarWidget(
              radarColor: Colors.green.shade200,
              sweepColor: Colors.green.withOpacity(0.5),
              sweepSize: 60,
              sweepSpeed: 3,
            ),
          ),
        ),
      ),
    ),
  );*/
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => NumberTriviaBloc(di.sl()),
        child: const NumberTriviaPage(),
      ),
    );
  }
}