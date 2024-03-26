import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../helper/language_constant.dart';
import '../../utils/constant.dart';
import '../../utils/widgets.dart';

class VehicleModel extends StatefulWidget {
  final String hintText;
  const VehicleModel({Key? key, required this.hintText}) : super(key: key);

  @override
  State<VehicleModel> createState() => _VehicleModelState();
}

Set active = {};
List _vehicleModelList = [
  {'image': vehicleModel1, 'car': 'Tata Nexon'},
  {'image': vehicleModel2, 'car': 'Honda e'},
  {'image': vehicleModel1, 'car': 'Volvo XC40 Recharge'},
  {'image': vehicleModel2, 'car': 'Kia EV6'},
  {'image': vehicleModel3, 'car': 'BMW i4'},
  {'image': vehicleModel1, 'car': 'MG ZS EV'},
  {'image': vehicleModel3, 'car': 'Porsche Taycan'},
  {'image': vehicleModel1, 'car': 'Jaguar I-Pace'},
  {'image': vehicleModel3, 'car': 'Porsche Taycan'},
];

class _VehicleModelState extends State<VehicleModel> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.hintText.isEmpty) {
      active.clear();
    } else {
      active.contains(widget.hintText);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(translation(context).vehicleModel, style: blackBold18),
          ),
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
                      hintText: translation(context).searchVehicle,
                      hintStyle: dashLineSemiBold14),
                )),
              ],
            ),
          ),
          heightSpace10,
          Column(
              children: _vehicleModelList
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        setState(() {
                          active.clear();
                          active.add(e);
                        });
                        // print(e);
                        Navigator.pop(context, e['car']);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: active.contains(e)
                              ? Border.all(color: primaryColor)
                              : null,
                          color: active.contains(e)
                              ? const Color(0xffF0F7FF)
                              : white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 2.2.h,
                                  width: 4.h,
                                  child: Image.asset(e['image']),
                                ),
                                widthSpace5,
                                Text(e['car'], style: blackSemiBold14)
                              ],
                            ),
                            active.contains(e)
                                ? Container(
                                    alignment: Alignment.center,
                                    height: 2.2.h,
                                    width: 2.2.h,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: primaryColor),
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
                  )
                  .toList()),
          /*   */
          heightSpace20,
        ],
      ),
    );
  }
}
