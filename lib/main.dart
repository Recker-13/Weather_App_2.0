import 'package:flutter/material.dart';
import 'get_started.dart';
import 'weather_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      initialRoute: '/',
      routes: {
        '/': (context) => GetStartedPage(),
        '/weather': (context) => WeatherHome(),
      },
    );
  }
}
