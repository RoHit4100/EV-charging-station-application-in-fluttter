import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../helper/language_constant.dart';
import '../../utils/constant.dart';
import '../../utils/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    // ignore: no_leading_underscores_for_local_identifiers
    final TextEditingController _mobileNumberController = TextEditingController(text: arguments['mobileNumber'] ?? '');

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(),
      ),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            heightSpace10,
            Text(
              translation(context).register,
              style: blackBold25,
              textAlign: TextAlign.center,
            ),
            heightSpace40,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  translation(context).name,
                  style: blackSemiBold16,
                  textAlign: TextAlign.center,
                ),
                PrimaryTextField(
                  controller: _nameController,
                  hintText: translation(context).enterName,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Icon(
                      Icons.person_outline,
                      color: appGrey,
                      size: 2.5.h,
                    ),
                  ),
                ),
                heightSpace10,
                Text(
                  translation(context).mobileNo,
                  style: blackSemiBold16,
                  textAlign: TextAlign.center,
                ),
                PrimaryTextField(
                  controller: _mobileNumberController,
                  hintText: translation(context).enterMobileNo,
                  keyboardType: TextInputType.number,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Icon(
                      Icons.phone_iphone_rounded,
                      color: appGrey,
                      size: 2.5.h,
                    ),
                  ),
                ),
                heightSpace10,
                Text(
                  translation(context).emailAddress,
                  style: blackSemiBold16,
                  textAlign: TextAlign.center,
                ),
                PrimaryTextField(
                  controller: _emailController,
                  hintText: translation(context).enterEmailAddress,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Icon(
                      Icons.email_outlined,
                      color: appGrey,
                      size: 2.5.h,
                    ),
                  ),
                ),
                heightSpace50,
                PrimaryButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/OtpPage');
                  },
                  title: translation(context).register,
                ),
                heightSpace20,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
