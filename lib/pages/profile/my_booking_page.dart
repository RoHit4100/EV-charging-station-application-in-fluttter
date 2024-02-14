import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:fl_speedcharge/pages/profile/recent_booked_detail_page.dart';
import 'package:fl_speedcharge/utils/constant.dart';
import 'package:fl_speedcharge/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../helper/language_constant.dart';

class MyBookingPage extends StatefulWidget {
  const MyBookingPage({Key? key}) : super(key: key);

  @override
  State<MyBookingPage> createState() => _MyBookingPageState();
}

List onGoingList = [
  {
    'image': bikeMain1,
    'station': 'Ola charging station',
    'date': '6 Oct, 2022 at 10.00AM',
    'address': 'B 420 Broome station,New york, NY 100013, USA',
    'vehicleType': 'bike',
  },
  {
    'image': carMain1,
    'station': 'Hp charging station',
    'date': '10 Oct, 2022 at 8.00AM',
    'address': 'B 420 Broome station,New york, NY 100013, USA',
    'vehicleType': 'car',
  },
];

class _MyBookingPageState extends State<MyBookingPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: false,
        iconTheme: const IconThemeData(color: black),
        backgroundColor: white,
        shadowColor: colorForShadow,
        // elevation: 0,
        title: Align(
            alignment: Localizations.localeOf(context) == const Locale('ar')
                ? const Alignment(1.2, 0)
                : const Alignment(-1.2, 0),
            child: AutoSizeText(
              translation(context).myBooking,
              style: blackBold20,
              maxLines: 1,
            )),
        bottom: TabBar(
          labelColor: primaryColor,
          indicatorColor: primaryColor,
          unselectedLabelColor: dashLineColor,
          labelStyle: primaryBold16,
          controller: _tabController,
          tabs: [
            Tab(child: Text(translation(context).onGoingBooking)),
            Tab(child: Text(translation(context).bookingHistory)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          onGoingBookingTab(),
          bookingHistory(),
        ],
      ),
    );
  }

  Widget onGoingBookingTab() {
    if (onGoingList.isNotEmpty) {
      return SingleChildScrollView(
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: onGoingList.length,
          itemBuilder: (BuildContext context, int index) {
            return MyContainerWithChild(
              // color: Color(0xffF5F8FC),
              padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
              margin: const EdgeInsets.only(bottom: 20),
              onTap: () {
                // if (_favouriteList[index]['vehicleType'] == 'car') {
                //   Navigator.push(
                //       context,
                //       PageTransition(
                //           isIos: true,
                //           child: const ChargingStationPage(
                //               vehicleType: 'car'),
                //           type: PageTransitionType.rightToLeft));
                // } else {
                //   Navigator.push(
                //       context,
                //       PageTransition(
                //           isIos: true,
                //           child: const ChargingStationPage(
                //               vehicleType: 'bike'),
                //           type: PageTransitionType.rightToLeft));
                // }
              },
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage(onGoingList[index]['image']))),
                        height: 13.5.h,
                        width: 128,
                      ),
                    ],
                  ),
                  widthSpace15,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          onGoingList[index]['station'],
                          style: primaryBold16,
                          maxLines: 1,
                        ),
                        heightSpace2,
                        Text(onGoingList[index]['date'],
                            style: blackSemiBold14),
                        heightSpace2,
                        AutoSizeText(
                          onGoingList[index]['address'],
                          style: dashLineSemiBold13,
                          maxLines: 2,
                        ),
                        heightSpace10,
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  if (onGoingList[index]['vehicleType'] ==
                                      'car') {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            isIos: true,
                                            child: const RecentBookedDetailPage(
                                                vehicleType: 'car'),
                                            type: PageTransitionType
                                                .rightToLeft));
                                  } else {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            isIos: true,
                                            child: const RecentBookedDetailPage(
                                                vehicleType: 'bike'),
                                            type: PageTransitionType
                                                .rightToLeft));
                                  }
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(translation(context).goDetail,
                                      style: whiteBold14),
                                ),
                              ),
                            ),
                            widthSpace10,
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                showCancelDialog(
                                    onGoingList[index]['station'], index);
                              },
                              child: MyContainerWithChild(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                borderRadius: 5,
                                child: Text(translation(context).cancelSlot,
                                    style: primaryBold14, maxLines: 1),
                              ),
                            ))
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
      );
    } else {
      return Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.sentiment_dissatisfied_outlined,
                size: 4.5.h,
                color: dashLineColor,
              ),
              heightSpace5,
              Text('No booking yet', style: dashLineBold16)
            ],
          ),
        ),
      );
    }
  }

  Widget bookingHistory() {
    List historyList = [
      {
        'image': bikeMain2,
        'station': 'Broome station',
        'date': '6 April, 2021 at 10.00AM',
        'address': 'B 420 Broome station,New york, NY 100013, USA',
        'vehicleType': 'bike',
      },
      {
        'image': carMain1,
        'station': 'Hp charging station',
        'date': '10 April, 2021 at 6.00PM',
        'address': 'B 420 Broome station,New york, NY 100013, USA',
        'vehicleType': 'car',
      },
      {
        'image': history1,
        'station': 'Business center',
        'date': '15 April, 2021 at 7.00PM',
        'address': 'B 420 Broome station,New york, NY 100013, USA',
        'vehicleType': 'car',
      },
      {
        'image': history2,
        'station': 'Dc ec charging point',
        'date': '20 April, 2021 at 9.00PM',
        'address': 'B 420 Broome station,New york, NY 100013, USA',
        'vehicleType': 'car',
      },
      {
        'image': history3,
        'station': 'Ev charging spot',
        'date': '30 April, 2021 at 5.00PM',
        'address': 'B 420 Broome station,New york, NY 100013, USA',
        'vehicleType': 'car',
      },
      {
        'image': bikeMain3,
        'station': 'Hp charging station',
        'date': '30 April, 2021 at 5.00PM',
        'address': 'B 420 Broome station,New york, NY 100013, USA',
        'vehicleType': 'bike',
      },
      {
        'image': bikeMain1,
        'station': 'Ola charging station',
        'date': '30 April, 2021 at 5.00PM',
        'address': 'B 420 Broome station,New york, NY 100013, USA',
        'vehicleType': 'bike',
      },
      {
        'image': history1,
        'station': 'Mass tec station',
        'date': '30 April, 2021 at 5.00PM',
        'address': 'B 420 Broome station,New york, NY 100013, USA',
        'vehicleType': 'car',
      },
    ];
    return SingleChildScrollView(
      child: ListView.builder(
        padding: const EdgeInsets.all(20),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: historyList.length,
        itemBuilder: (BuildContext context, int index) {
          return MyContainerWithChild(
            // color: Color(0xffF5F8FC),
            padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
            margin: const EdgeInsets.only(bottom: 20),
            onTap: () {
              // if (_favouriteList[index]['vehicleType'] == 'car') {
              //   Navigator.push(
              //       context,
              //       PageTransition(
              //           isIos: true,
              //           child: const ChargingStationPage(
              //               vehicleType: 'car'),
              //           type: PageTransitionType.rightToLeft));
              // } else {
              //   Navigator.push(
              //       context,
              //       PageTransition(
              //           isIos: true,
              //           child: const ChargingStationPage(
              //               vehicleType: 'bike'),
              //           type: PageTransitionType.rightToLeft));
              // }
            },
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(historyList[index]['image']))),
                      height: 13.5.h,
                      width: 128,
                    ),
                  ],
                ),
                widthSpace15,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        historyList[index]['station'],
                        style: primaryBold16,
                        maxLines: 1,
                      ),
                      heightSpace2,
                      Text(historyList[index]['date'], style: blackSemiBold14),
                      heightSpace2,
                      AutoSizeText(
                        historyList[index]['address'],
                        style: dashLineSemiBold13,
                        maxLines: 2,
                      ),
                      heightSpace10,
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (historyList[index]['vehicleType'] == 'car') {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        isIos: true,
                                        child: const RecentBookedDetailPage(
                                            vehicleType: 'car'),
                                        type: PageTransitionType.rightToLeft));
                              } else {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        isIos: true,
                                        child: const RecentBookedDetailPage(
                                            vehicleType: 'bike'),
                                        type: PageTransitionType.rightToLeft));
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(translation(context).goDetail,
                                  style: whiteBold14),
                            ),
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
    );
  }

  showCancelDialog(String stringValue, int index) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          // insetPadding: EdgeInsets.symmetric(horizontal: 20),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40,
                child: Image.asset(cancelSlot),
              ),
              heightSpace15,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '${translation(context).deleteBookingTitle} ${stringValue.toLowerCase()}?',
                  style: blackSemiBold16,
                  textAlign: TextAlign.center,
                ),
              ),
              heightSpace15,
              heightSpace2,
              SizedBox(
                width: 100.w,
                child: const DottedLine(
                  lineThickness: 1,
                  dashColor: primaryColor,
                ),
              ),
              heightSpace15,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(translation(context).no,
                            style: blackSemiBold18)),
                    widthSpace30,
                    InkWell(
                        onTap: () {
                          setState(() {
                            onGoingList.removeAt(index);
                          });
                          Navigator.pop(context);
                        },
                        child: Text(translation(context).yes,
                            style: primarySemiBold18)),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
