import 'package:flutter/material.dart';
import 'package:pbl_mobile/widgets/sidebar.dart';

class ActivitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kegiatan')),
      drawer: Sidebar(),
      body: Center(child: Text('Halaman Kegiatan')),
    );
  }
}