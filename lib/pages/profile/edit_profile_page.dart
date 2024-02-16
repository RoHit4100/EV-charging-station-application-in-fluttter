import 'package:fl_speedcharge/utils/constant.dart';
import 'package:fl_speedcharge/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../helper/language_constant.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameController =
      TextEditingController(text: 'Rohit Udamale');
  final TextEditingController _emailController =
      TextEditingController(text: 'rohitlu20comp@student.mes.ac.in');
  final TextEditingController _mobileNumberController =
      TextEditingController(text: '+919373369378');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: MyAppBar(
            title: translation(context).editProfile,
          )),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shrinkWrap: true,
        children: [
          heightSpace30,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 115,
                width: 115,
                // color: amber,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CupertinoButton(
                      pressedOpacity: .7,
                      onPressed: () {
                        changeImage(context);
                      },
                      padding: EdgeInsets.zero,
                      child: CircleAvatar(
                        radius: 6.h,
                        child: Image.asset(homeProfile),
                      ),
                    ),
                    Positioned(
                      bottom: -5,
                      right: 0,
                      child: CupertinoButton(
                        pressedOpacity: .9,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          changeImage(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: white,
                          radius: 2.h,
                          child: Icon(Icons.camera_alt_rounded,
                              size: 2.2.h, color: primaryColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpace50,
              heightSpace5,
              Text(
                translation(context).name,
                style: blackSemiBold16,
                textAlign: TextAlign.center,
              ),
              PrimaryTextField(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                controller: _nameController,
                hintText: translation(context).enterName,
              ),
              heightSpace10,
              Text(
                translation(context).mobileNo,
                style: blackSemiBold16,
                textAlign: TextAlign.center,
              ),
              PrimaryTextField(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                controller: _mobileNumberController,
                hintText: translation(context).enterMobileNo,
                keyboardType: TextInputType.number,
              ),
              heightSpace10,
              Text(
                translation(context).emailAddress,
                style: blackSemiBold16,
                textAlign: TextAlign.center,
              ),
              PrimaryTextField(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                controller: _emailController,
                hintText: translation(context).enterEmailAddress,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
              heightSpace50,
              PrimaryButton(
                onTap: () {
                  Navigator.pop(context);
                },
                title: translation(context).update,
              ),
              heightSpace20,
            ],
          ),
        ],
      ),
    );
  }

  changeImage(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 25),
                child: Text(
                  translation(context).changeProfilePhoto,
                  style: blackSemiBold18,
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          MyContainerWithChild(
                            borderRadius: 50,
                            padding: const EdgeInsets.all(5),
                            height: 4.5.h,
                            width: 4.5.h,
                            child: SizedBox(
                                height: 2.5.h, child: Image.asset(blueCamera)),
                          ),
                          heightSpace10,
                          Text(translation(context).camera,
                              style: blackMedium16),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          MyContainerWithChild(
                            borderRadius: 50,
                            padding: const EdgeInsets.all(5),
                            height: 4.5.h,
                            width: 4.5.h,
                            child: SizedBox(
                                height: 1.8.h, child: Image.asset(greenGalary)),
                          ),
                          heightSpace10,
                          Text(translation(context).gallery,
                              style: blackMedium16),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          MyContainerWithChild(
                            borderRadius: 50,
                            padding: const EdgeInsets.all(5),
                            height: 4.5.h,
                            width: 4.5.h,
                            child: SizedBox(
                                height: 2.1.h, child: Image.asset(redBin)),
                          ),
                          heightSpace10,
                          Text(translation(context).removeImage,
                              style: blackMedium16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              heightSpace10,
            ],
          ),
        );
      },
    );
  }
}
