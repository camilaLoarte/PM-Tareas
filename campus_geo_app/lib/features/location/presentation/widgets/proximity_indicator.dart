final locationStreamProvider = StreamProvider<Position>((ref) {
  final service = LocationService();

  return service.getPositionStream();
});