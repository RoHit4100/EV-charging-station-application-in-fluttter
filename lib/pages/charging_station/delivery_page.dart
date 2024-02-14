import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PaymentForm extends StatefulWidget {
  static const routeName = '/delivery-page';
  const PaymentForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'address',
                decoration: const InputDecoration(labelText: 'Address'),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    // Perform any necessary form validation
                    String address =
                        _formKey.currentState!.fields['address']!.value;

                    // Redirect to payment gateway (replace with your logic)
                    redirectToPaymentGateway(address);
                  }
                },
                child: const Text('Proceed to Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Replace this function with your logic to redirect to the payment gateway
  void redirectToPaymentGateway(String address) {
    print('Redirecting to payment gateway with address: $address');
    // Add your code here to handle payment gateway redirection
  }
}

void main() {
  runApp(const MaterialApp(
    home: PaymentForm(),
  ));
}
