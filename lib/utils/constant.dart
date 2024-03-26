import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



//SizedBox
const SizedBox widthSpace2 = SizedBox(width: 2);
const SizedBox widthSpace3 = SizedBox(width: 3);
const SizedBox widthSpace5 = SizedBox(width: 5);
const SizedBox widthSpace7 = SizedBox(width: 7);
const SizedBox widthSpace10 = SizedBox(width: 10);
const SizedBox widthSpace15 = SizedBox(width: 15);
const SizedBox widthSpace20 = SizedBox(width: 20);
const SizedBox widthSpace25 = SizedBox(width: 25);
const SizedBox widthSpace27 = SizedBox(width: 27);
const SizedBox widthSpace30 = SizedBox(width: 30);
const SizedBox widthSpace40 = SizedBox(width: 40);
const SizedBox widthSpace50 = SizedBox(width: 50);
const SizedBox widthSpace70 = SizedBox(width: 70);

const SizedBox heightSpace2 = SizedBox(height: 2);
const SizedBox heightSpace3 = SizedBox(height: 3);
const SizedBox heightSpace5 = SizedBox(height: 5);
const SizedBox heightSpace6 = SizedBox(height: 6);
const SizedBox heightSpace7 = SizedBox(height: 7);
const SizedBox heightSpace8 = SizedBox(height: 8);
const SizedBox heightSpace9 = SizedBox(height: 9);
const SizedBox heightSpace10 = SizedBox(height: 10);
const SizedBox heightSpace15 = SizedBox(height: 15);
const SizedBox heightSpace20 = SizedBox(height: 20);
const SizedBox heightSpace23 = SizedBox(height: 23);
const SizedBox heightSpace25 = SizedBox(height: 25);
const SizedBox heightSpace30 = SizedBox(height: 30);
const SizedBox heightSpace40 = SizedBox(height: 40);
const SizedBox heightSpace50 = SizedBox(height: 50);
const SizedBox heightSpace60 = SizedBox(height: 60);
const SizedBox heightSpace70 = SizedBox(height: 70);
const SizedBox heightSpace80 = SizedBox(height: 80);

//Colors
const Color primaryColor = Color(0xff2269BE);
const Color appGrey = Color(0xffB4B4B4);
const Color appRed = Color(0xffE03232);
const Color dashLineColor = Color(0xff949494);
Color colorForShadow = const Color(0xff000000).withOpacity(.25);
const Color onBoardTextColor = Color(0xffCBC9C9);
const Color white = Colors.white;
const Color black = Colors.black;
const Color amber = Colors.amber;
const Color transparent = Colors.transparent;

//Images
const String splashImage = 'assets/images/splash_image.svg';
const String onBoarding1 = 'assets/images/on_boarding/onBoarding1.png';
const String onBoarding2 = 'assets/images/on_boarding/onBoarding2.png';
const String onBoarding3 = 'assets/images/on_boarding/onBoarding3.png';
//Login
const String facebook = 'assets/images/social_icons/facebook.png';
const String google = 'assets/images/social_icons/google.png';
//Bottom_navigation
const String homeSvg = 'assets/images/bottom_navigation_images/home_svg.svg';
const String enRouteSvg =
    'assets/images/bottom_navigation_images/en_route_svg.svg';
const String favouriteSvg =
    'assets/images/bottom_navigation_images/favourite_svg.svg';
const String profileSvg =
    'assets/images/bottom_navigation_images/profile_svg.svg';
//Home_page
const String youHereMarker = 'assets/images/map_markers/youHere.png';
const String gasStationMarker = 'assets/images/map_markers/gas_station.png';
const String station1 = 'assets/images/car_stations_images/station1.png';
const String station2 = 'assets/images/car_stations_images/station2.png';
const String station3 = 'assets/images/car_stations_images/station3.png';
const String station4 = 'assets/images/car_stations_images/station4.png';
const String station5 = 'assets/images/car_stations_images/station5.png';
const String history1 = 'assets/images/car_stations_images/history1.png';
const String history2 = 'assets/images/car_stations_images/history2.png';
const String history3 = 'assets/images/car_stations_images/history3.png';
const String history4 = 'assets/images/car_stations_images/history4.png';
const String filerIcon = 'assets/images/icons_images/filter_icon.png';
const String homeProfile = 'assets/images/users_images/home_profile_pic.png';
//Search_page
const String trendingSearch1 =
    'assets/images/car_stations_images/trendingSearch1.png';
const String trendingSearch2 =
    'assets/images/car_stations_images/trendingSearch2.png';
const String trendingSearch3 =
    'assets/images/car_stations_images/trendingSearch3.png';
const String trendingSearch4 =
    'assets/images/car_stations_images/trendingSearch4.png';
