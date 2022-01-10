import 'package:geolocator/geolocator.dart';

class Location {
  Location({this.latitude, this.longitude});

  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      final Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      //text = position.toString();

    } finally {
      // text = 'Error';
    }
  }

  @override
  String toString() => 'Location(latitude: $latitude, longitude: $longitude)';
}
