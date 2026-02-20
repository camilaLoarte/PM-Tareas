import 'package:flutter/material.dart';

class ProximityIndicator extends StatelessWidget {
  final double distance;

  const ProximityIndicator({super.key, required this.distance});

  @override
  Widget build(BuildContext context) {
    if (distance < 50) {
      return const Text(
        "⚠️ Punto de crisis cercano",
        style: TextStyle(color: Colors.red, fontSize: 18),
      );
    }

    return Text(
      "Distancia al punto: ${distance.toStringAsFixed(2)} metros",
      style: const TextStyle(fontSize: 16),
    );
  }
}