import '../../core/utils/distance_calculator.dart';

class ModelLoaderService {
  final double crisisLat = -3.99313;   // ejemplo Loja
  final double crisisLng = -79.20422;

  Future<bool> shouldLoadModel(
      double userLat,
      double userLng,
  ) async {
    final distance = calculateDistance(
      userLat,
      userLng,
      crisisLat,
      crisisLng,
    );

    if (distance < 50) {
      return true; // cargar modelo
    }

    return false; // no cargar
  }
}