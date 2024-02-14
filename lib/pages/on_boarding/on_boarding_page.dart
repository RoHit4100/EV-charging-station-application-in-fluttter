import 'package:fl_speedcharge/helper/language_constant.dart';
import 'package:fl_speedcharge/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int _pageIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    List pagesList = [
      {
        'image': onBoarding1,
        'title': translation(context).into1,
        'subtitle': translation(context).intosubtitle,
      },
      {
        'image': onBoarding2,
        'title': translation(context).into2,
        'subtitle': translation(context).intosubtitle,
      },
      {
        'image': onBoarding3,
        'title': translation(context).into3,
        'subtitle': translation(context).intosubtitle,
      },
    ];

    return Scaffold(
      bottomSheet: Container(
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 40,
                child: GestureDetector(
                  onTap: _pageIndex == 0 || _pageIndex == 1
                      ? () {
                          _pageController.animateToPage(2,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      : () {},
                  child: Text(
                    _pageIndex == 2 ? '' : translation(context).skip,
                    style: whiteBold14,
                  ),
                ),
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: ScrollingDotsEffect(
                  spacing: 15,
                  dotColor: white,
                  activeDotColor: white,
                  dotHeight: .75.h,
                  dotWidth: .75.h,
                  activeDotScale: .25.h,
                ),
              ),
              SizedBox(
                width: 40,
                child: GestureDetector(
                  onTap: _pageIndex != 2
                      ? () {
                          _pageController.animateToPage(_pageIndex + 1,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      : () {
                          Navigator.pushReplacementNamed(context, '/LoginPage');
                        },
                  child: Text(
                    translation(context).next,
                    style: whiteBold14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView.builder(
        itemCount: pagesList.length,
        controller: _pageController,
        onPageChanged: (e) {
          setState(() {
            _pageIndex = e;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Expanded(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 333,
                        child: Image.asset(pagesList[index]['image']),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 227,
                width: 100.w,
                color: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      heightSpace30,
                      Text(
                        pagesList[index]['title'],
                        style: onBoardTitle,
                      ),
                      heightSpace10,
                      Text(
                        pagesList[index]['subtitle'],
                        style: onBoardSubtitle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
