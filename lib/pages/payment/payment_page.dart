import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_speedcharge/pages/payment/payment_success_page.dart';
import 'package:fl_speedcharge/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../helper/language_constant.dart';
import '../../utils/widgets.dart';

class PaymentPage extends StatefulWidget {
  final String vehicleType;
  const PaymentPage({Key? key, required this.vehicleType}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isCardSaved = true;
  final GlobalKey<FormState> formKey = GlobalKey();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: MyAppBar(
            title: translation(context).payment,
          )),
      body: SingleChildScrollView(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shrinkWrap: true,
          children: [
            AutoSizeText(
              translation(context).paymentSubtitle,
              style: dashLineSemiBold14,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
            heightSpace10,
            CreditCardWidget(
              cardBgColor: primaryColor,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              onCreditCardWidgetChange: (e) {},
              cardType: CardType.mastercard,
            ),
            CreditCardForm(
              cursorColor: primaryColor,
              formKey: formKey,
              onCreditCardModelChange: onCreditCardModelChange,
              obscureCvv: true,
              obscureNumber: true,
              cardNumberDecoration: InputDecoration(
                labelText: translation(context).cardNumber,
                hintText: 'XXXX XXXX XXXX XXXX',
                hintStyle: blackSemiBold16,
                labelStyle: dashLineSemiBold16,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                ),
              ),
              expiryDateDecoration: InputDecoration(
                labelText: translation(context).expireDate,
                hintText: 'XX/XX',
                hintStyle: blackSemiBold16,
                labelStyle: dashLineSemiBold16,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                ),
              ),
              cvvCodeDecoration: InputDecoration(
                labelText: translation(context).cvv,
                hintText: 'XXX',
                hintStyle: blackSemiBold16,
                labelStyle: dashLineSemiBold16,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                ),
              ),
              cardHolderDecoration: InputDecoration(
                labelText: translation(context).nameOnCard,
                labelStyle: dashLineSemiBold16,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                ),
              ),
              cardHolderName: '',
              cardNumber: '',
              cvvCode: '',
              expiryDate: '',
              themeColor: white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCardSaved = !isCardSaved;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 1.7.h,
                      width: 1.7.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: primaryColor),
                      child: isCardSaved
                          ? Icon(
                              Icons.check,
                              size: 1.2.h,
                              color: white,
                            )
                          : const SizedBox(),
                    ),
                  ),
                  widthSpace5,
                  Text(translation(context).saveCard,
                      style: dashLineSemiBold14),
                ],
              ),
            ),
            heightSpace60,
            heightSpace5,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: PrimaryButton(
                title: translation(context).payment,
                onTap: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          isIos: true,
                          child: PaymentSuccessPage(
                              vehicleType: widget.vehicleType),
                          type: PageTransitionType.rightToLeft));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
