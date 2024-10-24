import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String username = ModalRoute.of(context)?.settings.arguments as String? ?? 'Guest'; 

    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      backgroundColor: Color.fromARGB(255, 214, 211, 211), // Warna coklat muda (tan)
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Foto Profil dengan ClipOval untuk memastikan gambar full
              ClipOval(
                child: Image.asset(
                  'assets/profile_picture.png', // Ganti dengan asset foto profil kamu
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover, // Mengatur agar gambar menutupi area lingkaran
                ),
              ),
              SizedBox(height: 20),
              // Teks selamat datang
              Text(
                'Welcome to your profile!',
                style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 8),
              // Nama
              Text(
                '$username',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Email dengan Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center Row
                children: [
                  Icon(Icons.email, color: Colors.black), // Ikon email
                  SizedBox(width: 10),
                  Text(
                    '$username@gmail.com', // Ganti dengan email dinamis sesuai kebutuhan
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Phone Number dengan Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center Row
                children: [
                  Icon(Icons.phone, color: Colors.black), // Ikon telepon
                  SizedBox(width: 10),
                  Text(
                    '+62 812 3456 7890', // Ganti dengan nomor telepon dinamis sesuai kebutuhan
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 30),
              // Tombol Logout
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                },
                child: Text('Logout'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
