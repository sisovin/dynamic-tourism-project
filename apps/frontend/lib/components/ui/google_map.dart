import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  late GoogleMapController _controller;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  void _addMarkers() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('destination1'),
          position: LatLng(37.7749, -122.4194),
          infoWindow: InfoWindow(title: 'Destination 1'),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('destination2'),
          position: LatLng(34.0522, -118.2437),
          infoWindow: InfoWindow(title: 'Destination 2'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          _controller = controller;
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194),
          zoom: 10,
        ),
        markers: _markers,
      ),
    );
  }
}
