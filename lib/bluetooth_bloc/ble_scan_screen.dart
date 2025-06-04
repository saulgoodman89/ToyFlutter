import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'ble_scan_cubit.dart';

class BleScanScreen extends StatelessWidget {
  const BleScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BleScanCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('BLE 스캔')),
        body: Column(
          children: [
            // BLE 장치 리스트
            Expanded(
              child: BlocBuilder<BleScanCubit, BleScanState>(
                builder: (context, state) {
                  if (state.isScanning && state.devices.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state.devices.isEmpty) {
                    return const Center(child: Text("검색된 BLE 장치가 없습니다."));
                  }

                  return ListView.builder(
                    itemCount: state.devices.length,
                    itemBuilder: (context, index) {
                      final device = state.devices[index];
                      return ListTile(
                        title: Text(device.name.isNotEmpty ? device.name : "알 수 없는 장치"),
                        subtitle: Text(device.id.toString()),
                        trailing: const Icon(Icons.bluetooth),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // 스캔 버튼
            BlocBuilder<BleScanCubit, BleScanState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    if (state.isScanning) {
                      context.read<BleScanCubit>().stopScan();
                    } else {
                      context.read<BleScanCubit>().startScan();
                    }
                  },
                  child: Text(state.isScanning ? "스캔 중지" : "BLE 스캔 시작"),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}