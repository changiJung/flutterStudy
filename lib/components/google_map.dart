import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

  double zoomVal = 15.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              //
            }),
        title: Text("서울시청"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          //_buildContainer(),
        ],
      ),
    );
  }

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus(zoomVal);
          }),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus, color: Color(0xff6200ee)),
          onPressed: () {
            print(zoomVal);
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(37.5393793, 126.9781619), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(37.5393793, 126.9781619), zoom: zoomVal)));
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(37.5393793, 126.9781619), zoom: 14),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          newyork1Marker,
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}

//서울 시청
Marker newyork1Marker = Marker(
  markerId: MarkerId('서울시청'),
  position: LatLng(37.5393793, 126.9781619),
  infoWindow: InfoWindow(title: '서울시청'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
