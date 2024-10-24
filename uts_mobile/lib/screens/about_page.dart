import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Page')),
      backgroundColor: Color.fromARGB(255, 214, 211, 211), // Warna background halaman
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Atur agar konten mulai dari atas
        crossAxisAlignment: CrossAxisAlignment.center, // Pusatkan secara horizontal
        children: [
          SizedBox(height: 20), // Memberi jarak dari AppBar
          Text(
            'SIMAKSI App',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20), // Memberi jarak antara judul dan deskripsi
          Padding(
            padding: const EdgeInsets.all(16.0), // Memberi padding agar tidak menempel di pinggir layar
            child: Text(
              'SIMAKSI (Sistem Perizinan Masuk Kawasan Konservasi) adalah sebuah aplikasi yang dirancang untuk memudahkan proses perizinan bagi masyarakat yang ingin memasuki kawasan konservasi, seperti taman nasional, cagar alam, atau area perlindungan lainnya. Aplikasi ini bertujuan untuk mengatur dan memonitor aktivitas di kawasan konservasi guna menjaga kelestarian lingkungan dan mencegah kerusakan ekosistem.',
              textAlign: TextAlign.center, // Pusatkan teks secara horizontal
            ),
          ),
        ],
      ),
    );
  }
}
