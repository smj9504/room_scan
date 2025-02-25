import 'package:flutter/material.dart';
import 'scan_service.dart';

class ScanController extends ChangeNotifier {
  final ScanService _scanService = ScanService();
  String scanResult = "No scan data";

  /// Trigger scan and update UI
  Future<void> startScan() async {
    scanResult = await _scanService.startScan();
    notifyListeners();
  }
}
