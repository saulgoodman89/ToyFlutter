import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toy_flutter/bluetooth_bloc/bluetooth_bloc.dart';
import 'package:toy_flutter/bluetooth_bloc/bluetooth_state.dart';
import 'package:toy_flutter/bluetooth_bloc/bt_repository.dart';

class BtStatusScreen extends StatelessWidget {
  final BtRepository _btRepository = BtRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BluetoothBloc(repository: _btRepository),
      child: Scaffold(
        body: Center(
          child: BlocBuilder<BluetoothBloc, BluetoothState>(
            builder: (context, state) {
              if (state is BluetoothInitial) {
                return const Center(child: CircularProgressIndicator()); // 로딩 표시
              } else if (state is BluetoothStatusState) {
                return Center(
                  child: Text(
                      'Bluetooth On: ${state.bluetoothOn}, Permissions Granted: ${state.permissionsGranted}'),
                );
              } else if (state is BluetoothErrorState) {
                return Center(child: Text('Error: ${state.error}'));
              } else {
                return const Center(child: Text('Unknown State'));
              }
            },
          ),
        ),
      ),
    );
  }
}