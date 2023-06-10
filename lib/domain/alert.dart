import 'package:google_maps_flutter/google_maps_flutter.dart';

enum AlertType {
  TRASH,
  DIRTY_PLACE,
  BROKEN_GLASS,
  ANIMAL_WASTE,
  unknown
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
    final alertTypeString = json['type'] as String;
    final alertType = AlertType.values.firstWhere(
          (type) => type.toString().split('.').last == alertTypeString,
      orElse: () => AlertType.unknown,
    );
    return Alert(
        id: json['id'] as int,
        photo: json['photo'] as String,
        position: LatLng(json['position']['latitude'], json['position']['longitude']),
        routeId: json['routeId'] as int,
        type: alertType,
        observation: json['observation'] as String
    );
  }

}