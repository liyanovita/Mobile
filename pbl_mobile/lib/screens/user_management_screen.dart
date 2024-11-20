import 'package:flutter/material.dart';
import 'package:pbl_mobile/widgets/sidebar.dart';

class UserManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kelola Pengguna')),
      drawer: Sidebar(),
      body: Center(child: Text('Halaman Kelola Pengguna')),
    );
  }
}