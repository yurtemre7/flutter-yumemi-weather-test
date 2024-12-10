import 'package:flutter/material.dart';
import 'package:flutter_training/home.dart';
import 'package:flutter_training/providers/weather_api.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

late WeatherApi weatherApi;

void main() {
  runApp(const MainApp());
  weatherApi = WeatherApi(YumemiWeather());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
