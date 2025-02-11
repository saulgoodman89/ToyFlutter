import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toy_flutter/bluetooth_bloc/bluetooth_bloc.dart';
import 'package:toy_flutter/bluetooth_bloc/bluetooth_state.dart';
import 'package:toy_flutter/bluetooth_bloc/bt_repository.dart';

class BtStatusScreen extends StatelessWidget {
  final  BtRepository _btRepository = BtRepository();
  @override
  Widget build(BuildContext context) {
      return BlocProvider(create: (context) => BluetoothBloc(repository: _btRepository),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bloc 테스트용'),
        ),
        body: Center(
          child: BlocBuilder<BluetoothBloc,BluetoothState> (builder: (context,state){
              return Center(
                child: Text(state.props.toString()),
              );
          }),
        )
      ),
      );
  }
}