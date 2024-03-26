import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../utils/constant.dart';
import 'dart:ui' as ui;

import '../../utils/key.dart';
import '../../utils/widgets.dart';

class DirectionPage extends StatefulWidget {
  const DirectionPage({Key? key}) : super(key: key);

  @override
  State<DirectionPage> createState() => _DirectionPageState();
}

class _DirectionPageState extends State<DirectionPage> {
  final List<LatLng> _latlng = [
    const LatLng(37.785591, -122.406331),
    const LatLng(37.764731, -122.390158),
  ];
  final List _imageList = [youHereMarker, gasStationMarker];
  final List _stationList = [
    {
      'image': station1,
      'name': 'Broome charging station',
      'location': 'B 420 Broome charging station,New york, NY 100013, USA',
      'time': '24*7hr',
      'distance': '2.5 km',
      'rating': '4.5',
      'connection': '8 points',
      'vehicleType': 'car',
    },
    {
      'image': station2,
      'name': 'Hp charging station',
      'location': 'B 420 Broome charging station,New york, NY 100013, USA',
      'time': '24*7hr',
      'distance': '2.5 km',
      'rating': '4.5',
      'connection': '8 points',
      'vehicleType': 'bike',
    },
  ];
  final List<Marker> _markers = [];
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng soureLocation = LatLng(37.785707, -122.406197);
  static const LatLng destination = LatLng(37.764731, -122.390158);
  List<LatLng> polylineCoordinates = [];
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        apiKey,
        PointLatLng(soureLocation.latitude, soureLocation.longitude),
        PointLatLng(destination.latitude, destination.longitude));
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        setState(() {});
      }
    }
  }

  Future<Uint8List> getBytesFromAssets(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  loadData() async {
    for (int i = 0; i < _imageList.length; i++) {
      final Uint8List markerIcon = await getBytesFromAssets(_imageList[i], 120);
      _markers.add(Marker(
          icon: BitmapDescriptor.fromBytes(markerIcon),
          markerId: MarkerId(i.toString()),
          position: _latlng[i],
          onTap: () {
            // if (i != 0) {
            //   _pageController.animateToPage(i,
            //       duration: Duration(milliseconds: 1500),
            //       curve: Curves.fastLinearToSlowEaseIn);
            // }
          },
          infoWindow: i == 0
              ? const InfoWindow(title: "You are here")
              : InfoWindow(
                  title: _stationList[i]['name'],
                  snippet: _stationList[i]['location'],
                )));
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPolyPoints();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        iconTheme: const IconThemeData(color: black),
        backgroundColor: transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        height: 100.h,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GoogleMap(
              initialCameraPosition:
                  const CameraPosition(target: soureLocation, zoom: 13.5),
              mapType: MapType.normal,
              onMapCreated: (controller) {
                _controller.complete(controller);
              },
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              markers: Set<Marker>.of(_markers),
              // markers: {
              //   const Marker(
              //       markerId: MarkerId('source'), position: soureLocation),
              //   const Marker(
              //       markerId: MarkerId('destination'), position: destination),
              // },
              polylines: {
                Polyline(
                    color: primaryColor,
                    width: 6,
                    polylineId: const PolylineId("route"),
                    points: polylineCoordinates),
              },
            ),
            Positioned(
              bottom: 20,
              child: MyContainerWithChild(
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                height: 116,
                width: 90.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 82,
                          width: 111,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: const DecorationImage(
                                fit: BoxFit.fill, image: AssetImage(carMain3)),
                          ),
                        ),
                        widthSpace20,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText('Hp charging station',
                                  style: blackBold18),
                              heightSpace5,
                              Text.rich(TextSpan(
                                  text: '3 min',
                                  style: primaryBold16,
                                  children: [
                                    TextSpan(
                                        text: ' (700 M)', style: blackBold16)
                                  ])),
                              heightSpace5,
                              Text('Open : 24 hr', style: dashLineSemiBold14)
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
