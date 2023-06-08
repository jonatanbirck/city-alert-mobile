import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../alert.dart';

class AlertCreate {

  String? photo; //base64
  LatLng? position;
  int? routeId;
  AlertType? type;
  String? observation;

  AlertCreate({
    this.photo,
    this.position,
    this.routeId,
    this.type,
    this.observation
  });
}