import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../widgets/info_panel.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = LatLng(-0.1807, -78.4678);
    final driver = LatLng(-0.1825, -78.4700);

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: user,
              initialZoom: 15,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: user,
                    width: 40,
                    height: 40,
                    child: const Icon(Icons.person, color: Colors.blue),
                  ),
                  Marker(
                    point: driver,
                    width: 40,
                    height: 40,
                    child: const Icon(Icons.directions_car),
                  ),
                ],
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: [driver, user],
                    strokeWidth: 4,
                    color: Colors.blue,
                  )
                ],
              ),
            ],
          ),
          const InfoPanel(),
        ],
      ),
    );
  }
}
