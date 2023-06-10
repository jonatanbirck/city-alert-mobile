import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:city_alert_mobile/controllers/routes_controller.dart';
import 'package:city_alert_mobile/domain/dto/route_create.dart';
import 'package:city_alert_mobile/pages/subpage/form_alert.dart';
import 'package:city_alert_mobile/pages/subpage/form_route.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/map_controller.dart';
import '../domain/dto/alert_create.dart';
import '../domain/dto/alert_form.dart';
import '../domain/dto/route_form.dart';
import 'home_page.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {

  final mapsController = MapsController();
  final routesController = RoutesController();
  late GoogleMapController _mapController;
  late LatLng _location;
  bool _isLoading = true;
  bool _isRecording = false;
  RouteCreate route = RouteCreate();

  @override
  void initState() {
    super.initState();
    setLocation();
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 2,
    );
    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen((Position? position) {
      if (_isRecording && position != null) {
        route.positions?.add(LatLng(position.latitude, position.longitude));
      }
    });
  }

  void setLocation() async {
    Position position = await mapsController.getLocation();
    setState(() {
      _location = LatLng(position.latitude, position.longitude);
      _isLoading = false;
    });
  }

  void _goToFormScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FormRoute()),
    );

    if (result != null && result is RouteForm) {
      setState(() {
        _isRecording = true;
        route.name = result.routeName;
        route.startPosition = _location;
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _goToMyLocation() async {
    Position position = await mapsController.getLocation();
    final cameraPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 16.0,
    );
    _mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void _makePhoto(File file) async {
    Navigator.pop(context);
    /*
    alert.type = AlertType.TRASH;
    alert.observation = "observation";
     */
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FormAlert()),
    );

    if (result != null && result is AlertForm) {
      AlertCreate alert = AlertCreate();
      alert.position = _location;
      alert.photo = base64Encode(file.readAsBytesSync());
      alert.type = result.getRightType();
      alert.observation = result.observation;
      setState(() {
        route.alerts?.add(alert);
      });
    }
  }

  void _stopRecording() {
    setState(() {
      _isRecording = false;
    });
    route.endPosition = _location;
    saveRoute();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(selectedIndex: 1)));
  }

  void saveRoute() {
    routesController.save(route);
    route = RouteCreate();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _isLoading ?
      const Center(child:CircularProgressIndicator()) :
      Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              target: _location,
              zoom: 16.0,
            ),
          ),
          Positioned(
            bottom: 32.0, // Posição vertical desejada
            left: 16.0, // Posição horizontal desejada
            child: SizedBox(
              height: 45,
              width: 45,
              child: FloatingActionButton(
                shape: const CircleBorder(),
                heroTag: 'btn1',
                onPressed: _goToMyLocation,
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.my_location,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 32.0, // Posição vertical desejada
            right: 16.0, // Posição horizontal desejada
            child: SizedBox(
              height: 50,
              width: 50,
              child: _isRecording ?
                FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CameraCamera(
                                onFile: _makePhoto,
                              )
                          )
                      );
                    },
                    heroTag: 'btn2',
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.blue,
                      size: 30,
                    )
                )
                :
                FloatingActionButton(
                  onPressed: () => _goToFormScreen(),
                  backgroundColor: Colors.white,
                  heroTag: 'btn3',
                  child: const Icon(
                      Icons.near_me,
                      color: Colors.blue,
                      size: 34,
                    )
                ),
            ),
          ),
          _isRecording ?
          Positioned(
            bottom: 100.0, // Posição vertical desejada
            right: 16.0, // Posição horizontal desejada
            child: SizedBox(
              height: 50,
              width: 50,
              child: FloatingActionButton(
                  onPressed: () => _stopRecording(),
                  backgroundColor: Colors.white,
                  heroTag: 'btn4',
                  child: const Icon(
                    Icons.stop,
                    color: Colors.red,
                    size: 34,
                  )
              ),
            ),
          ) : Container(),
        ],
      )
    );
  }

}
