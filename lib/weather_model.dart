import 'dart:convert';
import 'package:http/http.dart' as http;

class Weather {
  final String cityName;
  final String description;
  final double temperature;
  final double humidity;
  final double windSpeed;
  final int sunrise;
  final int sunset;

  Weather({
    required this.cityName,
    required this.description,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'] - 273.15, // Convert Kelvin to Celsius
      humidity: json['main']['humidity'].toDouble(),
      windSpeed: json['wind']['speed'].toDouble(),
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
    );
  }
}

Future<Weather> fetchWeather(String city, String apiKey) async {
  final response = await http.get(
    Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey'),
  );

  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load weather data');
  }
}
