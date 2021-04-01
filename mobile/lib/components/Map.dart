import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapWidget extends StatefulWidget {
  MapWidget({this.lat,this.lon,this.latActual = 48.6828353,this.lonActual = 6.161166,this.zoom = 12,this.isDetail = false});
  final double lat;
  final double lon;
  final double latActual;
  final double lonActual;
  final bool isDetail;
  final double zoom;

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController _controller;
  Set<Marker> markers = Set();

  void _getMarkers(){
    markers.add(
      Marker(
        markerId: MarkerId('Lieu de l\'événement'),
        position: LatLng(widget.lat,widget.lon),
      )
    );
  }

  void _onMapCreated(GoogleMapController controller){
    _controller = controller;
    _centerView();
  }

  _centerView() async {
    if(widget.isDetail){
      await _controller.getVisibleRegion();
      var bounds = LatLngBounds(
        southwest: LatLng(min(widget.lat,widget.latActual),min(widget.lon,widget.lonActual)),
        northeast: LatLng(max(widget.lat,widget.latActual),max(widget.lon,widget.lonActual)),
      );
      _controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 100));
    }
  }

  @override
  void initState() {
    super.initState();
    _getMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: markers,
      zoomControlsEnabled: false,
      myLocationEnabled: widget.isDetail,
      myLocationButtonEnabled: widget.isDetail,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.lat,widget.lon),
        zoom: widget.zoom,
      ),
      onMapCreated: _onMapCreated,
    );
  }
}