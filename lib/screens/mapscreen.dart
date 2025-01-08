import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class OpenMap extends StatelessWidget {
  const OpenMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("We are here !"),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(-20.8661, 55.4500),
          initialZoom: 12.0,
        ),
        children: [
          TileLayer(
            // Nouvelle API TileLayer
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
        ],
      ),
    );
  }
}
