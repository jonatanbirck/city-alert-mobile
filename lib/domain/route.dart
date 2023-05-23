import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteApp {

  final String name;
  final List<LatLng> positions;
  final List<int> alertsId;
  final LatLng startPosition;
  final LatLng endPosition;

  RouteApp({
    required this.name,
    required this.positions,
    required this.alertsId,
    required this.startPosition,
    required this.endPosition
  });

  factory RouteApp.fromJson(dynamic json) {
    return RouteApp(
        name: json['name'] as String,
        positions: json['positions'] as List<LatLng>,
        alertsId: json['alertsId'] as List<int>,
        startPosition: json['startPosition'] as LatLng,
        endPosition: json['endPosition'] as LatLng
    );
  }

}