import 'package:equatable/equatable.dart';

abstract class BluetoothEvent extends Equatable {
  const BluetoothEvent();

  @override
  List<Object?> get props => [];
}

class CheckBluetoothStatusEvent extends BluetoothEvent {}

class ToggleBluetoothEvent extends BluetoothEvent {}

class RequestPermissionEvent extends BluetoothEvent {}