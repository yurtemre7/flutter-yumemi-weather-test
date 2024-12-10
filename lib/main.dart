import 'package:flutter/material.dart';
import 'package:flutter_training/providers/weather_api.dart';
import 'package:flutter_training/yellow_screen.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

late WeatherApi weatherApi;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  weatherApi = WeatherApi(YumemiWeather());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: YellowScreen(),
    );
  }
}
