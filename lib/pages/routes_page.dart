import 'package:city_alert_mobile/pages/subpage/route_details.dart';
import 'package:flutter/material.dart';

import '../controllers/routes_controller.dart';
import '../domain/route.dart';

class RoutesPage extends StatefulWidget {
  const RoutesPage({Key? key}) : super(key: key);

  @override
  State<RoutesPage> createState() => _RoutesPage();
}

class _RoutesPage extends State<RoutesPage> {

  late RoutesController _routesController;
  List<RouteApp> _routes = [];

  @override
  void initState() {
    super.initState();
    _routesController = RoutesController();
    setRoutes();
  }

  void setRoutes() async {
    final routes = await _routesController.findAll();
    setState(() {
      _routes = routes;
    });
  }

  void _goToDetailScreen(RouteApp route) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RouteDetails(route: route)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _routes.length,
        itemBuilder: (context, index) {
          final item = _routes[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text("Alertas realizados: ${item.alerts.length}"),
            leading: const Icon(Icons.route),
            trailing: const Icon(Icons.info_outline),
            onTap: () => _goToDetailScreen(item),
          );
        },
      ),
    );
  }
}
