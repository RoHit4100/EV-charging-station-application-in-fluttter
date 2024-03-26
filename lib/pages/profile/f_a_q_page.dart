import 'package:fl_speedcharge/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../helper/language_constant.dart';
import '../../utils/widgets.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List faqList = [
      {
        'title': 'How to book charging slot ?',
        'subtitle':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas amet ut eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra, amet erat feugiat duis.Maecenas amet ut eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra, amet erat feugiat duis.eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra,'
      },
      {
        'title': 'How can i find loction of charging hub?',
        'subtitle':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas amet ut eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra, amet erat feugiat duis.Maecenas amet ut eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra, amet erat feugiat duis.eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra,'
      },
      {
        'title': 'How can i find loction of En route?',
        'subtitle':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas amet ut eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra, amet erat feugiat duis.Maecenas amet ut eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra, amet erat feugiat duis.eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra,'
      },
      {
        'title': 'Can I find nearest location?',
        'subtitle':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas amet ut eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra, amet erat feugiat duis.Maecenas amet ut eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra, amet erat feugiat duis.eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra,'
      },
      {
        'title': 'How can i find charging point?',
        'subtitle':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas amet ut eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra, amet erat feugiat duis.Maecenas amet ut eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra, amet erat feugiat duis.eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra,'
      },
      {
        'title': 'How can i payment of booking slot',
        'subtitle':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas amet ut eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra, amet erat feugiat duis.Maecenas amet ut eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra, amet erat feugiat duis.eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra,'
      },
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: MyAppBar(
          title: translation(context).faqs,
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: faqList.length,
          itemBuilder: (BuildContext context, int index) {
            return MyContainerWithChild(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: ListTileTheme(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                child: ExpansionTile(
                  collapsedIconColor: black,
                  iconColor: black,
                  title: Text(
                    faqList[index]['title'],
                    style: blackSemiBold16,
                  ),
                  children: <Widget>[
                    ListTile(
                      contentPadding:
                          const EdgeInsets.only(bottom: 20, left: 0, right: 0),
                      title: Text(
                        faqList[index]['subtitle'],
                        style: dashLineRegular14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
