import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../helper/language_constant.dart';
import '../../utils/constant.dart';
import '../../utils/widgets.dart';

class ConnectionType extends StatefulWidget {
  final String hintText;
  const ConnectionType({Key? key, required this.hintText}) : super(key: key);

  @override
  State<ConnectionType> createState() => _ConnectionTypeState();
}

List connectionTypeList = [
  {
    'image': connectionType1,
    'label': 'CCS2',
    'title': '150kw',
    'subtitle': '(\$0.05/kw)',
  },
  {
    'image': connectionType2,
    'label': 'CCS',
    'title': '120kw',
    'subtitle': '(\$0.05/kw)',
  },
  {
    'image': connectionType3,
    'label': 'Mennekers',
    'title': '22kw',
    'subtitle': '(\$0.02/kw)',
  },
];

class _ConnectionTypeState extends State<ConnectionType> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    if (widget.hintText.isEmpty) {
      _selectedIndex = -1;
    } else {
      widget.hintText == 'CCS2'
          ? _selectedIndex = 0
          : widget.hintText == 'CCS'
              ? _selectedIndex = 1
              : _selectedIndex = 2;
    }
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
            child:
                Text(translation(context).connectionType, style: blackBold18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: connectionTypeList
                .map((e) => Column(
                      children: [
                        MyContainerWithChild(
                          border:
                              _selectedIndex == connectionTypeList.indexOf(e)
                                  ? Border.all(color: primaryColor)
                                  : null,
                          color: _selectedIndex == connectionTypeList.indexOf(e)
                              ? const Color(0xffF0F7FF)
                              : const Color(0xffFAFAFA),
                          onTap: () {
                            setState(() {
                              _selectedIndex = connectionTypeList.indexOf(e);
                            });
                            // print(e['label']);
                            Navigator.pop(context, e['label']);
                          },
                          height: 125,
                          // width: 117,
                          padding: const EdgeInsets.symmetric(
                              vertical: 11, horizontal: 20),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 2.7.h,
                                child: Image.asset(e['image']),
                              ),
                              heightSpace7,
                              Text(e['label'], style: primaryBold14),
                              heightSpace3,
                              Text(e['title'], style: blackSemiBold14),
                              heightSpace3,
                              Text(e['subtitle'], style: blackSemiBold14),
                            ],
                          ),
                        ),
                      ],
                    ))
                .toList(),
          ),
          heightSpace20,
        ],
      ),
    );
  }
}
