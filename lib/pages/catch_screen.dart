import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CityMap extends StatelessWidget {
  const CityMap({super.key});

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = const CameraPosition(
      target:
          LatLng(25.276987, 55.296249), // Replace with your city's coordinates
      zoom: 12.0, // Adjust the zoom level as needed
    );

    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          initialCameraPosition: initialCameraPosition,
        ),
      ),
    );
  }
}
