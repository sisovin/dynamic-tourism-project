import 'package:flutter/material.dart';
import 'date_range_picker.dart';
import 'guest_counter.dart';
import 'payment_method_selection.dart';
import 'real_time_price_calculation.dart';

class BookingForm extends StatefulWidget {
  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();
  DateTimeRange? _selectedDateRange;
  int _guestCount = 1;
  String? _selectedPaymentMethod;
  double _price = 0.0;

  void _updatePrice() {
    // Logic to calculate the price based on the selected date range and guest count
    setState(() {
      _price = (_selectedDateRange?.duration.inDays ?? 0) * _guestCount * 100.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          DateRangePicker(
            onDateRangeSelected: (dateRange) {
              setState(() {
                _selectedDateRange = dateRange;
              });
              _updatePrice();
            },
          ),
          GuestCounter(
            initialCount: _guestCount,
            onCountChanged: (count) {
              setState(() {
                _guestCount = count;
              });
              _updatePrice();
            },
          ),
          PaymentMethodSelection(
            onPaymentMethodSelected: (method) {
              setState(() {
                _selectedPaymentMethod = method;
              });
            },
          ),
          RealTimePriceCalculation(price: _price),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // Handle form submission
              }
            },
            child: Text('Book Now'),
          ),
        ],
      ),
    );
  }
}
