import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Membuat kolom bagian kiri pada judul
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Gunung Buthak',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Batu, Malang, Indonesia',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    // Deklarasi buttonSection tepat di bawah titleSection
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // Langkah 1: Buat widget textSection
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Gunung Buthak adalah sebuah gunung berapi kerucut yang terletak' 
        ' di perbatasan Kabupaten Malang dan Kabupaten Blitar dalam wilayah Provinsi Jawa Timur,' 
        'Indonesia. Gunung Buthak terletak berdekatan dengan Gunung Kawi. Tidak diketemukan catatan '
        'sejarah atas erupsi dari Gunung Buthak sampai saat ini. '
        'Gunung ini berada pada posisi -7,922566˚ dan 112,451688˚ dengan ketinggial 2.868 mdpl(9,409 ft).'

        ' Liya Novitasari 2241760006',
        softWrap: true, // Teks akan dibungkus otomatis jika terlalu panjang
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView( // Mengubah dari Column ke ListView agar bisa di-scroll jika konten terlalu banyak
          children: [
            Image.asset(
              'images/buthak.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,  // Bagian judul
            buttonSection, // Bagian tombol
            textSection,   // Bagian teks
            const Center(
              child: Text('Hello World'),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi _buildButtonColumn untuk membuat kolom dengan icon dan teks
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),  // Margin hanya di bagian atas
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
