import 'package:flutter/material.dart';
import 'package:pbl_project_fix/screens/login.dart'; // Pastikan impor LoginPage

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nipController = TextEditingController();
    final TextEditingController birthdateController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Container(
          width: 300, // Sama dengan lebar di LoginPage
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Lupa Password',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 24, // Sama dengan ukuran font di LoginPage
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // NIP Field
              TextField(
                controller: nipController,
                decoration: InputDecoration(
                  labelText: 'NIP',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Tanggal Lahir Field
              TextField(
                controller: birthdateController,
                decoration: InputDecoration(
                  labelText: 'Tanggal Lahir (DD/MM/YYYY)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 10),

              // Email Field
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email Pemulihan',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // Tombol Kirim Email
              ElevatedButton(
                onPressed: () {
                  // Validasi data yang dimasukkan
                  final String nip = nipController.text;
                  final String birthdate = birthdateController.text;
                  final String email = emailController.text;

                  if (nip.isNotEmpty && birthdate.isNotEmpty && email.isNotEmpty) {
                    // Jika data valid, kirimkan email pemulihan (sederhana saja untuk demo)
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Permintaan Pemulihan'),
                        content: const Text(
                            'Email pemulihan telah dikirim ke email Anda.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Tutup dialog
                              // Navigasi kembali ke halaman login
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Jika ada data yang kosong
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Gagal'),
                        content: const Text(
                            'Harap isi semua kolom untuk pemulihan password.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Tutup dialog
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('PROSES'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
