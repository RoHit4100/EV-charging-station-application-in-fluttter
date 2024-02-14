import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../helper/language_constant.dart';
import '../../main.dart';
import '../../models/language.dart';
import '../../utils/constant.dart';
import '../../utils/widgets.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

List<Language> languageList() {
  return <Language>[
    Language('English', 'en'),
    Language('Hindi', 'hi'),
    Language('Indonesian', 'id'),
    Language('Chinese', 'zh'),
    Language('Arabic', 'ar'),
  ];
}

class _LanguagePageState extends State<LanguagePage> {
  var selectedIndex = 0;
  late Language selectedLanguage = Language('English', 'en');

  @override
  void initState() {
    _asyncMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: MyAppBar(
          title: translation(context).language,
        ),
      ),
      body: SingleChildScrollView(
          child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
            heightSpace15,
            Column(
              children: languageList().map((e) => gradeTile(e)).toList(),
            )
          ])),
    );
  }

  Widget gradeTile(Language e) {
    return GestureDetector(
      onTap: () async {
        Locale locale = await setLocale(e.languageCode!);
        if (!mounted) return;
        MyApp.setLocale(context, locale);
        setState(() {
          selectedLanguage = e;
        });
      },
      child: MyContainerWithChild(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                e.name == 'English'
                    ? translation(context).english
                    : e.name == 'Hindi'
                        ? translation(context).hindi
                        : e.name == 'Indonesian'
                            ? translation(context).indonesian
                            : e.name == 'Chinese'
                                ? translation(context).chinese
                                : translation(context).arabic,
                style: blackRegular16),
            Container(
              height: 2.h,
              width: 2.h,
              decoration: BoxDecoration(
                color: white,
                shape: BoxShape.circle,
                boxShadow: [
                  selectedLanguage.name == e.name
                      ? const BoxShadow(
                          color: primaryColor,
                          blurRadius: 1,
                          spreadRadius: 0,
                          offset: Offset(0, 0),
                        )
                      : BoxShadow(
                          color: colorForShadow,
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: const Offset(0, 0),
                        ),
                ],
                // border: selectedLanguage.name != e.name
                //     ? Border.all(color: const Color(0xffB7B7B7))
                //     : null,
              ),
              child: selectedLanguage.name == e.name
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                          ),
                          height: .7.h,
                          width: .7.h,
                        )
                      ],
                    )
                  : const SizedBox(),
            ),
            // widthSpace10,

            // const Spacer(),
          ],
        ),
      ),
    );
  }

  Future _asyncMethod() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString(laguageCode) ?? english;
    setState(() {
      selectedLanguage = languageCode == 'en'
          ? Language('English', 'en')
          : languageCode == 'hi'
              ? Language('Hindi', 'hi')
              : languageCode == 'id'
                  ? Language('Indonesian', 'id')
                  : languageCode == 'zh'
                      ? Language('Chinese', 'zh')
                      : Language('Arabic', 'ar');
    });
  }
}
