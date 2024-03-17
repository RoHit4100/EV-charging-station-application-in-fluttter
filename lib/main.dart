import 'package:firebase_core/firebase_core.dart';
import 'package:fl_speedcharge/api/firebase_api.dart';
import 'package:fl_speedcharge/pages/auth/login_page.dart';
import 'package:fl_speedcharge/pages/auth/otp_page.dart';
import 'package:fl_speedcharge/pages/auth/register_page.dart';
import 'package:fl_speedcharge/pages/charging_station/charging_station_page.dart';
import 'package:fl_speedcharge/pages/location/direction_page.dart';
import 'package:fl_speedcharge/pages/location/delivery_page.dart';
import 'package:fl_speedcharge/pages/location/route_search_page.dart';
import 'package:fl_speedcharge/pages/notification/notification_page.dart';
import 'package:fl_speedcharge/pages/on_boarding/on_boarding_page.dart';
import 'package:fl_speedcharge/pages/profile/edit_profile_page.dart';
import 'package:fl_speedcharge/pages/profile/f_a_q_page.dart';
import 'package:fl_speedcharge/pages/profile/help_page.dart';
import 'package:fl_speedcharge/pages/profile/language_page.dart';
import 'package:fl_speedcharge/pages/profile/my_booking_page.dart';
import 'package:fl_speedcharge/pages/profile/privacy_policy_page.dart';
import 'package:fl_speedcharge/pages/profile/terms_and_condition_page.dart';
import 'package:fl_speedcharge/pages/reviews/review_page.dart';
import 'package:fl_speedcharge/pages/search/search_page.dart';
import 'package:fl_speedcharge/utils/constant.dart';
import 'package:fl_speedcharge/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import "api/firebase_api.dart";

import 'bottom_navigation.dart';
import 'helper/language_constant.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Call the initNotifications method
  await FirebaseApi().initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => setLocale(locale));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Speed Charge',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: _locale,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  systemOverlayStyle:
                      SystemUiOverlayStyle(statusBarColor: transparent)),
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: const Color(0xffFFFFFF),
            ),
            // initialRoute: '/BottomNavigation',
            initialRoute: '/SplashPage',
            // initialRoute: '/DirectionPage',
            onGenerateRoute: (route) {
              switch (route.name) {
                case '/SplashPage':
                  return PageTransition(
                      isIos: true,
                      child: const SplashPage(),
                      type: PageTransitionType.rightToLeft);
                case '/OnBoardingPage':
                  return PageTransition(
                      isIos: true,
                      child: const OnBoardingPage(),
                      type: PageTransitionType.rightToLeft);
                case '/LoginPage':
                  return PageTransition(
                      isIos: true,
                      child: const LoginPage(),
                      type: PageTransitionType.rightToLeft);
                case '/RegisterPage':
                  return PageTransition(
                      isIos: true,
                      child: const RegisterPage(),
                      type: PageTransitionType.rightToLeft);
                case '/OtpPage':
                  return PageTransition(
                      isIos: true,
                      child: const OtpPage(),
                      type: PageTransitionType.rightToLeft);
//*Bottom_navigation
                case '/BottomNavigation':
                  return PageTransition(
                      isIos: true,
                      child: const BottomNavigation(),
                      type: PageTransitionType.rightToLeft);
                case '/SearchPage':
                  return PageTransition(
                      isIos: true,
                      child: const SearchPage(),
                      type: PageTransitionType.rightToLeft);
                case '/CarChargingStationPage':
                  return PageTransition(
                      isIos: true,
                      child: const ChargingStationPage(vehicleType: 'car'),
                      type: PageTransitionType.rightToLeft);
                case '/ReviewPage':
                  return PageTransition(
                      isIos: true,
                      child: const ReviewPage(),
                      type: PageTransitionType.rightToLeft);
                case '/DirectionPage':
                  return PageTransition(
                      isIos: true,
                      child: const DirectionPage(),
                      type: PageTransitionType.rightToLeft);
                case '/DeliveryPage':
                  return PageTransition(
                      isIos: true,
                      child: const DeliveryPage(),
                      type: PageTransitionType.rightToLeft);
                case '/RouteSearchPage':
                  return PageTransition(
                      isIos: true,
                      child: const RouteSearchPage(),
                      type: PageTransitionType.rightToLeft);
                // case '/DeliveryBookingPage':
                //   return PageTransition(
                //       isIos: true,
                //       child: const DeliveryBookingPage(carType: 'car'),
                //       type: PageTransitionType.rightToLeft);
                case '/NotificationPage':
                  return PageTransition(
                      isIos: true,
                      child: const NotificationPage(),
                      type: PageTransitionType.rightToLeft);
                case '/EditProfilePage':
                  return PageTransition(
                      isIos: true,
                      child: const EditProfilePage(),
                      type: PageTransitionType.rightToLeft);
                case '/MyBookingPage':
                  return PageTransition(
                      isIos: true,
                      child: const MyBookingPage(),
                      type: PageTransitionType.rightToLeft);
                case '/TermsAndConditionPage':
                  return PageTransition(
                      isIos: true,
                      child: const TermsAndConditionPage(),
                      type: PageTransitionType.rightToLeft);
                case '/FAQPage':
                  return PageTransition(
                      isIos: true,
                      child: const FAQPage(),
                      type: PageTransitionType.rightToLeft);
                case '/PrivacyPolicyPage':
                  return PageTransition(
                      isIos: true,
                      child: const PrivacyPolicyPage(),
                      type: PageTransitionType.rightToLeft);
                case '/HelpPage':
                  return PageTransition(
                      isIos: true,
                      child: const HelpPage(),
                      type: PageTransitionType.rightToLeft);
                case '/LanguagePage':
                  return PageTransition(
                      isIos: true,
                      child: const LanguagePage(),
                      type: PageTransitionType.rightToLeft);
                default:
                  return null;
              }
            });
      },
    );
  }
}
/*

body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [],
        ),
      ),

 */