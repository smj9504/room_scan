import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modules/scan/scan_controller.dart';
import 'modules/scan/scan_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScanController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScanScreen(),
    );
  }
}
