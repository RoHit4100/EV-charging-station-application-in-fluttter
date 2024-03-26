import 'package:flutter/material.dart';

import '../../helper/language_constant.dart';
import '../../utils/constant.dart';

class VehicleType extends StatefulWidget {
  final String hintText;
  const VehicleType({Key? key, required this.hintText}) : super(key: key);

  @override
  State<VehicleType> createState() => _VehicleTypeState();
}

List _vehicleTypeList = ['2 wheeler', '3 wheeler', '4 wheeler'];

class _VehicleTypeState extends State<VehicleType> {
  String? _selectedVehicleType;
  @override
  void initState() {
    _selectedVehicleType = widget.hintText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text(translation(context).vehicleType, style: blackBold18),
        ),
        Wrap(
            spacing: 15,
            runSpacing: 15,
            children: _vehicleTypeList
                .map((e) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedVehicleType = e;
                        });
                        Navigator.pop(context, _selectedVehicleType);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 9),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5),
                            border: _selectedVehicleType == e
                                ? Border.all(width: 1, color: primaryColor)
                                : null,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 6,
                                  offset: const Offset(0, 0),
                                  color: _selectedVehicleType == e
                                      ? const Color(0xff007AC6).withOpacity(.25)
                                      : colorForShadow)
                            ]),
                        child: Text(e.toString(),
                            style: _selectedVehicleType == e
                                ? primaryBold14
                                : dashLineBold14),
                      ),
                    ))
                .toList()),
        heightSpace20,
      ],
    );
  }
}
