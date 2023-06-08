import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteCreate {
  String? name;
  List<LatLng>? positions = [];
  LatLng? startPosition;
  LatLng? endPosition;

  RouteCreate({
    this.name,
    this.positions,
    this.startPosition,
    this.endPosition
  });

}