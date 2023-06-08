import 'package:google_maps_flutter/google_maps_flutter.dart';

enum AlertType {
  TRASH,
  DIRTY_PLACE,
  BROKEN_GLASS,
  ANIMAL_WASTE
}

class Alert {

  final int id;
  final String photo; //base64
  final LatLng position;
  final int routeId;
  final AlertType type;
  final String observation;

  Alert({
    required this.id,
    required this.photo,
    required this.position,
    required this.routeId,
    required this.type,
    required this.observation
  });

  factory Alert.fromJson(dynamic json) {
    return Alert(
        id: json['id'] as int,
        photo: json['photo'] as String,
        position: json['position'] as LatLng,
        routeId: json['routeId'] as int,
        type: json['type'] as AlertType,
        observation: json['observation'] as String
    );
  }

}