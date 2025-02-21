import 'dart:async';
import 'package:flutter/material.dart';
import 'package:demo_app/core/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BuildMapTab extends StatefulWidget {
  const BuildMapTab({super.key});

  @override
  State<BuildMapTab> createState() => BuildMapTabState();
}

class BuildMapTabState extends State<BuildMapTab> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static final LatLng _currentPosition = LatLng(
      DeviceLocation.position.latitude, DeviceLocation.position.longitude);

  static final CameraPosition _kGooglePlex = CameraPosition(
    zoom: 16,
    target: _currentPosition,
  );

  static const LatLng _cairoPosition = LatLng(30.0333, 31.2167);

  static const CameraPosition _kLake = CameraPosition(
    zoom: 12,
    target: _cairoPosition,
  );

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  void _addMarkers() {
    setState(() {
      _markers.addAll([
        Marker(
          markerId: const MarkerId('current_location'),
          position: _currentPosition,
          infoWindow: const InfoWindow(title: 'Your Location'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
        Marker(
          markerId: const MarkerId('cairo'),
          position: _cairoPosition,
          infoWindow: const InfoWindow(title: 'Cairo'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('Go Cairo!'),
        icon: const Icon(
          Icons.terrain,
          size: 32,
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
