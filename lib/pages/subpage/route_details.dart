import 'package:city_alert_mobile/components/alert_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/dto/route_form.dart';
import '../../domain/route.dart';

class RouteDetailItemData {
  final String name;
  final String addressStart;
  final String addressFinish;
  final int positions;
  final List<AlertDetailItemData> alerts;

  RouteDetailItemData(
      this.name,
      this.addressStart,
      this.addressFinish,
      this.positions,
      this.alerts
  );
}

class AlertDetailItemData {
  final String photo;
  final String type;
  final String observation;
  final String address;

  AlertDetailItemData(
      this.photo,
      this.type,
      this.observation,
      this.address
  );
}

class RouteDetails extends StatefulWidget {

  final RouteDetailItemData route;
  const RouteDetails({Key? key, required this.route}) : super(key: key);

  @override
  State<RouteDetails> createState() => _RouteDetails();
}

class _RouteDetails extends State<RouteDetails> {

  final _formKey = GlobalKey<FormState>();
  final _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final route = widget.route;
    final alerts = route.alerts.length;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        shadowColor: Colors.black,
        elevation: 4,
        backgroundColor: Colors.indigo,
        titleSpacing: 0,
        title: Text(
          "Detalhes de ${route.name}",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome: ${route.name}',
            ),
            const SizedBox(height: 8.0),
            Text(
              'Coordenadas registradas: ${route.positions}',
            ),
            const SizedBox(height: 8.0),
            Text(
              'Início: ${route.addressStart}',
            ),
            const SizedBox(height: 8.0),
            Text(
              'Final: ${route.addressFinish}',
            ),
            const SizedBox(height: 16.0),
            route.alerts.isEmpty ?
            const Center(
              child: Text(
                'Não registrado alertas!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ) :
            const Center(
              child: Text(
                'Alertas',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded( // ou Flexible
              child: ListView.builder(
                itemCount: route.alerts.length,
                itemBuilder: (context, index) {
                  AlertDetailItemData item = route.alerts[index];
                  return AlertItem(alert: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}