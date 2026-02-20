import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/location/presentation/screens/location_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: CampusGeoApp(),
    ),
  );
}

class CampusGeoApp extends StatelessWidget {
  const CampusGeoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Geo App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LocationScreen(),
    );
  }
}