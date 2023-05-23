import '../domain/alert.dart';
import '../util/MockObjects.dart';

class AlertsController {

  final List<Alert> alerts = [];

  Future<List<Alert>> findAll() async {
    alerts.addAll(MockObjects.createManyAlert(8));
    return alerts;
  }

  void create(Alert alert) async {
    alerts.add(alert);
  }

}