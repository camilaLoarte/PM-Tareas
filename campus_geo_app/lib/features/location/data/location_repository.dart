import 'package:geolocator/geolocator.dart';
import '../../../core/services/location_service.dart';

class LocationRepository {
  final LocationService _service = LocationService();

  Stream<Position> getLocationStream() {
    return _service.getPositionStream();
  }

  Future<bool> checkPermission() {
    return _service.checkPermission();
  }
}