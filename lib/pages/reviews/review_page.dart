import 'package:fl_speedcharge/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constant.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List ratingList = [
      {
        'image': user1,
        'user': 'Esther Howard',
        'rating': 5.0,
        'comment':
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit Amet minim mollit non',
      },
      {
        'image': user2,
        'user': 'Leslie Alexander',
        'rating': 3.0,
        'comment':
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit Amet minim mollit non',
      },
      {
        'image': user3,
        'user': 'Jenny Wilson',
        'rating': 4.0,
        'comment':
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit Amet minim mollit non',
      },
      {
        'image': user5,
        'user': 'Brooklyn Simmons',
        'rating': 3.0,
        'comment':
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit Amet minim mollit non',
      },
      {
        'image': user6,
        'user': 'Kathryn Murphy',
        'rating': 3.0,
        'comment':
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit Amet minim mollit non',
      },
      {
        'image': user7,
        'user': 'Cameron Williamson',
        'rating': 4.0,
        'comment':
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit Amet minim mollit non',
      },
      {
        'image': user4,
        'user': 'Brooklyn Simmons',
        'rating': 3.0,
        'comment':
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit Amet minim mollit non',
      },
    ];

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: MyAppBar(
            title: 'Review',
          )),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: ratingList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: white,
                      backgroundImage: AssetImage(ratingList[index]['image']),
                    ),
                    widthSpace10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(ratingList[index]['user'], style: blackRegular16),
                        heightSpace6,
                        RatingBar.builder(
                          itemSize: 1.8.h,
                          initialRating: ratingList[index]['rating'],
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
          );
        },
      ),
    );
  }
}
