import 'package:flutter/services.dart';

class ScanService {
  static const MethodChannel _channel = MethodChannel('lidar_scan');

  /// Start the LiDAR scan and get the scan data
  Future<String> startScan() async {
    try {
      final String result = await _channel.invokeMethod('startScan');
      return result;
    } on PlatformException catch (e) {
      return "Error: ${e.message}";
    }
  }
}
