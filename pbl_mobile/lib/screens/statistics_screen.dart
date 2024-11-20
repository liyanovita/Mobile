import 'package:flutter/material.dart';
import 'package:pbl_mobile/widgets/sidebar.dart';

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistik')),
      drawer: Sidebar(),
      body: Center(child: Text('Halaman Statistik')),
    );
  }
}