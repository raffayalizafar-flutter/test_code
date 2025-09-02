// await Geolocator.openAppSettings();
import 'package:geolocator/geolocator.dart';
import 'package:testcode/core/utils/ui_utils.dart';

class Permissions {
  static Future<Position?> requestLocation() async {
    bool isLocationserviceEnabled = await Geolocator.isLocationServiceEnabled();
    // notifyListeners();

    if (!isLocationserviceEnabled) {
      UiUtils.alert("Location service disabled", AlertType.warning);
      return Future.error('Location services are disabled.');
    }

    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      // notifyListeners();
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        UiUtils.alert("Permission denied", AlertType.error);
        return Future.error('Location permissions are denied');
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      // notifyListeners();
      UiUtils.alert(
        "Location permissions are permanently denied, Please enable manually from app settings",
        AlertType.error,
      );
      return Future.error('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }
}
