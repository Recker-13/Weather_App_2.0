import 'package:flutter/material.dart';
import 'weather_model.dart';

class WeatherHome extends StatefulWidget {
  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  final TextEditingController _controller = TextEditingController();
  Weather? _weather;
  String _error = '';
  final String _apiKey = '63e232aee5fbb408fb26a55faab1174d'; // Replace with your actual API key

  void _fetchWeather() async {
    final city = _controller.text;

    if (city.isNotEmpty) {
      try {
        final weatherData = await fetchWeather(city, _apiKey);
        setState(() {
          _weather = weatherData;
          _error = '';
        });
      } catch (e) {
        setState(() {
          _weather = null;
          _error = 'Failed to fetch weather data. Please try again.';
        });
      }
    }
  }

  String formatTime(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return "${date.hour}:${date.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/2.jpeg'), // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Search bar
              TextField(
                controller: _controller,
                style: TextStyle(color: const Color.fromARGB(255, 249, 249, 249)), // Dark orange text color
                decoration: InputDecoration(
                  hintText: 'Enter city name',
                  hintStyle: TextStyle(color: Colors.orange[300]), // Lighter hint text color
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search, color: Colors.orange[900]), // Dark orange icon color
                    onPressed: _fetchWeather,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.orange[900]!, width: 2), // Dark orange border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.orange[900]!, width: 2), // Dark orange border when focused
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Display error message if any
              if (_error.isNotEmpty)
                Text(
                  _error,
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),

              // Display weather details if available
              if (_weather != null) ...[
                Text(
                  _weather!.cityName,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  "${_weather!.temperature.toStringAsFixed(1)}°C",
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  _weather!.description,
                  style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic, color: Colors.white),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.opacity, color: Colors.white),
                        SizedBox(height: 8),
                        Text(
                          "Humidity",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Text(
                          "${_weather!.humidity}%",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.air, color: Colors.white),
                        SizedBox(height: 8),
                        Text(
                          "Wind Speed",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Text(
                          "${_weather!.windSpeed} m/s",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.wb_sunny, color: Colors.orange),
                        SizedBox(height: 8),
                        Text(
                          "Sunrise",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Text(
                          formatTime(_weather!.sunrise),
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.nights_stay, color: Colors.white),
                        SizedBox(height: 8),
                        Text(
                          "Sunset",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Text(
                          formatTime(_weather!.sunset),
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