const String trendingSearch5 =
    'assets/images/car_stations_images/trendingSearch5.png';
const String trendingSearch6 =
    'assets/images/car_stations_images/trendingSearch6.png';
const String carMain1 = 'assets/images/car_stations_images/car_main1.png';
const String carMain2 = 'assets/images/car_stations_images/car_main2.png';
const String carMain3 = 'assets/images/car_stations_images/car_main3.png';
const String bikeMain1 = 'assets/images/car_stations_images/bike_main1.png';
const String bikeMain2 = 'assets/images/car_stations_images/bike_main2.png';
const String bikeMain3 = 'assets/images/car_stations_images/bike_main3.png';
const String amenities1 = 'assets/images/car_stations_images/amenities1.png';
const String amenities2 = 'assets/images/car_stations_images/amenities2.png';
const String amenities3 = 'assets/images/car_stations_images/amenities3.png';
const String amenities4 = 'assets/images/car_stations_images/amenities4.png';
const String amenities5 = 'assets/images/car_stations_images/amenities5.png';
const String connectionType1 =
    'assets/images/car_stations_images/connectionType1.png';
const String connectionType2 =
    'assets/images/car_stations_images/connectionType2.png';
const String connectionType3 =
    'assets/images/car_stations_images/connectionType3.png';
const String user1 = 'assets/images/users_images/user1.png';
const String user2 = 'assets/images/users_images/user2.png';
const String user3 = 'assets/images/users_images/user3.png';
const String user4 = 'assets/images/users_images/user4.png';
const String user5 = 'assets/images/users_images/user5.png';
const String user6 = 'assets/images/users_images/user6.png';
const String user7 = 'assets/images/users_images/user7.png';
const String share1 = 'assets/images/social_icons/share1.png';
const String share2 = 'assets/images/social_icons/share2.png';
const String share3 = 'assets/images/social_icons/share3.png';
//Book_slot
const String vehicleModel1 =
    'assets/images/car_stations_images/vehicleModel1.png';
const String vehicleModel2 =
    'assets/images/car_stations_images/vehicleModel2.png';
const String vehicleModel3 =
    'assets/images/car_stations_images/vehicleModel3.png';
const String coolBike = 'assets/images/car_stations_images/coolBike.png';
const String coolCar = 'assets/images/car_stations_images/coolCar.png';
//payment_success
const String paymentSuccess = 'assets/images/social_icons/success.png';
const String navigate = 'assets/images/social_icons/navigate.png';
const String call = 'assets/images/social_icons/call.png';
//en_route_images
const String enRouteMain = 'assets/images/other_images/en_routeMain.png';
const String pickPoint = 'assets/images/other_images/pickPoint.png';
//profile_images
const String profile1 = 'assets/images/profile_page/profile1.png';
const String profile2 = 'assets/images/profile_page/profile2.png';
const String profile3 = 'assets/images/profile_page/profile3.png';
const String profile4 = 'assets/images/profile_page/profile4.png';
const String profile5 = 'assets/images/profile_page/profile5.png';
const String profile6 = 'assets/images/profile_page/profile6.png';
const String profile7 = 'assets/images/profile_page/profile7.png';
const String profile8 = 'assets/images/profile_page/profile8.png';
//edit_profile
const String blueCamera = 'assets/images/other_images/blueCamera.png';
const String greenGalary = 'assets/images/other_images/greenGalary.png';
const String redBin = 'assets/images/other_images/redBin.png';
const String cancelSlot = 'assets/images/other_images/cancelSlot.png';
const String ratingStar = 'assets/images/other_images/ratingStar.svg';

