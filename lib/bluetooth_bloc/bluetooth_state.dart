import 'package:equatable/equatable.dart';

abstract class BluetoothState extends Equatable {
  const BluetoothState();

  @override
  List<Object?> get props => [];
}

class BluetoothInitial extends BluetoothState {}

class BluetoothStatusState extends BluetoothState {
  final bool bluetoothOn;
  final bool permissionsGranted;

  const BluetoothStatusState({
    required this.bluetoothOn,
    required this.permissionsGranted,
  });

  @override
  List<Object?> get props => [bluetoothOn, permissionsGranted];
}

class BluetoothErrorState extends BluetoothState {
  final String error;

  const BluetoothErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}