import 'package:flutter/material.dart';

class RealTimePriceCalculation extends StatelessWidget {
  final double price;

  RealTimePriceCalculation({required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Price',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          '\$${price.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 24, color: Colors.green),
        ),
      ],
    );
  }
}
