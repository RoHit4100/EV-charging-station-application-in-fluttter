// ignore: file_names
import 'package:flutter/material.dart';
import 'battery_options_screen.dart';

class BatterySwapTermsAndCondition extends StatelessWidget {
  final String termsAndConditions = '''
1. By purchasing this electric vehicle charging battery, you agree to abide by all local laws and regulations regarding its use.
2. This battery is intended for use only with compatible electric vehicles. Do not attempt to use it with incompatible vehicles.
3. You are responsible for the safe handling and maintenance of the battery. Improper use may result in damage or injury.
4. The manufacturer is not liable for any accidents, damages, or injuries resulting from the use of this battery.
5. This battery comes with a limited warranty. Please refer to the warranty documentation for details.
6. Any modifications or alterations to the battery may void the warranty and could result in dangerous operation.
7. Keep the battery away from water and extreme temperatures to ensure optimal performance and safety.
8. Dispose of the battery properly according to local regulations. Do not attempt to disassemble or dispose of it in a way that may be harmful to the environment.
9. Use only approved charging equipment and follow all safety instructions provided by the manufacturer.
10. By purchasing this battery, you acknowledge that you have read and understand these terms and conditions.
''';

  const BatterySwapTermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  termsAndConditions,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BatteryOptionsScreen()),
                );
              },
              child: const Text('Accept and Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
