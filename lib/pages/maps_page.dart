import 'package:camera_camera/camera_camera.dart';
import 'package:city_alert_mobile/pages/subpage/form_route.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../domain/dto/route_form.dart';
import 'home_page.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {

  late GoogleMapController _mapController;
  late LatLng _currentPosition;
  bool _isLoading = true;
  bool _isRecording = false;
  List photos = [];

  @override
  void initState() {
    super.initState();
    setLocation();
  }

  void setLocation() async {
    LatLng location = await _getLocation();

    setState(() {
      _currentPosition = location;
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
      });
    }
  }

  Future<LatLng> _getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    double lat = position.latitude;
    double long = position.longitude;

    return LatLng(lat, long);
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _goToMyLocation() async {
    LatLng location = await _getLocation();
    final cameraPosition = CameraPosition(
      target: location,
      zoom: 16.0,
    );
    _mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void _stopRecording() {
    setState(() {
      _isRecording = false;
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(selectedIndex: 1)));
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
              target: _currentPosition,
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
                                onFile: (file) {
                                  photos.add(file);
                                  Navigator.pop(context);
                                  setState(() {});
                                },
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
