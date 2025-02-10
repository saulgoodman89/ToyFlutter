import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toy_flutter/async/future_ex.dart';

class CodeCanvas extends StatefulWidget {
  @override
  _CodeCanvasState createState() => _CodeCanvasState();
}

class _CodeCanvasState extends State<CodeCanvas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }

  @override
  void didChangeDependencies() {


  }

  @override
  void dispose() {

  }

  @override
  void deactivate() {

  }

  @override
  void initState() {
    FutureExample fe = FutureExample();
    fe.mainAsync();
  }
}