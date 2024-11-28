import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String? user; // Menyimpan informasi pengguna (bisa disesuaikan sesuai kebutuhan)

  Future<void> loadUser() async {
    // Logika untuk memuat data pengguna yang sudah login, misalnya dari SharedPreferences atau API
    // Ini hanya contoh, sesuaikan dengan logika autentikasi yang Anda gunakan
    await Future.delayed(const Duration(seconds: 2));  // Simulasi proses loading
    // Misalnya jika ada data pengguna yang sudah login
    user = 'user';  // Ganti dengan logika yang lebih sesuai
    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    // Logika login
    if (username == 'Test User' && password == 'password123') {
      user = 'Test User';  // Set pengguna yang berhasil login
      notifyListeners();
    } else {
      throw Exception('Invalid credentials');  // Error jika login gagal
    }
  }

  Future<void> logout() async {
    user = null; // Menghapus data pengguna
    notifyListeners();
  }
}