import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../global/global_var.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> googleMapCompleterController =
  Completer<GoogleMapController>();
  GoogleMapController? controllerGoogleMap;
  Position? userCurrentLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              initialCameraPosition: googlePlexInitialPosition,
              onMapCreated: (GoogleMapController mapController) {
                controllerGoogleMap = mapController;
                googleMapCompleterController.complete(controllerGoogleMap);
                getDriverCurrentLocation();
              }),
        ],
      ),
    );
  }

  getDriverCurrentLocation() async {
    Position positionOfUser = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
    userCurrentLocation = positionOfUser;

    LatLng userPosition = LatLng(userCurrentLocation!.latitude, userCurrentLocation!.longitude);
    CameraPosition cameraPosition = CameraPosition(target: userPosition, zoom: 15);
    controllerGoogleMap!.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
}
