import 'package:flutter/material.dart';
import 'screens/loading.dart';
import 'screens/homePage.dart';  // Pastikan untuk mengimpor halaman HomePage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoadingPage(), // Panggil halaman loading
    );
  }
}
