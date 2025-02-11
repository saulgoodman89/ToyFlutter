import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class BtRepository {

  /*
    25.02.10 KEG
    스트림을 구독하여 BLuetooth 상태가 변경 될 때 마다 새로운 이벤트가 발생하여 블루투스 상태(On, TurningOn , Off , TurningOff)를 가져온다.

  Future<bool> isBluetoothOn() async {
    FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) async {
      print("KEG state : $state");
      if (state == BluetoothAdapterState.on) {
          return Future.value(true);
      } else {
          if(Platform.isAndroid) {
            return Future.value(false);
          }
      }
    });
    return Future.value(false);
  } */


  /* 블루투스 On/Off를 1회성으로 확인. */
  Future<bool> isBluetoothOn() async {
    BluetoothAdapterState state = await FlutterBluePlus.adapterState.first;
    print("KEG state : $state");
    return state == BluetoothAdapterState.on;
  }


  Future<bool> arePermissionsGranted() async {
    // permission_handler를 통해 BLUETOOTH_SCAN, BLUETOOTH_CONNECT 권한 상태를 체크합니다.
    final PermissionStatus scanStatus = await Permission.bluetoothScan.status;
    final PermissionStatus connectStatus = await Permission.bluetoothConnect.status;
    return scanStatus.isGranted && connectStatus.isGranted;
  }

  /*
    25.02.10 KEG 블루투스 설정 화면으로 이동한다.
  * */
  Future<void> requestBluetoothOn() async {
    // app_settings 패키지를 이용해 블루투스 설정 화면으로 이동합니다.
    await AppSettings.openAppSettings(type: AppSettingsType.bluetooth);
  }

  /*
    25.02.10 KEG
    Android 13 이상 블루투스 권한 요청
   */
  Future<bool> requestPermissions() async {
    final Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
    ].request();

    final bool granted = statuses[Permission.bluetoothScan]?.isGranted == true &&
        statuses[Permission.bluetoothConnect]?.isGranted == true;
    return granted;
  }

  /*
    25.02.11 KEG
    Bluetooth On,Off와 권한이 체크 되었는지 확인
   */
  Future<bool> isReadyToBluetooth() async {
    bool isBTOn = await isBluetoothOn();
    bool isPermissionGranted = await  arePermissionsGranted();
    return isBTOn && isPermissionGranted;
  }
}