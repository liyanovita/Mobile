import 'package:flutter/material.dart';
import '/config/location_helper.dart'; // Assuming you have location helper functions
import '/services/weather_service.dart'; // Assuming you have a weather service
import '/widgets/weather_card.dart'; // Assuming custom widget for displaying weather info
import '/widgets/search_field.dart'; // Assuming custom widget for search field
// import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = "Loading...";
  num temperature = 0;
  num humidity = 0;
  num windSpeed = 0;
  num cloudCover = 0;
  num pressure = 0;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    _fetchWeatherByLocation();
  }

  void _fetchWeatherByLocation() async {
    final position = await getCurrentLocation(); // Assuming you have a function to get location
    if (position != null) {
      final weatherData = await fetchWeatherByLocation(position); // Assuming function to fetch weather by location
      if (weatherData != null) {
        setState(() {
          cityName = weatherData['name'];
          temperature = weatherData['main']['temp'] - 273.15; // Convert Kelvin to Celsius
          humidity = weatherData['main']['humidity'];
          windSpeed = weatherData['wind']['speed'];
          cloudCover = weatherData['clouds']['all'];
          pressure = weatherData['main']['pressure'];
          isLoaded = true;
        });
      }
    }
  }

  void _fetchWeatherByCity(String city) async {
    final weatherData = await fetchWeatherByCity(city); // Assuming function to fetch weather by city name
    if (weatherData != null) {
      setState(() {
        cityName = weatherData['name'];
        temperature = weatherData['main']['temp'] - 273.15; // Convert Kelvin to Celsius
        humidity = weatherData['main']['humidity'];
        windSpeed = weatherData['wind']['speed'];
        cloudCover = weatherData['clouds']['all'];
        pressure = weatherData['main']['pressure'];
        isLoaded = true;
      });
    }
  }

  // New method to build weather cards with images
  Widget _buildWeatherCards() {
    return Column(
      children: [
        _buildWeatherCard('Temperature', '${temperature.toStringAsFixed(2)} °C', 'assets/images/thermometer.jpg'),
        _buildWeatherCard('Pressure', '${pressure.toInt()} hPa', 'assets/images/barometer.png'),
        _buildWeatherCard('Humidity', '${humidity.toInt()} %', 'assets/images/humidity.png'),
        _buildWeatherCard('Cloud Cover', '${cloudCover.toInt()} %', 'assets/images/clouds.png'),
      ],
    );
  }

  // Helper method to create individual weather cards with images
  Widget _buildWeatherCard(String title, String value, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Image for the weather parameter
            Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(value, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Method for displaying city name with an image
  Widget _buildCityName() {
    return Row(
      children: [
        // You can add an icon or image next to the city name (outside the card)
        Image.asset(
          'assets/images/loc.png', // Example image for the city icon
          width: 30,
          height: 30,
        ),
        const SizedBox(width: 10),
        Text(
          cityName,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffFA8BFF), Color(0xff2BD2FF), Color(0xff2BFF88)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.3, 0.6, 1.0],
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchField(onSubmitted: _fetchWeatherByCity), // Custom search field widget
            const SizedBox(height: 20),
            if (isLoaded) ...[
              _buildCityName(), // Display city name with icon/image beside it
              const SizedBox(height: 20),
              _buildWeatherCards(), // Display weather cards with images
            ] else
              const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}