import 'dart:developer';

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:fl_speedcharge/utils/constant.dart';
import 'package:fl_speedcharge/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../helper/language_constant.dart';
import '../location/pick_point_page.dart';

class EnRoutePage extends StatefulWidget {
  const EnRoutePage({Key? key}) : super(key: key);

  @override
  State<EnRoutePage> createState() => _EnRoutePageState();
}

class _EnRoutePageState extends State<EnRoutePage> {
  PickResult? selectedPlace;
  String? pickedStartPoint;
  String? pickedEndPoint;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
            duration: const Duration(milliseconds: 1500),
            backgroundColor: primaryColor,
            content: Text(
              translation(context).pressBackAgain,
              style: whiteSemiBold16,
            )),
        child: SingleChildScrollView(
          child: ListView(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Container(
                height: 385,
                width: 100.w,
                color: white,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      width: 100.w,
                      height: 290,
                      child: Image.asset(
                        enRouteMain,
                        fit: BoxFit.fill,
                      ),
                    ),
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
                            transparent,
                            transparent,
                          ],
                        )),
                      ),
                    ),
                    Positioned(
                        top: 50,
                        child: Text(translation(context).enRouteChargingPoint,
                            style: blackBold20))
                  ],
                ),
              ),
              heightSpace20,
              heightSpace5,
              MyContainerWithChild(
                // height: 12.h,
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: PickPointPage(
                            onPlacePicked: (pickresult) {
                              log("Place picked: ${pickresult.formattedAddress}");
                              setState(() {
                                selectedPlace = pickresult;
                                pickedStartPoint =
                                    selectedPlace!.formattedAddress.toString();
                                Navigator.of(context).pop();
                              });
                            },
                          ),
                          type: PageTransitionType.rightToLeft));
                },
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    SizedBox(height: 2.8.h, child: Image.asset(pickPoint)),
                    widthSpace15,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(translation(context).pickStartingPoint,
                            style: blackSemiBold16),
                        heightSpace5,
                        SizedBox(
                          width: 55.w,
                          child: Text(
                            pickedStartPoint ??
                                "B 420 Broome station,New york,NY 100013, USA",
                            style: dashLineSemiBold14,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              MyContainerWithChild(
                // height: 10.h,
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: PickPointPage(
                            onPlacePicked: (pickresult) {
                              setState(() {
                                selectedPlace = pickresult;
                                pickedEndPoint =
                                    selectedPlace!.formattedAddress.toString();
                                Navigator.of(context).pop();
                              });
                            },
                          ),
                          type: PageTransitionType.rightToLeft));
                },
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    SizedBox(height: 2.8.h, child: Image.asset(pickPoint)),
                    widthSpace15,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(translation(context).pickDestinationPoint,
                            style: blackSemiBold16),
                        heightSpace5,
                        SizedBox(
                          width: 55.w,
                          child: Text(
                            pickedEndPoint ??
                                "4517 Washington Ave. Manchester,Kentucky 39495",
                            style: dashLineSemiBold14,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              heightSpace40,
              heightSpace2,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PrimaryButton(
                  title: translation(context).seeEnRouteChargingPoint,
                  onTap: () {
                    Navigator.pushNamed(context, '/RouteSearchPage');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
