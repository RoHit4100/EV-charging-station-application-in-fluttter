import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../utils/constant.dart';
import '../utils/widgets.dart';
import 'language_constant.dart';

class UiHelper {
  static void showRatingDialog(
    BuildContext context,
  ) {
    AlertDialog logoutDialog = AlertDialog(
      elevation: 0,
      // backgroundColor: transparent,
      contentPadding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: SizedBox(
        width: 80.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(translation(context).yourReview, style: blackSemiBold18),
            heightSpace10,
            Text(
              translation(context).pleaseGiveRate,
              style: dashLineSemiBold14,
              textAlign: TextAlign.center,
            ),
            heightSpace15,
            RatingBar.builder(
              itemSize: 3.5.h,
              initialRating: 4,
              minRating: 1,
              direction: Axis.horizontal,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) =>
                  // Icon(
                  //   Icons.star,
                  //   color: Color(0xffDEBA3A),
                  // ),
                  SvgPicture.asset(
                ratingStar,
                color: primaryColor,
                height: .3.h,
              ),
              unratedColor: dashLineColor,
              onRatingUpdate: (rating) {},
            ),
            heightSpace15,
            MyContainerWithChild(
              // height: 110,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: translation(context).saySomething,
                  hintStyle: blackMedium16,
                  border: InputBorder.none,
                ),
                style: blackMedium16,
                maxLines: 5,
                minLines: 5,
              ),
            ),
            heightSpace10,
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                translation(context).send,
                style: primarySemiBold18,
              ),
            )
          ],
        ),
      ),
    );

    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => logoutDialog);
  }

//*logout dialog
  static void showLogOutDialog(
    BuildContext context,
  ) {
    AlertDialog logoutDialog = AlertDialog(
      contentPadding: const EdgeInsets.only(top: 30, bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
            width: 75.w,
            child: AutoSizeText(
              translation(context).areYouSureLogout,
              style: blackMedium18,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:
                      Text(translation(context).cancel, style: dashLineBold18)),
              widthSpace25,
              GestureDetector(
                  onTap: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacementNamed(context, '/LoginPage');
                  },
                  child:
                      Text(translation(context).logOut, style: primaryBold18)),
            ],
          ),
        ),
      ],
    );
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => logoutDialog);
  }

//*loading dialog
  static void showLoadingDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: Container(
            width: 100.w,
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(color: primaryColor),
                heightSpace20,
                Text(
                  title,
                  style: primarySemiBold16,
                ),
              ],
            )),
      ),
    );
  }
}
