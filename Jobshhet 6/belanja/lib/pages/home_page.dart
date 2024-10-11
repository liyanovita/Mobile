import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';
import 'package:belanja/pages/item_page.dart'; // Import halaman ItemPage

class HomePage extends StatelessWidget {
  // Daftar item yang didefinisikan
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000),
    Item(name: 'Salt', price: 2000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: Container(
        margin: EdgeInsets.all(8), // Memberikan margin di sekitar ListView
        child: ListView.builder(
          padding: EdgeInsets.all(8), // Padding untuk item di dalam ListView
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                // Navigasi ke halaman ItemPage dengan mengirim data item
                Navigator.pushNamed(
                  context,
                  '/item',
                  arguments: item, // Kirim data item sebagai argument
                );
              },
              child: Card(
                child: Container(
                  margin: EdgeInsets.all(8), // Margin untuk setiap card
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(item.name),
                      ),
                      Expanded(
                        child: Text(
                          item.price.toString(),
                          textAlign: TextAlign.end, // Menyelaraskan harga di kanan
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
