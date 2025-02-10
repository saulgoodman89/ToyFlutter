import 'package:flutter/material.dart';
import 'package:toy_flutter/Bloc/bloc_counter_screen.dart';
import 'package:toy_flutter/GetX/get_screen.dart';
import 'package:toy_flutter/code_canvas.dart';

import 'async/future_ex.dart';

void main() {
  runApp(Directionality(textDirection: TextDirection.ltr, child: CodeCanvas()));
}