//TextStyles
TextStyle onBoardTitle = TextStyle(
  fontSize: 15.sp,
  color: white,
  fontFamily: 'B',
);
TextStyle onBoardSubtitle = TextStyle(
  fontSize: 10.sp,
  color: onBoardTextColor,
  fontFamily: 'B',
);
TextStyle whiteBold14 = TextStyle(
  fontSize: 10.sp,
  color: white,
  fontFamily: 'B',
);
TextStyle whiteBold13 = TextStyle(
  fontSize: 9.5.sp,
  color: white,
  fontFamily: 'B',
);
TextStyle whiteBold18 = TextStyle(
  fontSize: 12.5.sp,
  color: white,
  fontFamily: 'B',
);
TextStyle primaryBold18 = TextStyle(
  fontSize: 12.5.sp,
  color: primaryColor,
  fontFamily: 'B',
);
TextStyle blackBold25 = TextStyle(
  fontSize: 17.5.sp,
  color: black,
  fontFamily: 'B',
);
TextStyle blackBold20 = TextStyle(
  fontSize: 14.sp,
  color: black,
  fontFamily: 'B',
);
TextStyle primaryBold20 = TextStyle(
  fontSize: 14.sp,
  color: primaryColor,
  fontFamily: 'B',
);
TextStyle blackBold17 = TextStyle(
  fontSize: 11.9.sp,
  color: black,
  fontFamily: 'B',
);
TextStyle blackBold16 = TextStyle(
  fontSize: 11.2.sp,
  color: black,
  fontFamily: 'B',
);
TextStyle whiteBold16 = TextStyle(
  fontSize: 11.2.sp,
  color: white,
  fontFamily: 'B',
);
TextStyle greenBold16 = TextStyle(
  fontSize: 11.2.sp,
  color: const Color(0xff0D7B17),
  fontFamily: 'B',
);
TextStyle redBold16 = TextStyle(
  fontSize: 11.2.sp,
  color: const Color(0xffBE3E22),
  fontFamily: 'B',
);
TextStyle blackMedium13 = TextStyle(
  fontSize: 9.5.sp,
  color: black,
  fontFamily: 'M',
);
TextStyle blackMedium14 = TextStyle(
  fontSize: 10.sp,
  color: black,
  fontFamily: 'M',
);
TextStyle dashLineRegular14 = TextStyle(
  fontSize: 10.sp,
  color: dashLineColor,
  fontFamily: 'R',
);
TextStyle dashLineMedium14 = TextStyle(
  fontSize: 10.sp,
  color: dashLineColor,
  fontFamily: 'M',
);
TextStyle blackMedium16 = TextStyle(
  fontSize: 11.2.sp,
  color: black,
  fontFamily: 'M',
);
TextStyle primaryMedium16 = TextStyle(
  fontSize: 11.2.sp,
  color: primaryColor,
  fontFamily: 'M',
);
TextStyle blackMedium18 = TextStyle(
  fontSize: 12.5.sp,
  color: black,
  fontFamily: 'M',
);
TextStyle blackRegular16 = TextStyle(
  fontSize: 11.2.sp,
  color: black,
  fontFamily: 'R',
);
TextStyle primaryBold14 = TextStyle(
  fontSize: 10.sp,
  color: primaryColor,
  fontFamily: 'B',
);
TextStyle primaryBold16 = TextStyle(
  fontSize: 11.2.sp,
  color: primaryColor,
  fontFamily: 'B',
);
TextStyle dashLineBold14 = TextStyle(
  fontSize: 10.sp,
  color: dashLineColor,
  fontFamily: 'B',
);
TextStyle dashLineBold16 = TextStyle(
  fontSize: 11.sp,
  color: dashLineColor,
  fontFamily: 'B',
);
TextStyle whiteExtraBold16 = TextStyle(
  fontSize: 11.sp,
  color: white,
  fontFamily: 'EB',
);
TextStyle blackSemiBold16 = TextStyle(
  fontSize: 11.sp,
  color: black,
  fontFamily: 'SB',
);
TextStyle blackSemiBold18 = TextStyle(
  fontSize: 12.5.sp,
  color: black,
  fontFamily: 'SB',
);
TextStyle primarySemiBold18 = TextStyle(
  fontSize: 12.5.sp,
  color: primaryColor,
  fontFamily: 'SB',
);
TextStyle blackBold18 = TextStyle(
  fontSize: 12.5.sp,
  color: black,
  fontFamily: 'B',
);
TextStyle whiteSemiBold16 = TextStyle(
  fontSize: 11.sp,
  color: white,
  fontFamily: 'SB',
);
TextStyle dashLineSemiBold13 = TextStyle(
  fontSize: 9.5.sp,
  color: dashLineColor,
  fontFamily: 'SB',
);
TextStyle blackSemiBold13 = TextStyle(
  fontSize: 9.5.sp,
  color: black,
  fontFamily: 'SB',
);
TextStyle blackSemiBold14 = TextStyle(
  fontSize: 10.sp,
  color: black,
  fontFamily: 'SB',
);
TextStyle dashLineSemiBold16 = TextStyle(
  fontSize: 11.sp,
  color: dashLineColor,
  fontFamily: 'SB',
);
TextStyle dashLineBold18 = TextStyle(
  fontSize: 12.5.sp,
  color: dashLineColor,
  fontFamily: 'B',
);
TextStyle dashLineSemiBold14 = TextStyle(
  fontSize: 10.sp,
  color: dashLineColor,
  fontFamily: 'SB',
);
TextStyle primarySemiBold14 = TextStyle(
  fontSize: 10.sp,
  color: primaryColor,
  fontFamily: 'SB',
);
TextStyle primarySemiBold16 = TextStyle(
  fontSize: 11.sp,
  color: primaryColor,
  fontFamily: 'SB',
);
TextStyle redSemiBold16 = TextStyle(
  fontSize: 11.sp,
  color: appRed,
  fontFamily: 'SB',
);
