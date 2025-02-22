import 'package:demo_app/core/shared_preference.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Biometric {
  static Biometric? _instance;
  static late LocalAuthentication _auth;
  static late bool _isBiometricAvailable;
  static late List<BiometricType> _availableBiometrics;

  Biometric._() {
    _auth = LocalAuthentication();
    checkBiometricAvailability();
  }

  static Future<void> initialize() async {
    _instance ??= Biometric._();
  }

  static Future<void> checkBiometricAvailability() async {
    try {
      print("credential: ${SharedPreference.getString(key: "credential")}");
      _isBiometricAvailable = SharedPreference.getString(key: "credential") !=
              null &&
          (await _auth.canCheckBiometrics || await _auth.isDeviceSupported());
      print("_isBiometricAvailable: $_isBiometricAvailable");
    } on PlatformException catch (e) {
      print("Error checking biometric availability: $e");
      _isBiometricAvailable = false;
    }
  }

  static Future<bool> authenticate({String? localizedReason}) async {
    if (!_isBiometricAvailable) {
      print("Biometric authentication is not available on this device.");
      return false;
    }

    try {
      bool authenticated = await _auth.authenticate(
        localizedReason: localizedReason ?? 'Authenticate to access the app',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
          useErrorDialogs: true,
        ),
      );

      return authenticated;
    } on PlatformException catch (e) {
      print("Error during biometric authentication: $e");
      return false;
    }
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      _availableBiometrics = await _auth.getAvailableBiometrics();
      return _availableBiometrics;
    } on PlatformException catch (e) {
      print("Error getting available biometrics: $e");
      _availableBiometrics = [];
      return [];
    }
  }

  Future<bool> isBiometricEnrolled() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print("Error checking biometric enrollment: $e");
      return false;
    }
  }

  static bool get isAvailable => _isBiometricAvailable;

  static List<BiometricType> get availableBiometrics => _availableBiometrics;
}
