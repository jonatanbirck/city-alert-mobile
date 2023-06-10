import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'alert_create.dart';

class RouteCreate {
  String? name;
  List<AlertCreate> alerts = [];
  List<LatLng> positions = [];
  LatLng? startPosition;
  LatLng? endPosition;

  RouteCreate({
    this.name,
    this.startPosition,
    this.endPosition
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'alerts': alerts?.map((alert) => alert.toJson()).toList(),
      'positions': positions?.map((position) => latLngToJson(position)).toList(),
      'startPosition': latLngToJson(startPosition),
      'endPosition': latLngToJson(endPosition)
    };
  }

  static latLngToJson(LatLng? position) {
    if (position == null) {
      return null;
    } else {
      return "{${position?.latitude},${position?.longitude}}";
    }
  }

}