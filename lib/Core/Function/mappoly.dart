import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Set<Polyline> polylineSet={};
List<LatLng>polylineco=[];

PolylinePoints polylinePoints=PolylinePoints();

Future<void> getMapPolyline(lat , long,destlat,destlong)async{
  String url="https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destlat,$destlong&key=AIzaSyAJA1jBDC4zptiyoekCoBLMtyHl0f4Vlmc";
}