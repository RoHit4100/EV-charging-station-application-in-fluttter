import 'package:fl_speedcharge/pages/booking/booking_slot_page.dart';
import 'package:fl_speedcharge/utils/constant.dart';
import 'package:fl_speedcharge/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../helper/language_constant.dart';

class ChargingStationPage extends StatefulWidget {
  final String vehicleType;
  const ChargingStationPage({Key? key, required this.vehicleType})
      : super(key: key);

  @override
  State<ChargingStationPage> createState() => _ChargingStationPageState();
}

class _ChargingStationPageState extends State<ChargingStationPage> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationMethod(context, widget.vehicleType),
      extendBodyBehindAppBar: true,
      appBar: appBarMethod(context),
      body: bodyMethod(context),
    );
  }

  Column bodyMethod(BuildContext context) {
    List ratingList = [
      {
        'image': user1,
        'user': 'Arshan Patil',
        'rating': 5.0,
        'comment':
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit Amet minim mollit non',
      },
      {
        'image': user2,
        'user': 'Aditya Singh',
        'rating': 3.0,
        'comment':
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit Amet minim mollit non',
      },
      {
        'image': user3,
        'user': 'Rahi Patel',
        'rating': 4.0,
        'comment':
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit Amet minim mollit non',
      },
      {
        'image': user4,
        'user': 'Sakshi Yadav',
        'rating': 3.0,
        'comment':
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit Amet minim mollit non',
      },
    ];
    List reviewDetailList = [
      {
        'title': '5 star',
        'percent': 0.8,
        'total': '101',
      },
      {
        'title': '4 star',
        'percent': 0.5,
        'total': '12',
      },
      {
        'title': '3 star',
        'percent': 0.4,
        'total': '7',
      },
      {
        'title': '2 star',
        'percent': 0.25,
        'total': '4',
      },
      {
        'title': '1 star',
        'percent': 0.1,
        'total': '2',
      },
    ];
    List connectionTypeList = [
      {
        'image': connectionType1,
        'label': 'CCS2',
        'title': '150kw',
        'subtitle': '(\$0.05/kw)',
        'taken': '0/2 taken',
      },
      {
        'image': connectionType2,
        'label': 'CCS',
        'title': '120kw',
        'subtitle': '(\$0.05/kw)',
        'taken': '3/3 taken',
      },
      {
        'image': connectionType3,
        'label': 'Mennekers',
        'title': '22kw',
        'subtitle': '(\$0.02/kw)',
        'taken': '0/2 taken',
      },
    ];
    List carSlider = [carMain1, carMain2, carMain3];
    List bikeSlider = [bikeMain1, bikeMain2, bikeMain3];
    List amenitiesList = [
      {'image': amenities1, 'label': 'Cafe'},
      {'image': amenities2, 'label': 'Store'},
      {'image': amenities3, 'label': 'Park'},
      {'image': amenities4, 'label': 'Toilet'},
      {'image': amenities5, 'label': 'Food'},
    ];

    return Column(
      children: [
        widget.vehicleType == 'car'
            ? Container(
                height: 26.8.h,
                color: appGrey,
                child: CarouselSlider(
                  unlimitedMode: true,
                  enableAutoSlider: false,
                  autoSliderTransitionTime: const Duration(milliseconds: 500),
                  slideIndicator: CircularSlideIndicator(
                    padding: const EdgeInsets.only(bottom: 10),
                    currentIndicatorColor: primaryColor,
                    indicatorBackgroundColor: white,
                  ),
                  children: carSlider
                      .map(
                        (e) => Stack(children: [
                          SizedBox(
                            width: 100.w,
                            child: Image.asset(
                              e,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 28, vertical: 7),
                                  decoration: const BoxDecoration(
                                      color: Color(0xff0D7B17),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10))),
                                  child: Text('Open', style: whiteSemiBold16)))
                        ]),
                      )
                      .toList(),
                ))
            : Container(
                height: 26.8.h,
                color: appGrey,
                child: CarouselSlider(
                  unlimitedMode: true,
                  enableAutoSlider: false,
                  autoSliderTransitionTime: const Duration(milliseconds: 500),
                  slideIndicator: CircularSlideIndicator(
                    padding: const EdgeInsets.only(bottom: 10),
                    currentIndicatorColor: primaryColor,
                    indicatorBackgroundColor: white,
                  ),
                  children: bikeSlider
                      .map(
                        (e) => Stack(children: [
                          SizedBox(
                            width: 100.w,
                            child: Image.asset(
                              e,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 28, vertical: 7),
                                  decoration: const BoxDecoration(
                                      color: Color(0xff0D7B17),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10))),
                                  child: Text('Open', style: whiteSemiBold16)))
                        ]),
                      )
                      .toList(),
                )),
        Expanded(
          child: SingleChildScrollView(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                heightSpace15,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          widget.vehicleType == 'car'
                              ? 'Broome charging station'
                              : 'Ola charging station',
                          style: blackBold20),
                      heightSpace5,
                      Row(
                          children: List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: [
                              Icon(
                                index == 0
                                    ? Icons.watch_later_rounded
                                    : index == 1
                                        ? Icons.location_on_rounded
                                        : Icons.star,
                                size: 2.h,
                                color:
                                    index == 2 ? primaryColor : dashLineColor,
                              ),
                              widthSpace5,
                              Text(
                                  index == 0
                                      ? '24*7hr'
                                      : index == 1
                                          ? '2.5 km'
                                          : '4.5',
                                  style: blackMedium13),
                            ],
                          ),
                        ),
                      )),
                      heightSpace5,
                      SizedBox(
                        width: 50.w,
                        child: Text(
                          'B 420 Ola charging station,New york, NY 100013, USA',
                          style: TextStyle(
                            fontSize: 9.5.sp,
                            color: const Color(0xff8B8B8B),
                            fontFamily: 'SB',
                          ),
                          maxLines: 2,
                        ),
                      ),
                      heightSpace20,
                      Text(translation(context).amenities, style: blackBold16),
                      heightSpace15,
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: amenitiesList
                              .map((e) => Column(
                                    children: [
                                      Container(
                                        height: 5.2.h,
                                        width: 5.2.h,
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            color: white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 4,
                                                  color: colorForShadow),
                                            ]),
                                        child: Image.asset(e['image']),
                                      ),
                                      heightSpace6,
                                      Text(
                                        e['label'],
                                        style: dashLineSemiBold14,
                                      )
                                    ],
                                  ))
                              .toList()),
                      heightSpace20,
                      Text(translation(context).connectionType,
                          style: blackBold16),
                      heightSpace15,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: connectionTypeList
                            .map((e) => Column(
                                  children: [
                                    MyContainerWithChild(
                                      height: 117,
                                      // width: 117,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 11, horizontal: 20),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 2.4.h,
                                            child: Image.asset(e['image']),
                                          ),
                                          heightSpace7,
                                          Text(e['label'],
                                              style: primaryBold14),
                                          heightSpace3,
                                          Text(e['title'],
                                              style: blackSemiBold14),
                                          heightSpace3,
                                          Text(e['subtitle'],
                                              style: blackSemiBold14),
                                        ],
                                      ),
                                    ),
                                    heightSpace10,
                                    Text(
                                      e['taken'],
                                      style: connectionTypeList.indexOf(e) == 1
                                          ? redBold16
                                          : greenBold16,
                                    )
                                  ],
                                ))
                            .toList(),
                      ),
                      heightSpace20,
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 85,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: colorForShadow,
                                  ),
                                ],
                              ),
                              // width: 117,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 20),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 2.4.h,
                                    child: const Icon(
                                        Icons.battery_charging_full_rounded,
                                        color: primaryColor,
                                        size: 30),
                                  ),
                                  heightSpace7,
                                  heightSpace7,
                                  Text("Battery Swap", style: primaryBold14),
                                ],
                              ),
                            ),
                            heightSpace10,
                            Text('Available', style: greenBold16),
                          ],
                        ),
                      ),
                      Text(translation(context).review, style: blackBold16),
                      heightSpace15,
                      MyContainerWithChild(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 17),
                        child: Column(
                          children: [
                            Text(translation(context).rating,
                                style: blackSemiBold16),
                            heightSpace20,
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text('4.5', style: blackMedium16),
                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) => Icon(Icons.star,
                                            color: primaryColor, size: 1.4.h),
                                      ),
                                    ),
                                    heightSpace3,
                                    Text(
                                      '(25 review)',
                                      style: dashLineMedium14,
                                    )
                                  ],
                                ),
                                widthSpace15,
                                Expanded(
                                  child: Column(
                                    children: reviewDetailList
                                        .map(
                                          (e) => Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 9),
                                            child: Row(
                                              children: [
                                                Text(e['title'],
                                                    style: dashLineMedium14),
                                                Expanded(
                                                  child: LinearPercentIndicator(
                                                    lineHeight: 4.0,
                                                    percent: e['percent'],
                                                    backgroundColor:
                                                        const Color(0xffF0F0F0),
                                                    progressColor: primaryColor,
                                                  ),
                                                ),
                                                Text(e['total'],
                                                    style: dashLineMedium14),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      heightSpace20,
                      Column(
                          children: List.generate(
                        ratingList.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundColor: white,
                                    backgroundImage:
                                        AssetImage(ratingList[index]['image']),
                                  ),
                                  widthSpace10,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(ratingList[index]['user'],
                                          style: blackRegular16),
                                      heightSpace6,
                                      RatingBar.builder(
                                        itemSize: 1.8.h,
                                        initialRating: ratingList[index]
                                            ['rating'],
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        itemCount: 5,
                                        itemPadding:
                                            const EdgeInsets.only(right: 2),
                                        unratedColor: dashLineColor,
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star_outlined,
                                          color: primaryColor,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              heightSpace10,
                              Text(
                                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit Amet minim mollit non',
                                style: TextStyle(
                                  color: const Color(0xffA6A4A4),
                                  fontSize: 10.sp,
                                  fontFamily: 'M',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
                heightSpace10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: PrimaryButton(
                    containerColor: white,
                    title: translation(context).seeAllReview,
                    textStyle: primaryBold16,
                    shadowColor: colorForShadow,
                    onTap: () {
                      Navigator.pushNamed(context, '/ReviewPage');
                    },
                  ),
                ),
                heightSpace20,
              ],
            ),
          ),
        ),
      ],
    );
  }

  AppBar appBarMethod(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      backgroundColor: transparent,
      elevation: 0,
      actions: [
        GestureDetector(
          onTap: () {
            !isFavourite
                ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: const Duration(milliseconds: 1500),
                    backgroundColor: primaryColor,
                    content: Text(
                      translation(context).addedFav,
                      style: whiteSemiBold16,
                    )))
                : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: const Duration(milliseconds: 1500),
                    backgroundColor: primaryColor,
                    content: Text(
                      translation(context).removefav,
                      style: whiteSemiBold16,
                    )));
            setState(() {
              isFavourite = !isFavourite;
            });
          },
          child: Icon(
            Icons.favorite_rounded,
            color: isFavourite ? primaryColor : white,
            size: 2.5.h,
          ),
        ),
        widthSpace15,
        GestureDetector(
          onTap: () {
            shareVia(context);
          },
          child: Icon(
            Icons.share,
            size: 2.5.h,
          ),
        ),
        widthSpace15,
        Icon(
          Icons.call,
          size: 2.5.h,
        ),
        widthSpace15,
      ],
    );
  }

  Container bottomNavigationMethod(BuildContext context, vehicleType) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFBFBFB),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: const Color(0xff000000).withOpacity(.10),
          )
        ],
      ),
      height: 8.5.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: vehicleType == 'car'
                  ? () {
                      Navigator.push(
                          context,
                          PageTransition(
                              isIos: true,
                              child: const BookingSlotPage(vehicleType: 'car'),
                              type: PageTransitionType.rightToLeft));
                    }
                  : () {
                      Navigator.push(
                          context,
                          PageTransition(
                              isIos: true,
                              child: const BookingSlotPage(vehicleType: 'bike'),
                              type: PageTransitionType.rightToLeft));
                    },
              child: Container(
                alignment: Alignment.center,
                height: 5.5.h,
                decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: colorForShadow,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: primaryColor)),
                child:
                    Text(translation(context).bookSlot, style: primaryBold18),
              ),
            )),
            widthSpace20,
            Expanded(
              child: PrimaryButton(
                onTap: () {
                  Navigator.pushNamed(context, '/DirectionPage');
                },
                title: "Direction",
              ),
            ),
            widthSpace20,
            Expanded(
              child: PrimaryButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/DeliveryPage');
                  },
                  title: "Delivery"),
            ),
          ],
        ),
      ),
    );
  }

  shareVia(BuildContext context) {
    List shareViaList = [
      {
        'image': share1,
        'title': translation(context).fb,
      },
      {
        'image': share2,
        'title': translation(context).whatsApp,
      },
      {
        'image': share3,
        'title': translation(context).instagram,
      },
    ];

    return showModalBottomSheet(
      backgroundColor: white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      )),
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 28),
                  child: Text(translation(context).shareVia,
                      style: blackSemiBold18),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: shareViaList
                        .map(
                          (e) => Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: 3.5.h,
                                        child: Image.asset(e['image'])),
                                    heightSpace10,
                                    Text(e['title'], style: blackMedium18),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList()),
                heightSpace10,
              ],
            ),
          ],
        );
      },
    );
  }
}
