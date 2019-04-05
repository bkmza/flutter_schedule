import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContactsState();
  }
}

class _ContactsState extends State<ContactsPage> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(53.9326202, 27.510463);
  final Set<Marker> _markers = Set();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  initState() {
    _markers.add(Marker(
      markerId: MarkerId('center_marker'),
      position: _center,
      infoWindow: InfoWindow(
        title: 'Party!',
        snippet: 'let\'s make some noise!',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));

    super.initState();
  }

  Widget _buildPage() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      markers: _markers,
      myLocationEnabled: true,
      zoomGesturesEnabled: true,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 15.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(),
    );
  }
}
