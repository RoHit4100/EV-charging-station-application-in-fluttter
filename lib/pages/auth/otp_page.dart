import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_speedcharge/helper/ui_helper.dart';
import 'package:fl_speedcharge/pages/auth/login_page.dart';
import 'package:fl_speedcharge/utils/constant.dart';
import 'package:fl_speedcharge/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../helper/language_constant.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);
  @override
  State<OtpPage> createState() => _OtpPageState();
}

final defaultPinTheme = PinTheme(
  width: 5.5.h,
  height: 5.5.h,
  textStyle:
      const TextStyle(fontSize: 22, color: primaryColor, fontFamily: 'M'),
  decoration: BoxDecoration(
    // border: Border.all(color: primaryColor, width: 1.0),
    color: Colors.white,
    borderRadius: const BorderRadius.all(
      Radius.circular(10.0),
    ),
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: colorForShadow,
        blurRadius: 4.0,
        offset: const Offset(0.0, 0.0),
      ),
    ],
  ),
  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: primaryColor),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: white,
    border: Border.all(color: primaryColor, width: 1.0),
  ),
);

class _OtpPageState extends State<OtpPage> {
  // final String mobileNumber = '+91(1234567890)';
  final TextEditingController pinController = TextEditingController();
  String code = '';
  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56), child: MyAppBar()),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            heightSpace10,
            Text(
              'Confirmation code has been sent to to your mobile no +919373369378',
              style: blackBold25,
              textAlign: TextAlign.center,
            ),
            heightSpace40,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                translation(context).otpVeriSubtitle,
                style: dashLineSemiBold14,
                textAlign: TextAlign.center,
              ),
            ),
            heightSpace30,
            Pinput(
                controller: pinController,
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                // validator: (s) {
                //   return s == '2222' ? null : translation(context).pinIncorrect;
                // },
                onChanged: (String value) {
                  setState(() {
                    code = value;
                  });
                } ,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) {
                  UiHelper.showLoadingDialog(
                      context, translation(context).pleaseWait);
                  Timer(const Duration(seconds: 3), () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacementNamed(
                        context, '/BottomNavigation');
                  });
                }),
            heightSpace30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 93,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffDCE0E5)),
                  child: Countdown(
                    seconds: 60,
                    build: (BuildContext context, double time) =>
                        // Text(time.toString()),
                        Text(
                      time > 9
                          ? '00.${time.toStringAsFixed(0)}'
                          : '00.0${time.toStringAsFixed(0)}',
                      style: primarySemiBold14,
                    ),
                    interval: const Duration(milliseconds: 100),
                  ),
                ),
              ],
            ),
            heightSpace30,
            PrimaryButton(
              title: translation(context).verify,
              onTap: () async {
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: LoginPage.verify, smsCode: code);

                  // Sign the user in (or link) with the credential
                  await auth.signInWithCredential(credential);
                  

                  // ignore: use_build_context_synchronously
                  UiHelper.showLoadingDialog(
                      // ignore: use_build_context_synchronously
                      context, translation(context).pleaseWait);
                  Timer(const Duration(seconds: 3), () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacementNamed(
                        context, '/BottomNavigation');
                  });
                } catch (e) {
                  (e);
                }
              },
            ),
            heightSpace15,
            Text(
              translation(context).reSend,
              style: primaryBold14,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
