import 'package:flutter/material.dart';
import 'package:pbl_mobile/widgets/sidebar.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil Pengguna')),
      drawer: Sidebar(),
      body: Center(child: Text('Halaman Profil Pengguna')),
    );
  }
}