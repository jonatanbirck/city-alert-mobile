import 'package:city_alert_mobile/domain/dto/route_create.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../alert.dart';

class AlertCreate {

  String? photo; //base64
  LatLng? position;
  AlertType? type;
  String? observation;

  AlertCreate({
    this.photo,
    this.position,
    this.type,
    this.observation
  });

  Map<String, dynamic> toJson() {
    return {
      'photo': photo,
      'position': RouteCreate.latLngToJson(position),
      'type': type.toString(),
      'observation': observation
    };
  }

}