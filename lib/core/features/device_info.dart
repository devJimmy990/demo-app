import 'dart:io';
import 'package:demo_app/data/model/device_info_model.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  static final DeviceInfo _instance = DeviceInfo._();
  late DeviceInfoModel _deviceData;

  DeviceInfo._() {
    _getDeviceInfo();
  }

  factory DeviceInfo() => _instance;

  DeviceInfoModel get info => _deviceData;

  _getDeviceInfo() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        await _getAndroidDeviceInfo(deviceInfo);
      } else if (Platform.isIOS) {
        await _getIOSDeviceInfo(deviceInfo);
      }
    } catch (e) {
      rethrow;
    }
  }

  _getAndroidDeviceInfo(DeviceInfoPlugin deviceInfo) async {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    _deviceData = DeviceInfoModel(
      id: androidInfo.id,
      model: androidInfo.model,
      brand: androidInfo.brand,
      hardware: androidInfo.hardware,
      version: androidInfo.version.release,
      manufacturer: androidInfo.manufacturer,
      sdkVersion: androidInfo.version.sdkInt.toString(),
      type: androidInfo.isPhysicalDevice ? "Physical" : "Emulator",
    );
  }

  _getIOSDeviceInfo(DeviceInfoPlugin deviceInfo) async {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    _deviceData = DeviceInfoModel(
      brand: "Apple",
      manufacturer: "Apple",
      hardware: iosInfo.model,
      sdkVersion: iosInfo.systemName,
      model: iosInfo.utsname.machine,
      version: iosInfo.systemVersion,
      id: iosInfo.identifierForVendor ?? "Unknown",
      type: iosInfo.isPhysicalDevice ? "Physical" : "Emulator",
    );
  }
}
