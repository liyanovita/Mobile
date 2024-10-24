import 'package:flutter/material.dart';
import 'screens/landing_page.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';
import 'screens/about_page.dart';
import 'screens/profile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIMAKSI',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/about': (context) => AboutPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
    
  }
  
}
