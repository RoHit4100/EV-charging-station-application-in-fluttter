import 'package:flutter/material.dart';

import '../../helper/language_constant.dart';
import '../../utils/constant.dart';
import '../../utils/widgets.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: MyAppBar(
          title: translation(context).help,
        ),
      ),
      body: SingleChildScrollView(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  translation(context).emailAddress,
                  style: blackSemiBold16,
                  textAlign: TextAlign.center,
                ),
                PrimaryTextField(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  controller: _emailController,
                  hintText: translation(context).enterEmailAddress,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                heightSpace10,
                Text(
                  translation(context).message,
                  style: blackSemiBold16,
                  textAlign: TextAlign.center,
                ),
                heightSpace10,
                MyContainerWithChild(
                  // height: 110,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _messageController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: translation(context).writeMessageHere,
                      hintStyle: dashLineSemiBold16,
                      border: InputBorder.none,
                    ),
                    style: blackMedium16,
                    maxLines: 7,
                    minLines: 7,
                  ),
                ),
                heightSpace60,
                PrimaryButton(
                  title: translation(context).submit,
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
