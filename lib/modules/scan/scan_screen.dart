import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'scan_controller.dart';

class ScanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanController = Provider.of<ScanController>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Room Scanner')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => scanController.startScan(),
              child: Text("Start Scan"),
            ),
            SizedBox(height: 20),
            Text(scanController.scanResult, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
