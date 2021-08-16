import 'dart:async';

import 'package:acme_test/models/PlaceDetailsModel.dart';
import 'package:acme_test/models/locationModel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GMap extends StatefulWidget {
  final LocationModel location;

  const GMap({Key key, this.location}) : super(key: key);

  @override
  State<GMap> createState() => _GMap();
}

class _GMap extends State<GMap> {
  // Location info getted from WorkTickets details, if null, the user must want
  // to fill out the data
  final LocationModel location;

  Completer<GoogleMapController> _controller = Completer();
  Location _location = Location();
  LocationData _currentLocationData;
  CameraPosition _cameraInitialPosition =
      CameraPosition(target: LatLng(23.0, 18.0), zoom: 14);

  //This flag its used to know if the get directions screen its entered from WorkTicket screen
  // and the location  its know
  bool _locationItsKnown = false;

  _GMap({this.location});

  @override
  void initState() {
    checkLocationServiceAndPermission();

    if (location != null) {
      _locationItsKnown = true;
      _cameraInitialPosition =
          CameraPosition(target: LatLng(location.lat, location.long), zoom: 14);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationEnabled: true,
      onTap: (latLong) {
        _setCameraAtLocation(latLong);
      },
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      initialCameraPosition: _cameraInitialPosition,
      onMapCreated: _onMapCreated,
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    // Go to the user current location if location to show its not know
    if (!_locationItsKnown) {
      _location.onLocationChanged.listen((ldata) {
        _currentLocationData = ldata;
        _setCameraAtLocation(LatLng(ldata.latitude, ldata.longitude));
      });
    } else {
      _setCameraAtLocation(LatLng(location.lat, location.long));
    }
  }

  // set the camera at place, place model contains google place api info about
  // the place. This method its for autocomplete functions on the future
  Future<void> _setCameraAtPlace(PlaceModel place) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target:
            LatLng(place.geometry.location.lat, place.geometry.location.long),
        zoom: 14)));
  }

  //Check if service its available and permission its granted
  Future<void> checkLocationServiceAndPermission() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  //Set the camera at location location
  Future<void> _setCameraAtLocation(LatLng location) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: location, zoom: 14)));
  }
}
