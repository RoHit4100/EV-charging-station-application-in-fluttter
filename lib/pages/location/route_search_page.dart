import 'dart:io';

import 'package:flutter/material.dart';

// class RouteSearchPage extends StatelessWidget {
import 'dart:async';
import 'dart:ui' as ui;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_speedcharge/utils/constant.dart';
import 'package:fl_speedcharge/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../helper/language_constant.dart';
import '../charging_station/charging_station_page.dart';
import '../../utils/key.dart';

class RouteSearchPage extends StatefulWidget {
  const RouteSearchPage({Key? key}) : super(key: key);

  @override
  State<RouteSearchPage> createState() => _RouteSearchPage();
}

List _imageList = [
  youHereMarker,
  gasStationMarker,
  gasStationMarker,
  gasStationMarker,
  gasStationMarker,
  gasStationMarker,
  gasStationMarker,
  gasStationMarker,
  gasStationMarker,
  gasStationMarker,
  gasStationMarker,
];
final List<Marker> _markers = [];
final List<LatLng> _latlng = [
  const LatLng(37.785591, -122.406331),
  const LatLng(37.771318, -122.407898),
  const LatLng(37.801585, -122.405720),
  const LatLng(37.793446, -122.424774),
  const LatLng(37.784252, -122.414303),
  const LatLng(37.785899, -122.396177),
  const LatLng(37.774206, -122.394277),
  const LatLng(37.776402, -122.423557),
  const LatLng(37.756385, -122.408876),
  const LatLng(37.755078, -122.383575),
  const LatLng(37.764731, -122.390158),
];
List _stationList = [
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
    'name': 'Ola charging station',
    'location': 'B 420 Broome charging station,New york, NY 100013, USA',
    'time': '24*7hr',
    'distance': '2.5 km',
    'rating': '4.5',
    'connection': '8 points',
    'vehicleType': 'bike',
  },
  {
    'image': station3,
    'name': 'Delta Electronics station',
    'location': 'B 420 Broome charging station,New york, NY 100013, USA',
    'time': '24*7hr',
    'distance': '2.5 km',
    'rating': '4.5',
    'connection': '8 points',
    'vehicleType': 'bike',
  },
  {
    'image': station1,
    'name': 'DC ev charging station',
    'location': 'B 420 Broome charging station,New york, NY 100013, USA',
    'time': '24*7hr',
    'distance': '2.5 km',
    'rating': '4.5',
    'connection': '8 points',
    'vehicleType': 'car',
  },
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
    'name': 'Ola charging station',
    'location': 'B 420 Broome charging station,New york, NY 100013, USA',
    'time': '24*7hr',
    'distance': '2.5 km',
    'rating': '4.5',
    'connection': '8 points',
    'vehicleType': 'bike',
  },
  {
    'image': station3,
    'name': 'Delta Electronics station',
    'location': 'B 420 Broome charging station,New york, NY 100013, USA',
    'time': '24*7hr',
    'distance': '2.5 km',
    'rating': '4.5',
    'connection': '8 points',
    'vehicleType': 'bike',
  },
  {
    'image': station1,
    'name': 'DC ev charging station',
    'location': 'B 420 Broome charging station,New york, NY 100013, USA',
    'time': '24*7hr',
    'distance': '2.5 km',
    'rating': '4.5',
    'connection': '8 points',
    'vehicleType': 'car',
  },
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
    'name': 'Ola charging station',
    'location': 'B 420 Broome charging station,New york, NY 100013, USA',
    'time': '24*7hr',
    'distance': '2.5 km',
    'rating': '4.5',
    'connection': '8 points',
    'vehicleType': 'bike',
  },
  {
    'image': station3,
    'name': 'Delta Electronics station',
    'location': 'B 420 Broome charging station,New york, NY 100013, USA',
    'time': '24*7hr',
    'distance': '2.5 km',
    'rating': '4.5',
    'connection': '8 points',
    'vehicleType': 'bike',
  },
];

class _RouteSearchPage extends State<RouteSearchPage> {
  static const LatLng soureLocation = LatLng(37.785707, -122.406197);
  static const LatLng destination = LatLng(37.764731, -122.390158);
  List<LatLng> polylineCoordinates = [];
  final PageController _pageController = PageController();
  final Completer<GoogleMapController> googleMapController = Completer();
  static const CameraPosition _sourceLocation =
      CameraPosition(target: LatLng(37.785591, -122.406331), zoom: 14);

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

