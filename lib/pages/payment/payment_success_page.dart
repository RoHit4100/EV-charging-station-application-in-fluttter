import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:fl_speedcharge/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../helper/language_constant.dart';

class PaymentSuccessPage extends StatelessWidget {
  final String vehicleType;
  const PaymentSuccessPage({Key? key, required this.vehicleType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List bookingDetail = [
      {'title': translation(context).date, 'subtitle': '12 dec 222'},
      {
        'title': translation(context).vehicle,
        'subtitle': vehicleType == 'car'
            ? 'Volvo XC40 recharge'
            : 'Hero Electric Photon'
      },
      {'title': translation(context).slotTime, 'subtitle': '6.00AM'},
      {
        'title': translation(context).price,
        'subtitle': vehicleType == 'car' ? '\$0.05/kw' : '\$0.04/kw'
      },
    ];
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/BottomNavigation');
                },
                child: Text(translation(context).back, style: primaryBold16)),
          ],
        ),
      ),
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
            duration: const Duration(milliseconds: 1500),
            backgroundColor: primaryColor,
            content: Text(
              translation(context).pressBackAgain,
              style: whiteSemiBold16,
            )),
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              height: 90.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 515,
                    width: 100.w,
                    // color: amber,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        DottedBorder(
                          padding: EdgeInsets.zero,
                          color: primaryColor,
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [3, 3],
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Container(
                              height: 456,
                              width: 90.w,
                              decoration: const BoxDecoration(
                                  color: Color(0xffF0F7FF),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                children: [
                                  heightSpace60,
                                  Text('${translation(context).successful}!',
                                      style: primaryBold20),
                                  heightSpace25,
                                  const DottedLine(
                                    lineThickness: .5,
                                    dashColor: primaryColor,
                                    dashGapLength: 3,
                                    dashLength: 3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 17, vertical: 15),
                                    child: Column(
                                      children: bookingDetail
                                          .map((e) => Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(e['title'],
                                                        style:
                                                            primarySemiBold14),
                                                    Text(e['subtitle'],
                                                        style: bookingDetail
                                                                    .indexOf(
                                                                        e) ==
                                                                bookingDetail
                                                                        .length -
                                                                    1
                                                            ? primaryBold16
                                                            : dashLineSemiBold16),
                                                  ],
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                  const DottedLine(
                                    lineThickness: .5,
                                    dashColor: primaryColor,
                                    dashGapLength: 3,
                                    dashLength: 3,
                                  ),
                                  heightSpace20,
                                  Text(
                                      vehicleType == 'car'
                                          ? 'Broome station'
                                          : 'Ola charging station',
                                      style: primaryBold16),
                                  heightSpace8,
                                  SizedBox(
                                    width: 50.w,
                                    child: Text(
                                      'B 420 Broome station,New york,NY 100013,USA',
                                      style: dashLineSemiBold14,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  heightSpace15,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/DirectionPage');
                                        },
                                        child: SizedBox(
                                          height: 4.3.h,
                                          child: Image.asset(navigate),
                                        ),
                                      ),
                                      widthSpace10,
                                      SizedBox(
                                        height: 4.3.h,
                                        child: Image.asset(call),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 0,
                            child: SizedBox(
                                height: 11.5.h,
                                child: Image.asset(paymentSuccess)))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
