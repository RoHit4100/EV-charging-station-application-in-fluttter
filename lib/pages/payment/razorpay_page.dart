import 'package:fl_speedcharge/pages/payment/payment_success_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class RazorPayPage extends StatefulWidget {
  final String vehicleType;
    const RazorPayPage({Key? key, required this.vehicleType}) : super(key: key);

    @override
    // ignore: library_private_types_in_public_api
    _RazorPayPageState createState() => _RazorPayPageState();
  }

class _RazorPayPageState extends State<RazorPayPage> {
  late Razorpay _razorpay;
  TextEditingController amtController = TextEditingController();

  void openCheckout(amount) async {
    amount = amount *
        100; // in razor pay amount is consider in points so we have to convert it into real number
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': amount,
      'name': 'EVCS',
      'prefill': {'contact': '1234567890', 'email': 'test@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error : $e');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {

    Fluttertoast.showToast(
        msg: "Payment Successful ${response.paymentId}",
        toastLength: Toast.LENGTH_SHORT);
    // Navigator.pushReplacementNamed(context, '/BottomNavigation');
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context,
        PageTransition(
            isIos: true,
            child: PaymentSuccessPage(vehicleType: widget.vehicleType),
            type: PageTransitionType.rightToLeft));
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Fail ${response.message!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External Wallet ${response.walletName!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ), //Image.network

            const SizedBox(
              height: 10,
            ),
            const Text(
              "Welcome to Razorpay Pay",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                cursorColor: Colors.white,
                autofocus: false,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Enter Amount to be paid',
                    labelStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    )),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15)),
                controller: amtController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter amount to be paid';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (amtController.text.toString().isNotEmpty) {
                  setState(() {
                    int amount = int.parse(amtController.text.toString());
                    openCheckout(amount);
                  });
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Make Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
