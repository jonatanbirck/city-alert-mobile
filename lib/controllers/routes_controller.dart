import 'dart:convert';

import 'package:city_alert_mobile/domain/dto/route_create.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../domain/route.dart';

class RoutesController {

  final List<RouteApp> routes = [];

  Future<List<RouteApp>> findAll() async {
    final response = await http.get(Uri.parse('http://192.168.2.103:8080/api/routes'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      List<RouteApp> routes = [];
      for (var item in data) {
        routes.add(RouteApp.fromJson(item));
      }
      return routes;
    } else {
      throw Exception('Falha ao buscar dados da API');
    }
  }

  Future<void> save(RouteCreate route) async {
    final url = Uri.parse('http://192.168.2.103:8080/api/routes'); // Substitua pelo seu URL de endpoint

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(route.toJson()),
    );

    if (response.statusCode == 200) {
      print('Objeto salvo com sucesso!');
    } else {
      print('Falha ao salvar o objeto. Status code: ${response.statusCode}');
    }
  }



}