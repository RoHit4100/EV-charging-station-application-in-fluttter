import 'package:fl_speedcharge/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../helper/language_constant.dart';
import '../../utils/constant.dart';

class SelectPrice extends StatefulWidget {
  final double hintText;
  const SelectPrice({Key? key, required this.hintText}) : super(key: key);

  @override
  State<SelectPrice> createState() => _SelectPriceState();
}

class _SelectPriceState extends State<SelectPrice> {
  bool isFullChargeSelected = true;
  double _value = 40;

  @override
  void initState() {
    super.initState();
    _value = widget.hintText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text(translation(context).price, style: blackBold18),
        ),
        MyContainerWithChild(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          child: Column(
            children: [
              Text(translation(context).setFixAmount, style: blackSemiBold16),
              heightSpace10,
              SfSlider(
                activeColor: primaryColor,
                min: 0.0,
                max: 100.0,
                value: _value,
                // shouldAlwaysShowTooltip: true,
                interval: 20,
                inactiveColor: const Color(0xffE6E6E6),
                enableTooltip: true,
                thumbIcon: Container(
                  padding: const EdgeInsets.all(2),
                  height: 20,
                  width: 20,
                  decoration:
                      const BoxDecoration(color: white, shape: BoxShape.circle),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: primaryColor, shape: BoxShape.circle)),
                ),
                minorTicksPerInterval: 1,
                onChanged: (dynamic value) {
                  setState(() {
                    _value = value;
                  });
                },
                onChangeEnd: (value) {
                  Future.delayed(const Duration(milliseconds: 300))
                      .then((value) => Navigator.pop(context, _value));
                },
              ),
            ],
          ),
        ),
        heightSpace15,
        GestureDetector(
          onTap: () {
            setState(() {
              isFullChargeSelected = !isFullChargeSelected;
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: primaryColor),
              color: const Color(0xffF0F7FF),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(translation(context).fullCharge, style: primaryMedium16),
                isFullChargeSelected
                    ? Container(
                        alignment: Alignment.center,
                        height: 2.2.h,
                        width: 2.2.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: primaryColor),
                        child: Icon(
                          Icons.check,
                          size: 1.5.h,
                          color: white,
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
        heightSpace20,
      ],
    );
  }
}
