import 'package:flutter/material.dart';

class InfoPanel extends StatelessWidget {
  const InfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            )
          ],
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Conductor en camino',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Tiempo estimado: 4 minutos'),
          ],
        ),
      ),
    );
  }
}
