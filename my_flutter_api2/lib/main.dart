import 'package:flutter/material.dart';
import 'package:my_flutter_api2/providers/auth_provider.dart';
import 'package:my_flutter_api2/screens/login_screen.dart';
import 'package:my_flutter_api2/screens/profil_screen.dart';
import 'package:my_flutter_api2/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'My Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: {
          '/login': (context) => LoginScreen(),
          '/profile': (context) => ProfileScreen(),
        },
      ),
    );
  }
}