  @override
  void initState() {
    getPolyPoints();
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CupertinoButton(
        pressedOpacity: .8,
        padding: EdgeInsets.zero,
        onPressed: () async {
          GoogleMapController controller = await googleMapController.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
              const CameraPosition(
                  target: LatLng(37.785591, -122.406331), zoom: 14)));
        },
        child: Padding(
            padding: Platform.isIOS
                ? EdgeInsets.only(bottom: 15.h)
                : const EdgeInsets.only(bottom: 170),
            child: Container(
              height: 4.5.h,
              width: 4.5.h,
              decoration: const BoxDecoration(
                  color: Color(0xff494747), shape: BoxShape.circle),
              child: const Icon(
                Icons.my_location_sharp,
                color: white,
              ),
            )),
      ),
      extendBodyBehindAppBar: true,
      // appBar: appBarMethod(),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        iconTheme: const IconThemeData(color: black),
        backgroundColor: transparent,
        elevation: 0,
      ),
      body: SizedBox(
        height: 100.h,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              initialCameraPosition: _sourceLocation,
              mapType: MapType.normal,
              onMapCreated: (controller) {
                googleMapController.complete(controller);
              },
              myLocationButtonEnabled: false,
              myLocationEnabled: false,
              markers: Set<Marker>.of(_markers),
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
              child: SizedBox(
                height: 150,
                width: 100.w,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) async {
                    if (value != 0) {
                      GoogleMapController controller =
                          await googleMapController.future;
                      controller.animateCamera(CameraUpdate.newCameraPosition(
                          CameraPosition(target: _latlng[value], zoom: 14)));
                    }
                  },
                  itemCount: _latlng.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MyContainerWithChild(
                      onTap: () {
                        if (_stationList[index]['vehicleType'] == 'car') {
                          Navigator.push(
                              context,
                              PageTransition(
                                  isIos: true,
                                  child: const ChargingStationPage(
                                      vehicleType: 'car'),
                                  type: PageTransitionType.rightToLeft));
                        } else {
                          Navigator.push(
                              context,
                              PageTransition(
                                  isIos: true,
                                  child: const ChargingStationPage(
                                      vehicleType: 'bike'),
                                  type: PageTransitionType.rightToLeft));
                        }
                      },
                      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                  height: 130,
                                  child: Image.asset(
                                      _stationList[index]['image'])),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  decoration: const BoxDecoration(
                                      color: Color(0xff0D7B17),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      )),
                                  child: Text(
                                    'Open',
                                    style: whiteBold14,
                                  ),
                                ),
                              )
                            ],
                          ),
                          widthSpace10,
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  _stationList[index]['name'],
                                  style: blackBold17,
                                  maxLines: 1,
                                ),
                                // heightSpace5,
                                AutoSizeText(
                                  _stationList[index]['location'],
                                  style: dashLineSemiBold13,
                                  maxLines: 2,
                                ),
                                // heightSpace5,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.watch_later,
                                          size: 1.8.h,
                                          color: dashLineColor,
                                        ),
                                        widthSpace5,
                                        Text(
                                          _stationList[index]['time'],
                                          style: blackMedium13,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_rounded,
                                          size: 1.8.h,
                                          color: dashLineColor,
                                        ),
                                        widthSpace5,
                                        Text(
                                          _stationList[index]['distance'],
                                          style: blackMedium13,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star_outlined,
                                          size: 1.8.h,
                                          color: primaryColor,
                                        ),
                                        widthSpace5,
                                        Text(
                                          _stationList[index]['rating'],
                                          style: blackMedium13,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                // heightSpace5,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Connection',
                                          style: blackSemiBold13,
                                        ),
                                        heightSpace2,
                                        Text(
                                          _stationList[index]['connection'],
                                          style: dashLineSemiBold13,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        PrimaryButton(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/DirectionPage');
                                          },
                                          height: 35,
                                          borderRadius: 5,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          title:
                                              translation(context).getDirection,
                                          textStyle: whiteBold13,
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  loadData() async {
    for (int i = 0; i < _imageList.length; i++) {
      final Uint8List markerIcon = await getBytesFromAssets(
          _imageList[i], i == 0 || i == _imageList.length - 1 ? 120 : 70);
      _markers.add(Marker(
          icon: BitmapDescriptor.fromBytes(markerIcon),
          markerId: MarkerId(i.toString()),
          position: _latlng[i],
          onTap: () {
            if (i != 0) {
              _pageController.animateToPage(i,
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn);
            }
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

  Future<Uint8List> getBytesFromAssets(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
