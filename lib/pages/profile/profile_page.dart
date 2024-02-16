import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../helper/language_constant.dart';
import '../../helper/ui_helper.dart';
import '../../utils/constant.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> profileItems = [
      {
        'icon': profile1,
        'title': translation(context).editProfile,
        'navigation': '/EditProfilePage'
      },
      {
        'icon': profile2,
        'title': translation(context).myBooking,
        'navigation': '/MyBookingPage',
      },
      {
        'icon': profile3,
        'title': translation(context).language,
        'navigation': '/LanguagePage',
      },
      {
        'icon': profile4,
        'title': translation(context).termsAndCondition,
        'navigation': '/TermsAndConditionPage',
      },
      {
        'icon': profile5,
        'title': translation(context).faqs,
        'navigation': '/FAQPage',
      },
      {
        'icon': profile6,
        'title': translation(context).privacyPolicy,
        'navigation': '/PrivacyPolicyPage'
      },
      {
        'icon': profile7,
        'title': translation(context).help,
        'navigation': '/HelpPage'
      },
      {
        'icon': profile8,
        'title': translation(context).logOut,
        'navigation': '/RateUsScreen',
      },
    ];

    return Scaffold(
        body: DoubleBackToCloseApp(
      snackBar: SnackBar(
          duration: const Duration(milliseconds: 1500),
          backgroundColor: primaryColor,
          content: Text(
            translation(context).pressBackAgain,
            style: whiteSemiBold16,
          )),
      child: Stack(alignment: Alignment.center, children: [
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
        // Positioned(top: 50, child: Text('Profile', style: blackBold20)),
        Column(
          children: [
            Container(
              height: 50,
              width: 100.w,
              color: const Color(0xffEDF4FD).withOpacity(.1),
            ),
            Expanded(
                child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              shrinkWrap: true,
              children: [
                Text(translation(context).profile,
                    style: blackBold20, textAlign: TextAlign.center),
                heightSpace20,
                CircleAvatar(
                  radius: 6.h,
                  child: Image.asset(homeProfile),
                ),
                heightSpace10,
                Text('Rohit Udamale',
                    style: blackBold18, textAlign: TextAlign.center),
                heightSpace5,
                Text('+91 9373369378',
                    style: dashLineSemiBold14, textAlign: TextAlign.center),
                ListView.separated(
                  padding: const EdgeInsets.only(top: 25),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: index == profileItems.length - 1
                          ? () {
                              UiHelper.showLogOutDialog(context);
                            }
                          : () {
                              Navigator.pushNamed(
                                  context, profileItems[index]['navigation']);
                            },
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 4.5),
                        child: SizedBox(
                            // height: 19,
                            height: 2.1.h,
                            width: 2.1.h,
                            child: Image.asset(profileItems[index]['icon'])),
                      ),
                      title: Text(profileItems[index]['title'],
                          style: index != profileItems.length - 1
                              ? blackSemiBold16
                              : TextStyle(
                                  fontSize: 11.sp,
                                  color: const Color(0xffDC1C1C),
                                  fontFamily: 'SB',
                                )),
                      trailing: index != profileItems.length - 1
                          ? Icon(
                              Icons.chevron_right,
                              color: dashLineColor,
                              size: 3.2.h,
                            )
                          : const SizedBox(),
                    );
                  },
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(thickness: 1, color: Color(0xffD9D9D9)),
                  ),
                  itemCount: profileItems.length,
                ),
                heightSpace20,
              ],
            ))
          ],
        )
      ]),
    ));
  }
}
