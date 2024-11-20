import 'package:flutter/material.dart';
import 'package:pbl_mobile/widgets/sidebar.dart';


class DocumentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dokumen')),
      drawer: Sidebar(),
      body: Center(child: Text('Halaman Dokumen')),
    );
  }
}