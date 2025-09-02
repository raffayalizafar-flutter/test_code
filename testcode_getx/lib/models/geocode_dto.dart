// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:latlong2/latlong.dart';

class GeocodeDto {
  String name;
  LatLng latLng;
  GeocodeDto({
    required this.name,
    required this.latLng,
  });

  factory GeocodeDto.fromJson(Map<String, dynamic> json) {
    return GeocodeDto(
      name: json['name'],
      latLng: LatLng(json['lat'], json['lon']),
    );
  }
}