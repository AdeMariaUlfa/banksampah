import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:provider/provider.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';


import 'Direction.dart';

class DeliveryScreen extends StatefulWidget {
  final LatLng fromPoint = LatLng(-7.9666, 112.6326);
  final LatLng toPoint = LatLng(-7.9675, 112.7033);

  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> 
{

    
  GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order sampah'),
      ),
      body: Consumer<Direction>(
        builder: (BuildContext context, Direction api, Widget child) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: widget.fromPoint,
              zoom: 12,
            ),
            markers: _createMarkers(),
            polylines: api.currentRoute,
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.zoom_out_map),
        onPressed: _centerView,
      ),
    );
    
  }

  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();

    tmp.add(
      Marker(
        markerId: MarkerId("fromPoint"),
        position: widget.fromPoint,
        infoWindow: InfoWindow(title: "Pemungut sampah"),
      ),
    );
    tmp.add(
      Marker(
        markerId: MarkerId("toPoint"),
        position: widget.toPoint,
        infoWindow: InfoWindow(title: "Penyetor"),
      ),
    );
    return tmp;
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    _centerView();
  }

  _centerView() async {
      var api = Provider.of<Direction>(context, listen: false);

    await _mapController.getVisibleRegion();

    print("Direction");
    await api.findDirections(widget.fromPoint, widget.toPoint);

    var left = min(widget.fromPoint.latitude, widget.toPoint.latitude);
    var right = max(widget.fromPoint.latitude, widget.toPoint.latitude);
    var top = max(widget.fromPoint.longitude, widget.toPoint.longitude);
    var bottom = min(widget.fromPoint.longitude, widget.toPoint.longitude);

    // api.currentRoute.first.points.forEach((point) {
    //   left = min(left, point.latitude);
    //   right = max(right, point.latitude);
    //   top = max(top, point.longitude);
    //   bottom = min(bottom, point.longitude);
    // });

    

    // api.currentRoute.forEach((Points) {
    //   var points;
    
    //   left = min(left, points.latitude);
    //   right = max(right, points.latitude);
    //   top = max(top, points.longitude);
    //   bottom = min(bottom, points.longitude);

    // });

    var bounds = LatLngBounds(
      southwest: LatLng(left, bottom),
      northeast: LatLng(right, top),
    );
    var cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
    _mapController.animateCamera(cameraUpdate);
  }

  
}