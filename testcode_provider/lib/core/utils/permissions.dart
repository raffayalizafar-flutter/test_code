import 'package:geolocator/geolocator.dart';
import 'package:testcode/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class Permissions {
  static Future<Position?> requestLocation(BuildContext context) async {
    final isLocationServiceEnabled =
        await Geolocator.isLocationServiceEnabled();

    if (!isLocationServiceEnabled) {
      UiUtils.alert(context, "Location service disabled", AlertType.warning);
      return Future.error('Location services are disabled.');
    }

    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        UiUtils.alert(context, "Permission denied", AlertType.error);
        return Future.error('Location permissions are denied');
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      UiUtils.alert(
        context,
        "Location permissions are permanently denied, Please enable manually from app settings",
        AlertType.error,
      );
      return Future.error('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }
}
