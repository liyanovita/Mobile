import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'), // Make sure to add your image in the assets folder
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Simaksi !',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // Change text color for visibility
              ),
              SizedBox(height: 20), // Adds some space between the text and the button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('Go to Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
