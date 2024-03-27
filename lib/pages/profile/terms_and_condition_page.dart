import 'package:fl_speedcharge/utils/constant.dart';
import 'package:fl_speedcharge/utils/widgets.dart';
import 'package:flutter/material.dart';

import '../../helper/language_constant.dart';

class TermsAndConditionPage extends StatelessWidget {
  const TermsAndConditionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List termsConditionList = [
      '1. Use of the App:\nThis application EVCS is provided for locating electric vehicle charging stations. By using this App, you agree to comply with these terms and conditions.',
      '2. Registration:\nTo use the App, you may be required to register an account. You agree to provide accurate and complete information during the registration process.',
      "3. Accuracy of Information:\nWe strive to provide accurate information about charging stations, but we cannot guarantee its accuracy or completeness. Users are advised to verify station availability and compatibility.",
      '4. User Conduct:\nYou agree to use the App in a manner that is lawful and respectful of others. Do not engage in any activity that may harm the App or its users.',
      '5. Intellectual Property:\nThe App and its content are protected by copyright.',
      '6. Limitation of Liability:\nWe are not liable for any damages or losses resulting from the use of the App.',
      '7. Changes to Terms:\nWe reserve the right to modify these terms and conditions at any time. Please review them periodically for updates.',
      '8. Governing Law:\nThese terms and conditions are governed by the laws of the United States.',
      '9. Contact Information:\nIf you have any questions or concerns about these terms and conditions, please contact us at evcs@gmail.com',
      
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: MyAppBar(
          title: translation(context).termsAndCondition,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: termsConditionList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(termsConditionList[index],
                        style: dashLineSemiBold14));
              },
            ),
            heightSpace20,
          ],
        ),
      ),
    );
  }
}
