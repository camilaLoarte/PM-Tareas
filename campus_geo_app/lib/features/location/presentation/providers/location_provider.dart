import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../../data/location_repository.dart';

final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  return LocationRepository();
});

final locationStreamProvider = StreamProvider<Position>((ref) {
  final repository = ref.watch(locationRepositoryProvider);

  return repository.getLocationStream();
});