import 'package:city_alert_mobile/components/empty_warning.dart';
import 'package:city_alert_mobile/pages/subpage/route_details.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/routes_controller.dart';
import '../domain/alert.dart';
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
    _setRoutes();
  }

  Future<void> _setRoutes() async {
    final routes = await _routesController.findAll();
    setState(() {
      _routes = routes;
    });
  }

  Future<String> getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String address = '${placemark.name}, ${placemark.locality}';
        return address;
      }
    } catch (e) {
      print('Erro ao obter endereço: $e');
    }

    return 'Não foi possível localizar endereço';
  }

  Future<RouteDetailItemData> _mapRoute(RouteApp route) async {
    return RouteDetailItemData(
        route.name,
        await getAddressFromLatLng(route.startPosition),
        await getAddressFromLatLng(route.endPosition),
        route.positions.length,
        await Future.wait(route.alerts.map((alert) => _mapAlert(alert)).toList())
    );
  }

  Future<AlertDetailItemData> _mapAlert(Alert alert) async {
    return AlertDetailItemData(
        alert.photo,
        alert.type.name,
        alert.observation,
        await getAddressFromLatLng(alert.position)
    );
  }

  void _goToDetailScreen(RouteApp route) async {
    RouteDetailItemData data = await _mapRoute(route);
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RouteDetails(route: data)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _setRoutes,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                if (_routes.isEmpty) {
                  return Container(
                    alignment: Alignment.center,
                    child: const EmptyWarning(
                      iconData: Icons.warning,
                      message: 'Não foi encontrado nenhum registro',
                    ),
                  );
                } else {
                  final item = _routes[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text("Alertas realizados: ${item.alerts.length}"),
                    leading: const Icon(Icons.route),
                    trailing: const Icon(Icons.info_outline),
                    onTap: () => _goToDetailScreen(item),
                  );
                }
              },
              childCount: _routes.isNotEmpty ? _routes.length : 1,
            ),
          ),
        ],
      ),
    );
  }

}
