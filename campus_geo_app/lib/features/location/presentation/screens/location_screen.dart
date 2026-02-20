import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/model_loader_service.dart';
import '../../../../core/utils/distance_calculator.dart';
import '../providers/location_provider.dart';
import '../widgets/proximity_indicator.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationAsync = ref.watch(locationStreamProvider);
    final modelLoader = ModelLoaderService();

    return Scaffold(
      appBar: AppBar(title: const Text("Campus Geo App")),
      body: Center(
        child: locationAsync.when(
          data: (position) {
            final distance = calculateDistance(
              position.latitude,
              position.longitude,
              -3.99313,
              -79.20422,
            );

            modelLoader.shouldLoadModel(
              position.latitude,
              position.longitude,
            );

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Lat: ${position.latitude}",
                ),
                Text(
                  "Lng: ${position.longitude}",
                ),
                const SizedBox(height: 20),
                ProximityIndicator(distance: distance),
              ],
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text("Error: $err"),
        ),
      ),
    );
  }
}