import 'dart:async';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  String _batteryLevel = 'Unknown battery level.';

  String deviceInfo = "Device Info:";

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Platform Specific"),
        ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_batteryLevel),
                  Text(
                    deviceInfo,
                    style: TextStyle(
                      fontSize: 18),
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          width: 120,
          child: Row(
            children: [
              FloatingActionButton(
                onPressed: () async {
                  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

                  AndroidDeviceInfo androidDeviceInfo =
                  await deviceInfoPlugin.androidInfo;

                  setState(() {
                    deviceInfo += "ID: ${androidDeviceInfo.id}\n";
                    deviceInfo += "VERSION: ${androidDeviceInfo.version.sdkInt}\n";
                    deviceInfo += "TYPE: ${androidDeviceInfo.type}\n";
                    deviceInfo += "MODEL: ${androidDeviceInfo.model}\n";
                    deviceInfo +=
                    "MANUFACTURER: ${androidDeviceInfo.manufacturer}\n";
                    deviceInfo +=
                    "SERIAL NUMBER: ${androidDeviceInfo.serialNumber}\n";
                    deviceInfo += "DEVICE: ${androidDeviceInfo.device}\n";
                  });
                },
                child: const Icon(Icons.mobile_friendly),
              ),
              FloatingActionButton(
                onPressed: () {
                  _getBatteryLevel();
                },
                child: const Icon(Icons.battery_0_bar),
              ),
            ],
          ),
        ),);
  }
}
