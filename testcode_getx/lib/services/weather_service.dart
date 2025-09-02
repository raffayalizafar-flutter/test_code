import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:testcode/controllers/controller.dart';
import 'package:testcode/core/utils/permissions.dart';
import 'package:testcode/models/weather_dto.dart';

class WeatherService {
  static String apiKey = 'cda2b7440a3bec5192a6177f8e3a529f';

  static Future<WeatherDto?> getCurrentWeather() async {
    Position? locData = await Permissions.requestLocation();
    if (locData == null) {
      loaderController.isApiLoading.value = false;
      return null;
    }
    var currentLocation = LatLng(locData.latitude, locData.longitude);
    Uri url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&units=metric&appid=$apiKey',
    );
    try {
      loaderController.isApiLoading.value = true;
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;
        return WeatherDto.fromJson(extractedData);
      }
    } catch (error) {}
    loaderController.isApiLoading.value = false;
    return null;
  }
}
