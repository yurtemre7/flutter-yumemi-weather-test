import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherApi {
  WeatherApi(YumemiWeather weather) : weatherInstance = weather;
  final YumemiWeather weatherInstance;

  String fetchSimpleWeather() {
    final weatherCondition = weatherInstance.fetchSimpleWeather();
    return weatherCondition;
  }
}
