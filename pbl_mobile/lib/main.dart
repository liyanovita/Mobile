import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(SDMApp());
}

class SDMApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistem Informasi SDM',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DashboardScreen(),
    );
  }
}