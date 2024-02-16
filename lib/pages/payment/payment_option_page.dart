import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'payment_page.dart';
import 'razorpay_page.dart';

class PaymentOptionPage extends StatefulWidget {
  final String vehicleType;
  const PaymentOptionPage({Key? key, required this.vehicleType})
      : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _PaymentOptionPageState createState() => _PaymentOptionPageState();
}

class _PaymentOptionPageState extends State<PaymentOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Buttons and Label'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      PageTransition(
                          isIos: true,
                          child: const PaymentPage(vehicleType: 'car'),
                          type: PageTransitionType.rightToLeft));
                });
              },
              child: const Text('Payment with Card'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        isIos: true,
                        child: const RazorPayPage(vehicleType: 'car'),
                        type: PageTransitionType.rightToLeft));
              },
              child: const Text('Payment with Razorpay'),
            ),
            const SizedBox(height: 20),
            const Text(
              "Payment with Wallets",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
