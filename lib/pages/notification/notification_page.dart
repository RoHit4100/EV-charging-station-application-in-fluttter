import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../helper/column_builder.dart';
import '../../helper/language_constant.dart';
import '../../utils/constant.dart';
import '../../utils/widgets.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List notificationList = [
    {
      'type': 'Today',
      'data': [
        {
          'title': 'Booking success',
          'subtitle':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero mattis a netus morbi',
          'time': '2 min ago',
        },
        {
          'title': 'Payment successful',
          'subtitle':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero mattis a netus morbi',
          'time': '4 min ago',
        },
      ],
    },
    {
      'type': 'Yesterday',
      'data': [
        {
          'title': 'Broome charging spot',
          'subtitle':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero mattis a netus morbi',
          'time': '6 min',
        },
        {
          'title': 'Charge your car',
          'subtitle':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero mattis a netus morbi',
          'time': '10 min',
        },
        {
          'title': 'Payment successful',
          'subtitle':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero mattis a netus morbi',
          'time': '12 min',
        },
        {
          'title': 'Dc ev charging hub',
          'subtitle':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero mattis a netus morbi',
          'time': '12 min',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: MyAppBar(
            title: translation(context).notification,
          )),
      body: notificationList.isNotEmpty
          ? activeNotification(size, context)
          : notActiveNotification(),
    );
  }

  Widget notActiveNotification() {
    return Center(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 4.5.h,
            //   child: Image.asset(emptyNotification),
            // ),
            Icon(
              Icons.notifications,
              size: 4.5.h,
              color: dashLineColor,
            ),
            heightSpace5,
            Text(translation(context).noNewNotification, style: dashLineBold16)
          ],
        ),
      ),
    );
  }

//for active notification
  Widget activeNotification(Size size, BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 5),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: notificationList.length,
        itemBuilder: (context, index) {
          final item = notificationList[index];
          return ColumnBuilder(
            itemCount: item['data'].length,
            crossAxisAlignment: CrossAxisAlignment.start,
            itemBuilder: (BuildContext context, int index) {
              final dataItem = item['data'][index];
              return Dismissible(
                background: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  color: Colors.red,
                ),
                key: Key('$dataItem'),
                onDismissed: (direction) {
                  setState(() {
                    item['data'].removeAt(index);
                  });

                  if (notificationList[0]['data'].isEmpty &&
                      notificationList[1]['data'].isEmpty) {
                    setState(() {
                      notificationList.clear();
                    });
                  }
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: primaryColor,
                      duration: const Duration(seconds: 1),
                      content: Text(
                        "${dataItem['title']} ${translation(context).dismissed}",
                        style: whiteSemiBold16,
                      )));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: colorForShadow,
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: const Offset(0, 0)),
                      ]),
                  child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(15),
                          height: 50,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child:
                              //  Image.asset(notificationIcon),
                              const Icon(
                            Icons.notifications_sharp,
                            color: white,
                          )),
                      widthSpace20,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            dataItem['title'],
                            style: blackBold16,
                            maxLines: 1,
                          ),
                          heightSpace5,
                          SizedBox(
                            width: 60.w,
                            child: AutoSizeText(
                              dataItem['subtitle'],
                              style: blackMedium14,
                              overflow: TextOverflow.fade,
                              maxLines: 2,
                            ),
                          ),
                          heightSpace5,
                          AutoSizeText(
                            dataItem!['time'],
                            style: const TextStyle(
                              color: Color(0xffA6A4A4),
                              fontSize: 14,
                              fontFamily: 'B',
                            ),
                            textAlign: TextAlign.end,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
