import 'package:flutter/material.dart';
import 'package:belanja/pages/home_page.dart';
import 'package:belanja/pages/item_page.dart';
import 'package:belanja/models/item.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    onGenerateRoute: (settings) {
      if (settings.name == '/item') {
        final item = settings.arguments as Item; // Ambil argumen item
        return MaterialPageRoute(
          builder: (context) => ItemPage(item: item), // Kirim item ke ItemPage
        );
      }
      return null;
    },
    routes: {
      '/': (context) => HomePage(),
    },
  ));
}
