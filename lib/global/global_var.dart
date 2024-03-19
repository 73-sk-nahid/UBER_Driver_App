import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String userName = "";
//String googleMapKey = "AIzaSyDZDqr8Va2drRaWXkCJyddm6BwfmEXJyRg";
//String googleMapKey = FlutterConfig.get('googleMapApiKey');
//String googleApiKey = dotenv.get('googleMapApiKey');
//String apiKey = dotenv.env["API_KEY"]!;
String googleApiKey = dotenv.env["googleMapApiKey"]!;

const CameraPosition googlePlexInitialPosition = CameraPosition(
    target: LatLng(23.7168531,90.4941576),
    zoom: 21,
  );