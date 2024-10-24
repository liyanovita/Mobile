import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'Liya' && password == 'liya123') {
      Navigator.pushNamed(context, '/home', arguments: username);
    } else {
      setState(() {
        _errorMessage = 'Incorrect username or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      backgroundColor: const Color.fromARGB(255, 214, 211, 211), // Set background to light grey
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
              crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
              children: <Widget>[
                // Container untuk menambahkan bentuk di sekeliling logo
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), // Membuat sudut membulat
                    border: Border.all(color: Colors.black, width: 2), // Border hitam
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // Memberi efek bayangan
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(10), // Padding di sekitar gambar
                  child: Image.asset(
                    'assets/logo.png', // Update with your image asset path
                    height: 200,
                  ),
                ),
                SizedBox(height: 20),
                // Kotak untuk TextField Username
                Container(
                  width: 300, // Set fixed width to align fields
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.black), // Change label color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.black), // Add user icon
                    ),
                    style: TextStyle(color: Colors.black), // Text color
                  ),
                ),
                SizedBox(height: 10),
                // Kotak untuk TextField Password
                Container(
                  width: 300, // Set fixed width to align fields
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black), // Change label color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      prefixIcon: Icon(Icons.lock, color: Colors.black), // Add lock icon
                    ),
                    obscureText: true,
                    style: TextStyle(color: Colors.black), // Text color
                  ),
                ),
                SizedBox(height: 20),
                // Tombol Login tanpa container
                ElevatedButton(
                  onPressed: _login,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0), // Padding vertikal tombol
                    child: Text('Login'),
                  ),
                ),
                if (_errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
