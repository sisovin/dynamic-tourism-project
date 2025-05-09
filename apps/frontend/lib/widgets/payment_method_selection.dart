import 'package:flutter/material.dart';

class PaymentMethodSelection extends StatefulWidget {
  final Function(String) onPaymentMethodSelected;

  PaymentMethodSelection({required this.onPaymentMethodSelected});

  @override
  _PaymentMethodSelectionState createState() => _PaymentMethodSelectionState();
}

class _PaymentMethodSelectionState extends State<PaymentMethodSelection> {
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Payment Method',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        DropdownButton<String>(
          value: _selectedPaymentMethod,
          hint: Text('Select Payment Method'),
          items: <String>['Credit Card', 'PayPal', 'Bank Transfer']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedPaymentMethod = newValue;
            });
            widget.onPaymentMethodSelected(newValue!);
          },
        ),
      ],
    );
  }
}
