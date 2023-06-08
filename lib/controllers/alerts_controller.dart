import 'package:city_alert_mobile/domain/dto/alert_create.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../domain/alert.dart';
import '../util/MockObjects.dart';

class AlertsController {

  final List<Alert> alerts = [];

  Alert save(AlertCreate alert, int routeId) {
    return Alert(
        id: 1,
        photo: alert.photo as String,
        position: alert.position as LatLng,
        routeId: routeId,
        type: alert.type as AlertType,
        observation: alert.observation as String
    );
  }

  Future<List<Alert>> findAll() async {
    alerts.addAll(MockObjects.createManyAlert(8));
    return alerts;
  }

  void create(Alert alert) async {
    alerts.add(alert);
  }

}