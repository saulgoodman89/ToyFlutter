import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleScanState {
  final List<BluetoothDevice> devices;
  final bool isScanning;

  BleScanState({required this.devices, required this.isScanning});
}

class BleScanCubit extends Cubit<BleScanState> {
  BleScanCubit() : super(BleScanState(devices: [], isScanning: false));

  final FlutterBluePlus flutterBlue = FlutterBluePlus();

  /// BLE 스캔 시작
  void startScan() async {
    if (state.isScanning) return;

    emit(BleScanState(devices: [], isScanning: true));

    FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));

    FlutterBluePlus.scanResults.listen((results) {
      Set<BluetoothDevice> uniqueDevices ={};
      print("KEG result : $results[0]");
      for (var result in results) {
        uniqueDevices.add(result.device);
      }

      emit(BleScanState(devices: uniqueDevices.toList(), isScanning: true));
    });

    await Future.delayed(const Duration(seconds: 5));

    stopScan();
  }

  /// BLE 스캔 중지
  void stopScan() {
    FlutterBluePlus.stopScan();
    emit(BleScanState(devices: state.devices, isScanning: false));
  }
}