import 'package:google_maps_flutter/google_maps_flutter.dart';

enum AlertType { trash, dirtyPlace, brokenGlass, animalWaste }

class Alert {

  final String photo; //base64
  final LatLng position;
  final int routeId;
  final AlertType type;
  final String observation;

  Alert({
    required this.photo,
    required this.position,
    required this.routeId,
    required this.type,
    required this.observation
  });

  factory Alert.fromJson(dynamic json) {
    return Alert(
        photo: json['photo'] as String,
        position: json['position'] as LatLng,
        routeId: json['routeId'] as int,
        type: json['type'] as AlertType,
        observation: json['observation'] as String
    );
  }

}