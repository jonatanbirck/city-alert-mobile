import 'package:flutter/material.dart';

import '../controllers/RoutesController.dart';
import '../domain/route.dart';

class RoutesPage extends StatefulWidget {
  const RoutesPage({Key? key}) : super(key: key);

  @override
  State<RoutesPage> createState() => _RoutesPage();
}

class _RoutesPage extends State<RoutesPage> {

  final RoutesController _routesController = RoutesController();
  late List<RouteApp> _routes;

  @override
  void initState() {
    super.initState();
    setRoutes();
  }

  void setRoutes() async {
    final routes = await _routesController.findAll();
    setState(() {
      _routes = routes;
    });
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
          );
        },
      ),
    );
  }
}
