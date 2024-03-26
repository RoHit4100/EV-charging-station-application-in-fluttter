import 'package:fl_speedcharge/pages/payment/payment_option_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';



class BatteryOption {
  final String name;
  final double price;

  BatteryOption(this.name, this.price);
}

class BatteryOptionsScreen extends StatefulWidget {
  @override
  _BatteryOptionsScreenState createState() => _BatteryOptionsScreenState();
}

class _BatteryOptionsScreenState extends State<BatteryOptionsScreen> {
  List<BatteryOption> options = [
    BatteryOption('Standard', 5000),
    BatteryOption('Extended Range', 8000),
    BatteryOption('Performance', 10000),
  ];

  BatteryOption? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EV Battery Options'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select Battery Option:',
              style: TextStyle(fontSize: 20),
            ),
            Column(
              children: options
                  .map(
                    (option) => RadioListTile<BatteryOption>(
                      title: Text(option.name),
                      value: option,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value;
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Change the background color
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(20.0)), // Adjust padding
                  textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)), // Change text style
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Adjust border radius
                      // You can also adjust other properties like border color, width, etc. here if needed
                    ),
                  ),
                ),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        isIos: true,
                        child: const PaymentOptionPage(vehicleType: 'car'),
                        type: PageTransitionType.rightToLeft));
              }, 
              child:  Text(
                'Price: ${selectedOption != null ? '\$${selectedOption!.price}' : 'Select an option'}',
                style: const TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
