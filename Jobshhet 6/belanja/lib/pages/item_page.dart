import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart'; // Pastikan model Item diimport

class ItemPage extends StatelessWidget {
  final Item item; // Parameter untuk menerima data item

  // Constructor untuk menerima data item
  ItemPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'), // Menampilkan nama item di AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${item.name} with ${item.price}'),
            //Text('Item: ${item.name} with Price: Rp${item.price}'), // Menampilkan nama item
            //Text('Price: Rp${item.price}'), // Menampilkan harga item
          ],
        ),
      ),
    );
  }
}
