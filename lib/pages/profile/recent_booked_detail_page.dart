import 'package:dotted_line/dotted_line.dart';
import 'package:fl_speedcharge/helper/ui_helper.dart';
import 'package:fl_speedcharge/utils/constant.dart';
import 'package:fl_speedcharge/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../helper/language_constant.dart';
import '../booking/booking_slot_page.dart';

class RecentBookedDetailPage extends StatelessWidget {
  final String vehicleType;
  const RecentBookedDetailPage({Key? key, required this.vehicleType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List bookingDetailsList = [
      {'title': translation(context).date, 'subtitle': '12 dec 222'},
      {'title': translation(context).slotTime, 'subtitle': '6.00AM'},
      {'title': translation(context).connectionType, 'subtitle': 'CCS'},
      {'title': translation(context).battery, 'subtitle': '120kw'},
      {'title': translation(context).price, 'subtitle': '\$0.04/kw'},
    ];
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: MyAppBar(),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            MyContainerWithChild(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 9.5),
              borderRadius: 0,
              child: Row(children: [
                Container(
                  height: 108,
                  width: 131,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            vehicleType == 'car' ? carMain1 : bikeMain2)),
                  ),
                ),
                widthSpace27,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          vehicleType == 'car'
                              ? 'Broome station'
                              : 'Ola charging station',
                          style: blackBold16),
                      heightSpace5,
                      RatingBar.builder(
                        itemSize: 1.8.h,
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.only(right: 2),
                        unratedColor: dashLineColor,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_outlined,
                          color: primaryColor,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      heightSpace5,
                      Text(
                        'B 420 Ola charging,New york,NY 100013, USA',
                        style: dashLineSemiBold14,
                        maxLines: 2,
                      )
                    ],
                  ),
                ),
              ]),
            ),
            heightSpace20,
            MyContainerWithChild(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Column(
                children: [
                  Row(
                    children: [
                      vehicleType == 'car'
                          ? SizedBox(
                              width: 145,
                              height: 80,
                              child: Image.asset(coolCar))
                          : SizedBox(
                              width: 156,
                              height: 101,
                              child: Image.asset(coolBike)),
                      widthSpace20,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              vehicleType == 'car'
                                  ? 'Volvo XC40 Recharge'
                                  : 'Hero Electric Photon',
                              style: blackBold16),
                          Text(vehicleType == 'car' ? '4 wheeler' : '2 wheeler',
                              style: dashLineSemiBold16),
                        ],
                      )
                    ],
                  ),
                  vehicleType == 'car' ? heightSpace20 : heightSpace10,
                  const DottedLine(
                    lineThickness: 1,
                    dashColor: dashLineColor,
                  ),
                  heightSpace10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Column(
                      children: bookingDetailsList
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(e['title'], style: blackSemiBold16),
                                    Text(e['subtitle'],
                                        style: bookingDetailsList.indexOf(e) ==
                                                bookingDetailsList.length - 1
                                            ? primaryBold16
                                            : dashLineSemiBold16),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            heightSpace30,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PrimaryButton(
                title: translation(context).reBooking,
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          isIos: true,
                          child: BookingSlotPage(vehicleType: vehicleType),
                          type: PageTransitionType.rightToLeft));
                },
              ),
            ),
            heightSpace20,
            GestureDetector(
              onTap: () {
                UiHelper.showRatingDialog(context);
              },
              child: Text(
                translation(context).giveRate,
                style: primaryBold18,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));
  }
}
