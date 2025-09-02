import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:testcode/core/utils/permissions.dart';
import 'package:testcode/models/weather_dto.dart';
import 'package:testcode/controller/loader_provider.dart';

class WeatherService {
  static String apiKey = 'cda2b7440a3bec5192a6177f8e3a529f';

  static Future<WeatherDto?> getCurrentWeather(BuildContext context) async {
    final loader = context.read<LoaderProvider>();

    Position? locData = await Permissions.requestLocation(context);
    if (locData == null) {
      loader.setLoading(false);
      return null;
    }

    final currentLocation = LatLng(locData.latitude, locData.longitude);
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&units=metric&appid=$apiKey',
    );

    try {
      loader.setLoading(true);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;
        return WeatherDto.fromJson(extractedData);
      }
    } catch (_) {
    } finally {
      loader.setLoading(false);
    }

    return null;
  }
}
