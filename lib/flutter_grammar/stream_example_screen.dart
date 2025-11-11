import 'dart:async';

import 'package:flutter/material.dart';

class StreamExampleScreen extends StatefulWidget {
    @override
    _StreamExampleScreenState createState() => _StreamExampleScreenState();
}

class _StreamExampleScreenState extends State<StreamExampleScreen> {
  late StreamController<int> _controller;
  late Stream<int> _stream;
  int _counter = 0;
  Timer? _timer;


  @override
  void initState() {
    super.initState();
      print("GomiSeuda initState");
      _controller = StreamController<int>();
      _stream = _controller.stream;

      _timer = Timer.periodic(Duration(seconds: 1), (_) {
        _counter++;
        _controller.sink.add(_counter);
      });
  }


  /*
  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("GomiSeuda DidUpdateWidget");
  }*/

  @override
  void deactivate() {
    print("GomiSeuda deactivate");
  }

  @override
  void dispose() {
    print("GomiSeuda dispose");
  }

  @override
  void didChangeDependencies() {
    print("GomiSeuda didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stream Example')),
      body: Center(
        child: StreamBuilder<int>(
          stream: _stream,
          initialData: 0,
          builder: (context, snapshot) {
            return Text(
              'Count: ${snapshot.data}',
              style: TextStyle(fontSize: 32),
            );
          },
        ),
      ),
    );
  }
}