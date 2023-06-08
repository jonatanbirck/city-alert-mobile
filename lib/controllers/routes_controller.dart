import 'dart:convert';

import 'package:city_alert_mobile/domain/dto/route_create.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:http/http.dart' as http;
import '../domain/route.dart';
import '../util/MockObjects.dart';

class RoutesController {

  final List<RouteApp> routes = [];

  //Future<List<RouteApp>> findAll() async {
  //  final response = await http.get(Uri.parse('http://localhost:8080/api/routes'));
//
  //  if (response.statusCode == 200) {
  //    final List<dynamic> data = jsonDecode(response.body);
  //    List<RouteApp> routes = [];
  //    for (var item in data) {
  //      routes.add(RouteApp.fromJson(item));
  //    }
  //    return routes;
  //  } else {
  //    throw Exception('Falha ao buscar dados da API');
  //  }
  //}

  Future<List<RouteApp>> findAll() async {
    routes.addAll(MockObjects.createManyRoute(25));
    return routes;
  }

  RouteApp save(RouteCreate route) {
    return RouteApp(
        id: 1,
        name: route.name as String,
        positions: route.positions ?? [],
        alerts: [],
        startPosition: route.startPosition as LatLng,
        endPosition: route.endPosition as LatLng
    );
  }

  void insert(RouteApp route) {
    routes.add(route);
  }

  void create(RouteApp route) async {
    routes.add(route);
  }



}