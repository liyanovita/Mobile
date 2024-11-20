import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // Removed const constructor because of non-constant fields
  HomePage({Key? key}) : super(key: key);

  // Data untuk kategori
  final List<String> _categoryTitles = ['Dashboard', 'Kelola', 'Administrasi', 'Pengaturan'];
  final List<IconData> _categoryIcons = [
    Icons.dashboard,
    Icons.work,
    Icons.document_scanner,
    Icons.settings
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_picture.jpg'), // Ganti dengan foto pengguna
              radius: 20,
            ),
            const SizedBox(width: 10),
            Text(
              'Halo, Liya Novitasari',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sistem Informasi SDM',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'POLINEMA',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue[700],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Kategori',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // GridView untuk menampilkan kategori
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: 4,
              shrinkWrap: true, // Untuk menyesuaikan ukuran
              itemBuilder: (context, index) {
                return CategoryCard(
                  title: _categoryTitles[index],
                  icon: _categoryIcons[index],
                  onTap: () {
                    // Navigasi atau aksi yang diinginkan
                    print('Navigasi ke ${_categoryTitles[index]}');
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // Tambahkan logika navigasi untuk tab bawah
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  CategoryCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue[50],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.blue[900],
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
