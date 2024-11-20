import 'package:flutter/material.dart';
import 'package:pbl_mobile/widgets/sidebar.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      drawer: Sidebar(),
      body: Center(child: Text('Selamat datang di Dashboard')),
    );
  }
}