import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toy_flutter/bluetooth_bloc/bluetooth_event.dart';
import 'package:toy_flutter/bluetooth_bloc/bluetooth_state.dart';
import 'package:toy_flutter/bluetooth_bloc/bt_repository.dart';

import 'bluetooth_state.dart';

class BluetoothBloc extends Bloc<BluetoothEvent, BluetoothState> {
  final BtRepository repository;

  BluetoothBloc({required this.repository}) : super(BluetoothInitial()) {
    on<CheckBluetoothStatusEvent>(_onCheckBluetoothStatus);
    on<ToggleBluetoothEvent>(_onToggleBluetooth);
    on<RequestPermissionEvent>(_onRequestPermission);
  }

  Future<void> _onCheckBluetoothStatus(
      CheckBluetoothStatusEvent event, Emitter<BluetoothState> emit) async {
    try {
      final bluetoothOn = await repository.isBluetoothOn();
      final permissionsGranted = await repository.arePermissionsGranted();
      emit(BluetoothStatusState(
          bluetoothOn: bluetoothOn, permissionsGranted: permissionsGranted));
    } catch (e) {
      emit(BluetoothErrorState(error: e.toString()));
    }
  }

  Future<void> _onToggleBluetooth(
      ToggleBluetoothEvent event, Emitter<BluetoothState> emit) async {
    try {
      await repository.requestBluetoothOn();
      // 재확인 후 상태 업데이트
      final bluetoothOn = await repository.isBluetoothOn();
      final permissionsGranted = await repository.arePermissionsGranted();
      emit(BluetoothStatusState(
          bluetoothOn: bluetoothOn, permissionsGranted: permissionsGranted));
    } catch (e) {
      emit(BluetoothErrorState(error: e.toString()));
    }
  }

  Future<void> _onRequestPermission(
      RequestPermissionEvent event, Emitter<BluetoothState> emit) async {
    try {
      await repository.requestPermissions();
      // 재확인 후 상태 업데이트
      final bluetoothOn = await repository.isBluetoothOn();
      final permissionsGranted = await repository.arePermissionsGranted();
      emit(BluetoothStatusState(
          bluetoothOn: bluetoothOn, permissionsGranted: permissionsGranted));
    } catch (e) {
      emit(BluetoothErrorState(error: e.toString()));
    }
  }
}