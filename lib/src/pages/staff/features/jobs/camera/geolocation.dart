import 'package:geolocator/geolocator.dart';

class GeolocationService {
  Future<Position?> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      return position;
    } catch (e) {
      print("Error getting location: $e");
      return null; // Handle errors as needed
    }
  }

  Stream<Position> getLocationStream() {
    return Geolocator.getPositionStream();
  }
}