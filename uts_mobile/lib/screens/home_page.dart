import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final String username = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mountain Ticket Sales'),
        actions: [
          // Ikon Profil
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.person, size: 30),
              tooltip: 'Go to Profile',
              onPressed: () {
                Navigator.pushNamed(context, '/profile', arguments: username);
              },
            ),
          ),
          // Ikon About
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.info, size: 30),
              tooltip: 'Go to About',
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Welcome, $username!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text('Available Mountain Tickets', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              
              // Tiket 1: Mount Rinjani
              _buildTicketCard(context, 'Mount Rinjani', 200000, 'assets/images/rinjani.jpg'),
              
              // Tiket 2: Mount Bromo
              _buildTicketCard(context, 'Mount Bromo', 150000, 'assets/images/bromo.jpeg'),
              
              // Tiket 3: Mount Semeru
              _buildTicketCard(context, 'Mount Semeru', 170000, 'assets/images/semeru.jpeg'),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan pesan "tiket dibeli"
  void _buyNow(String mountainName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You have successfully bought a ticket for $mountainName!')),
    );
  }

  // Fungsi untuk membangun kartu tiket dengan gambar
  Widget _buildTicketCard(BuildContext context, String mountainName, double price, String imagePath) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
      ),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 150, // Sesuaikan tinggi gambar
            width: double.infinity, // Gambar melebar penuh
            fit: BoxFit.cover, // Memastikan gambar pas di kotak
          ),
          SizedBox(height: 10),
          Text(mountainName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text('Price: Rp ${price.toString()}', style: TextStyle(fontSize: 16)),
          ElevatedButton(
            onPressed: () {
              _buyNow(mountainName); // Menampilkan pesan bahwa tiket telah dibeli
            },
            child: Text('Buy Now'),
          ),
        ],
      ),
    );
  }
}
