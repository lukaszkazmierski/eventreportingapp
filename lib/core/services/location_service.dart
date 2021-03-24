import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> getCurrentPosition() {
    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<List<Placemark>> getCurrentPlacemark(Position position) {
   return placemarkFromCoordinates(position.latitude, position.longitude);
  }

}