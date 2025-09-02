// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class WeatherDto with ChangeNotifier {
  final double? temp;
  final double? tempMax;
  final double? tempMin;
  final double? lat;
  final double? long;
  final double? feelsLike;
  final int? pressure;
  final String? description;
  final String? weatherCategory;
  final int? humidity;
  final double? windSpeed;
  String? city;
  final String? countryCode;

  WeatherDto({
    this.temp,
    this.tempMax,
    this.tempMin,
    this.lat,
    this.long,
    this.feelsLike,
    this.pressure,
    this.description,
    this.weatherCategory,
    this.humidity,
    this.windSpeed,
    this.city,
    this.countryCode,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) {
    return WeatherDto(
      temp: (json['main']['temp']).toDouble(),
      tempMax: (json['main']['temp_max']).toDouble(),
      tempMin: (json['main']['temp_min']).toDouble(),
      lat: json['coord']['lat'],
      long: json['coord']['lon'],
      feelsLike: (json['main']['feels_like']).toDouble(),
      pressure: json['main']['pressure'],
      weatherCategory: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      humidity: json['main']['humidity'],
      windSpeed: (json['wind']['speed']).toDouble(),
      city: json['name'],
      countryCode: json['sys']['country'],
    );
  }
}
