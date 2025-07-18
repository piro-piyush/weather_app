import 'package:geolocator/geolocator.dart';

Future<Position> getLocation() async {
  LocationPermission permission;
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("Location permissions are denied");
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
      "Location permissions are permanently denied, we cannot request permissions.",
    );
  }
  return Geolocator.getCurrentPosition(
    locationSettings: LocationSettings(
      accuracy: LocationAccuracy.high,
      timeLimit: Duration(seconds: 60),
    ),
  );
}
