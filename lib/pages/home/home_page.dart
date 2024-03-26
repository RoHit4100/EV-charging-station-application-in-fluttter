import 'dart:async';
import 'dart:ui' as ui;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:fl_speedcharge/utils/constant.dart';
import 'package:fl_speedcharge/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../helper/language_constant.dart';
import '../charging_station/charging_station_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, }) : super(key: key);
  
  @override
  State<HomePage> createState() => _HomePageState();
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
  const LatLng(37.743405, -122.411556),
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

class _HomePageState extends State<HomePage> {
  
  final PageController _pageController = PageController();
  final Completer<GoogleMapController> googleMapController = Completer();
  static const CameraPosition _sourceLocation =
      CameraPosition(target: LatLng(37.785591, -122.406331), zoom: 14);

  @override
  void initState() {
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
            padding: const EdgeInsets.only(bottom: 170),
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
      appBar: appBarMethod(),
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
            duration: const Duration(milliseconds: 1500),
            backgroundColor: primaryColor,
            content: Text(
              translation(context).pressBackAgain,
              style: whiteSemiBold16,
            )),
        child: SizedBox(
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
              ),
              Positioned(
                bottom: 15,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                            title: translation(context)
                                                .getDirection,
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
      ),
    );
  }

  PreferredSize appBarMethod() {
    return PreferredSize(
      preferredSize: Size.fromHeight(18.5.h),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(212, 232, 255, 1),
                  Color.fromRGBO(212, 232, 255, 0.9),
                  Color.fromRGBO(212, 232, 255, 0.9),
                  Color.fromRGBO(212, 232, 255, 0.8),
                  Color.fromRGBO(212, 232, 255, 0.8),
                  Color.fromRGBO(212, 232, 255, 0.7),
                  Color.fromRGBO(212, 232, 255, 0.7),
                  Color.fromRGBO(212, 232, 255, 0.4),
                  Color.fromRGBO(212, 232, 255, 0.4),
                  Color.fromRGBO(212, 232, 255, 0.3),
                  Color.fromRGBO(212, 232, 255, 0.2),
                  Color.fromRGBO(212, 232, 255, 0.05),
                ],
              ),
            ),
            padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(homeProfile),
                        ),
                        widthSpace10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Rohit Udamale', style: blackBold17),
                            Text(
                              translation(context).findNearest,
                              style: TextStyle(
                                color: const Color(0xff6A6B6C),
                                fontSize: 10.sp,
                                fontFamily: 'SB',
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/NotificationPage');
                        },
                        child: Icon(
                          Icons.notifications_sharp,
                          color: primaryColor,
                          size: 3.h,
                        ),
                      ),
                    )
                  ],
                ),
                heightSpace15,
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/SearchPage');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 5.5.h,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(blurRadius: 8, color: colorForShadow)
                              ]),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: dashLineColor,
                              ),
                              widthSpace10,
                              Text(
                                translation(context).searchLocation,
                                style: dashLineBold16,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    widthSpace15,
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: white,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                            context: context,
                            builder: (BuildContext context) {
                              return const StatefulBottomSheet();
                            });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        width: 45,
                        height: 5.5.h,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 8,
                                  color:
                                      const Color(0xff007AC6).withOpacity(.25))
                            ]),
                        child: Image.asset(filerIcon),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

  loadData() async {
    for (int i = 0; i < _imageList.length; i++) {
      final Uint8List markerIcon =
          await getBytesFromAssets(_imageList[i], i == 0 ? 120 : 80);
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
    if (mounted) {
      setState(() {});
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
}

class StatefulBottomSheet extends StatefulWidget {
  const StatefulBottomSheet({Key? key}) : super(key: key);

  @override
  State<StatefulBottomSheet> createState() => _StatefulBottomSheetState();
}

List _distanceList = [
  '500M',
  '1 KM',
  '2 KM',
  '5 KM',
  '10 KM',
  '20 KM',
  '50 KM',
  '100 KM'
];
List _connectionTypeList = [
  'J-1772',
  'Tesla',
  'Mennekers',
  'CCS2',
  'Chademo',
  'CCS'
];
List _vehicleTypeList = ['2 wheeler', '3 wheeler', '4 wheeler'];
List _speedList = [
  'Standard (3.7 kw)',
  'Semi fast (3.7 -20 kw)',
  'Fast (20 - 73 kw)',
  'Ultra fast (>43 kw)'
];

class _StatefulBottomSheetState extends State<StatefulBottomSheet> {
  String _selectedDistance = _distanceList[1];
  String _selectedConnection = _connectionTypeList[0];
  String _selectedVehicleType = _vehicleTypeList[2];
  String _selectedSpeed = _speedList[2];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Column(
        children: [
          heightSpace15,
          Text(
            translation(context).filter,
            style: blackBold20,
          ),
          heightSpace25,
          Expanded(
            child: SingleChildScrollView(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                children: [
                  Text(
                    translation(context).byDistance,
                    style: blackBold17,
                  ),
                  heightSpace15,
                  Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: _distanceList
                          .map((e) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedDistance = e;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 17, vertical: 9),
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: _selectedDistance == e
                                          ? Border.all(
                                              width: 1, color: primaryColor)
                                          : null,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 6,
                                            offset: const Offset(0, 0),
                                            color: _selectedDistance == e
                                                ? const Color(0xff007AC6)
                                                    .withOpacity(.25)
                                                : colorForShadow)
                                      ]),
                                  child: Text(e.toString(),
                                      style: _selectedDistance == e
                                          ? primaryBold14
                                          : dashLineBold14),
                                ),
                              ))
                          .toList()),
                  heightSpace30,
                  Text(
                    translation(context).connectionType,
                    style: blackBold17,
                  ),
                  heightSpace15,
                  Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: _connectionTypeList
                          .map((e) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedConnection = e;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 17, vertical: 9),
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: _selectedConnection == e
                                          ? Border.all(
                                              width: 1, color: primaryColor)
                                          : null,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 6,
                                            offset: const Offset(0, 0),
                                            color: _selectedConnection == e
                                                ? const Color(0xff007AC6)
                                                    .withOpacity(.25)
                                                : colorForShadow)
                                      ]),
                                  child: Text(e.toString(),
                                      style: _selectedConnection == e
                                          ? primaryBold14
                                          : dashLineBold14),
                                ),
                              ))
                          .toList()),
                  heightSpace30,
                  Text(
                    translation(context).byVehicleType,
                    style: blackBold17,
                  ),
                  heightSpace15,
                  Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: _vehicleTypeList
                          .map((e) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedVehicleType = e;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 17, vertical: 9),
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: _selectedVehicleType == e
                                          ? Border.all(
                                              width: 1, color: primaryColor)
                                          : null,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 6,
                                            offset: const Offset(0, 0),
                                            color: _selectedVehicleType == e
                                                ? const Color(0xff007AC6)
                                                    .withOpacity(.25)
                                                : colorForShadow)
                                      ]),
                                  child: Text(e.toString(),
                                      style: _selectedVehicleType == e
                                          ? primaryBold14
                                          : dashLineBold14),
                                ),
                              ))
                          .toList()),
                  heightSpace30,
                  Text(
                    translation(context).speed,
                    style: blackBold17,
                  ),
                  heightSpace15,
                  Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: _speedList
                          .map((e) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedSpeed = e;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 17, vertical: 9),
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: _selectedSpeed == e
                                          ? Border.all(
                                              width: 1, color: primaryColor)
                                          : null,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 6,
                                            offset: const Offset(0, 0),
                                            color: _selectedSpeed == e
                                                ? const Color(0xff007AC6)
                                                    .withOpacity(.25)
                                                : colorForShadow)
                                      ]),
                                  child: Text(e.toString(),
                                      style: _selectedSpeed == e
                                          ? primaryBold14
                                          : dashLineBold14),
                                ),
                              ))
                          .toList()),
                  heightSpace30,
                  PrimaryButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: translation(context).filter,
                  ),
                  heightSpace10,
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      translation(context).reset,
                      style: primaryBold16,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  heightSpace10,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
