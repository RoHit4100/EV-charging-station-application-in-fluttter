import 'package:fl_speedcharge/utils/constant.dart';
import 'package:fl_speedcharge/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../helper/language_constant.dart';
import '../charging_station/charging_station_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

List _recentSearchList = [
  '# Broome charging station',
  '# Hp charging station',
  '# Dc ev charging station',
  '# Ola charging station',
];
List _trandingSearchList = [
  {
    'image': trendingSearch1,
    'title': 'Broome charging hub',
  },
  {
    'image': trendingSearch2,
    'title': 'Broome charging hub',
  },
  {
    'image': trendingSearch3,
    'title': 'Tata power charging hub',
  },
  {
    'image': trendingSearch4,
    'title': 'Dc ev charging hub',
  },
  {
    'image': trendingSearch5,
    'title': 'Ola charging hub',
  },
  {
    'image': trendingSearch6,
    'title': 'Ola charging hub',
  },
  {
    'image': trendingSearch1,
    'title': 'Delta Electronics station',
  },
];

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: MyAppBar(
            title: translation(context).search,
          )),
      body: SingleChildScrollView(
          child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shrinkWrap: true,
        children: [
          MyContainerWithChild(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: dashLineColor,
                ),
                widthSpace10,
                Expanded(
                    child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: translation(context).search,
                      hintStyle: dashLineBold16),
                )),
              ],
            ),
          ),
          heightSpace20,
          _recentSearchList.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      translation(context).recentlySearch,
                      style: blackBold16,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _recentSearchList.clear();
                        });
                      },
                      child: Text(
                        translation(context).clearAll,
                        style: primarySemiBold14,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          _recentSearchList.isNotEmpty
              ? const SizedBox(height: 2.5)
              : const SizedBox(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _recentSearchList
                .map((e) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                isIos: true,
                                child: const ChargingStationPage(
                                    vehicleType: 'car'),
                                type: PageTransitionType.rightToLeft));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 7.5),
                        child: Text(
                          e,
                          style: dashLineSemiBold14,
                        ),
                      ),
                    ))
                .toList(),
          ),
          _recentSearchList.isNotEmpty ? heightSpace25 : const SizedBox(),
          Text(
            translation(context).trandingSearch,
            style: blackBold16,
          ),
          heightSpace10,
          Column(
              children: _trandingSearchList
                  .map((e) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  isIos: true,
                                  child: const ChargingStationPage(
                                      vehicleType: 'car'),
                                  type: PageTransitionType.rightToLeft));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 2.7.h,
                                  child: Image.asset(e['image'])),
                              widthSpace10,
                              Text(
                                e['title'],
                                style: blackMedium14,
                              )
                            ],
                          ),
                        ),
                      ))
                  .toList())
        ],
      )),
    );
  }
}
