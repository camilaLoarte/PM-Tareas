import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapWebScreen extends StatefulWidget {
  const MapWebScreen({super.key});

  @override
  State<MapWebScreen> createState() => _MapWebScreenState();
}

class _MapWebScreenState extends State<MapWebScreen> {
  LatLng? _currentPosition;
  final List<LatLng> _route = [];

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    await Geolocator.requestPermission();

    final position = await Geolocator.getCurrentPosition();

    _currentPosition = LatLng(position.latitude, position.longitude);
    _route.add(_currentPosition!);

    setState(() {});
  }

  void _simulateMovement() {
    if (_currentPosition == null) return;

    final newPoint = LatLng(
      _currentPosition!.latitude + 0.0005,
      _currentPosition!.longitude + 0.0005,
    );

    _route.add(newPoint);
    _currentPosition = newPoint;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_currentPosition == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Geolocalización Web')),
      floatingActionButton: FloatingActionButton(
        onPressed: _simulateMovement,
        child: const Icon(Icons.directions),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: _currentPosition!,
          initialZoom: 16,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: _currentPosition!,
                width: 40,
                height: 40,
                child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
              ),
            ],
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                points: _route,
                strokeWidth: 4,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
