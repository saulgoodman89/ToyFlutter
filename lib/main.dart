import 'package:flutter/material.dart';
import 'package:toy_flutter/Bloc/bloc_counter_screen.dart';
import 'package:toy_flutter/GetX/get_screen.dart';
import 'package:toy_flutter/bluetooth_bloc/bt_status_screen.dart';
import 'package:toy_flutter/code_canvas.dart';
import 'package:toy_flutter/custom_widget/radar_widget.dart';

import 'async/future_ex.dart';

void main() {
  runApp(
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
  );
}