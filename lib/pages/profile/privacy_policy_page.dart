import 'package:flutter/material.dart';

import '../../helper/language_constant.dart';
import '../../utils/constant.dart';
import '../../utils/widgets.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List termsConditionList = [
      'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae Etlk enim quam aliquid molestiae non. Et enim quam. Et consequatur sunt dicta esse eveniet tempore deserunt.',
      'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandaejhk at aliquid molestiae non. Et enim quam. Et consequatur sunt dicta esse eveniet tempore deserunt.Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae',
      'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandaealiquid molestiae non. Et enim quam. Et consequatur sunt dicta esse eveniet tempore deserunt.',
      'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandaekrtdf aliquid molestiae non. Et enim quam. Et consequatur sunt dicta esse eveniet tempore deserunt.Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae',
      'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandaejkds aliquid molestiae non. Et enim quam. Et consequatur sunt dicta esse eveniet tempore deserunt.Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae',
      'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandaaliquid molestiae non. Et enim quam. Et consequatur sunt dicta esse eveniet tempore deserunt.Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae',
      'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandaehjkkd aliquid molestiae non. Et enim quam. Et consequatur sunt dicta esse eveniet tempore deserunt.',
      'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae aliquid molestiae non. Et enim quam. Et consequatur sunt dicta esse eveniet tempore deserunt.'
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: MyAppBar(
          title: translation(context).privacyPolicy,
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
