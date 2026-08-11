import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationResult {
  final LatLng? location;
  final String? text;

  LocationResult({
    this.location,
    this.text,
  });
}