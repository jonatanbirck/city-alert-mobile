import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MapsController {

  Future<Position> getLocation() async {
    try {
      bool active = await Geolocator.isLocationServiceEnabled();

      if (!active) {
        return Future.error('Por favor, habilite a localização no seu celular!');
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          return Future.error('Você precisa autorizar o acesso à localização!');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error('Autorize o acesso à localização nas configurações!');
      }
    } catch (e) {
      SnackBar(content: Text("Erro ${e.toString()}"));
    }
    return await Geolocator.getCurrentPosition();
  }

}