import 'package:auto_size_text/auto_size_text.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:fl_speedcharge/utils/constant.dart';
import 'package:fl_speedcharge/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../helper/language_constant.dart';
import '../charging_station/charging_station_page.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

List _favouriteList = [
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
    'image': station4,
    'name': 'DC ev charging station',
    'location': 'B 420 Broome charging station,New york, NY 100013, USA',
    'time': '24*7hr',
    'distance': '2.5 km',
    'rating': '4.5',
    'connection': '8 points',
    'vehicleType': 'car',
  },
  {
    'image': station5,
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

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyMethod(),
    );
  }

  Stack bodyMethod() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          child: Container(
            height: 280,
            width: 100.w,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(212, 232, 255, 0.9),
                Color.fromRGBO(212, 232, 255, 0.8),
                Color.fromRGBO(212, 232, 255, 0.7),
                Color.fromRGBO(212, 232, 255, 0.6),
                Color.fromRGBO(212, 232, 255, 0.5),
                Color.fromRGBO(212, 232, 255, 0.4),
                Color.fromRGBO(212, 232, 255, 0.3),
                Color.fromRGBO(212, 232, 255, 0.2),
                Color.fromRGBO(212, 232, 255, 0.1),
                Color.fromRGBO(212, 232, 255, 0.0),
              ],
            )),
          ),
        ),
        Positioned(
            top: 50,
            child: Text(translation(context).favourite, style: blackBold20)),
        _favouriteList.isNotEmpty ? filledFavourite() : emptyFavourite()
      ],
    );
  }

  Widget filledFavourite() {
    return DoubleBackToCloseApp(
      snackBar: SnackBar(
          duration: const Duration(milliseconds: 1500),
          backgroundColor: primaryColor,
          content: Text(
            'Press back again to exit',
            style: whiteSemiBold16,
          )),
      child: Column(
        children: [
          Container(
            height: 85,
            width: 100.w,
            color: const Color(0xffEDF4FD).withOpacity(.2),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _favouriteList.length,
              padding: const EdgeInsets.fromLTRB(10, 3, 10, 0),
              itemBuilder: (BuildContext context, int index) {
                final dataItem = _favouriteList[index];
                return Column(
                  children: [
                    heightSpace7,
                    Slidable(
                      key: Key('$dataItem'),
                      endActionPane: ActionPane(
                        motion: const StretchMotion(),
                        extentRatio: 0.15,
                        children: [
                          SlidableAction(
                            onPressed: (BuildContext context) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: primaryColor,
                                      duration: const Duration(seconds: 1),
                                      content: Text(
                                        "${_favouriteList[index]['name']} ${translation(context).dismissed}",
                                        style: whiteSemiBold16,
                                      )));
                              setState(() {
                                _favouriteList.removeAt(index);
                              });
                            },
                            backgroundColor: const Color(0xffD91B1B),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ],
                      ),
                      child: MyContainerWithChild(
                        color: const Color(0xffF5F8FC),
                        padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                        margin: const EdgeInsets.only(right: 10, left: 10),
                        onTap: () {
                          if (_favouriteList[index]['vehicleType'] == 'car') {
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
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                    height: 130,
                                    child: Image.asset(
                                        _favouriteList[index]['image'])),
                                // Positioned(
                                //   bottom: 0,
                                //   right: 0,
                                //   child: Container(
                                //     padding: EdgeInsets.symmetric(
                                //         horizontal: 10, vertical: 3),
                                //     decoration: BoxDecoration(
                                //         color: Color(0xff0D7B17),
                                //         borderRadius: BorderRadius.only(
                                //           topLeft: Radius.circular(5),
                                //           bottomRight: Radius.circular(5),
                                //         )),
                                //     child: Text(
                                //       'Open',
                                //       style: whiteBold14,
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                            widthSpace10,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    _favouriteList[index]['name'],
                                    style: blackBold17,
                                    maxLines: 1,
                                  ),
                                  heightSpace5,
                                  AutoSizeText(
                                    _favouriteList[index]['location'],
                                    style: dashLineSemiBold13,
                                    maxLines: 2,
                                  ),
                                  heightSpace5,
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
                                            _favouriteList[index]['time'],
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
                                            _favouriteList[index]['distance'],
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
                                            _favouriteList[index]['rating'],
                                            style: blackMedium13,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  heightSpace5,
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
                                            _favouriteList[index]['connection'],
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
                      ),
                    ),
                    heightSpace7
                  ],
                );
              },

              /*
     */
            ),
          ),
        ],
      ),
    );
  }

  Widget emptyFavourite() {
    return DoubleBackToCloseApp(
      snackBar: SnackBar(
          duration: const Duration(milliseconds: 1500),
          backgroundColor: primaryColor,
          content: Text(
            translation(context).pressBackAgain,
            style: whiteSemiBold16,
          )),
      child: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_rounded,
                size: 4.5.h,
                color: dashLineColor,
              ),
              heightSpace5,
              Text(translation(context).emptyFavList, style: dashLineBold16)
            ],
          ),
        ),
      ),
    );
  }
}
