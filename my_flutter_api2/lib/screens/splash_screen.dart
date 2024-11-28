import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';  // Import Lottie package
import '../providers/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    // Memberikan waktu delay sebelum melakukan pengecekan login
    await Future.delayed(const Duration(seconds: 3));  // Durasi delay agar splash screen terlihat

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.loadUser();  // Pastikan loadUser selesai
    if (authProvider.user != null) {
      Navigator.of(context).pushReplacementNamed('/profile');
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menambahkan animasi Lottie
            Lottie.asset(
              'assets/animation/splash_animation.json',  // Path ke file JSON animasi Lottie
              width: 200,
              height: 200,
              fit: BoxFit.cover,
              onLoaded: (composition) {
                print('Lottie animation loaded successfully!');
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to My Flutter App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}