import 'package:city_alert_mobile/domain/alert.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteApp {

  final int id;
  final String name;
  final List<LatLng> positions;
  List<Alert> alerts = [];
  final LatLng startPosition;
  final LatLng endPosition;

  RouteApp({
    required this.id,
    required this.name,
    required this.positions,
    required this.alerts,
    required this.startPosition,
    required this.endPosition
  });

  factory RouteApp.fromJson(dynamic json) {
    return RouteApp(
        id: json['id'] as int,
        name: json['name'] as String,
        positions: (json['positions'] as List<dynamic>)
            .map((position) => LatLng(position['latitude'], position['longitude']))
            .toList(),
        alerts: (json['alerts'] as List<dynamic>)
            .map((alert) => Alert.fromJson(alert))
            .toList(),
        startPosition: LatLng(json['startPosition']['latitude'], json['startPosition']['longitude']),
        endPosition: LatLng(json['endPosition']['latitude'], json['endPosition']['longitude'])
    );
  }

}