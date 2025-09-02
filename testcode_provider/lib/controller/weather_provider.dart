import 'package:flutter/material.dart';
import 'package:testcode/models/weather_dto.dart';
import 'package:testcode/services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherDto? _weather;

  WeatherDto? get weather => _weather;

  Future<void> getCurrentWeather(BuildContext context) async {
    _weather = await WeatherService.getCurrentWeather(context);
    notifyListeners();
  }

  String getWeatherImage(String? input) {
    if (input == null) {
      return 'assets/images/Error.png';
    }
    final weather = input.toLowerCase();
    const assetPath = 'assets/images/';
    switch (weather) {
      case 'thunderstorm':
        return '${assetPath}Storm.png';
      case 'drizzle':
      case 'rain':
        return '${assetPath}Rainy.png';
      case 'snow':
        return '${assetPath}Snow.png';
      case 'clear':
        return '${assetPath}Sunny.png';
      case 'clouds':
        return '${assetPath}Cloudy.png';
      case 'mist':
      case 'fog':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'sand':
      case 'ash':
        return '${assetPath}Fog.png';
      case 'squall':
      case 'tornado':
        return '${assetPath}StormWindy.png';
      default:
        return '${assetPath}Cloud.png';
    }
  }
}
