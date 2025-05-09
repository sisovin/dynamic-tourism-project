import 'package:flutter/material.dart';

class DateRangePicker extends StatefulWidget {
  final Function(DateTimeRange) onDateRangeSelected;

  DateRangePicker({required this.onDateRangeSelected});

  @override
  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateTimeRange? _selectedDateRange;

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (picked != null && picked != _selectedDateRange) {
      setState(() {
        _selectedDateRange = picked;
      });
      widget.onDateRangeSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Date Range',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () => _selectDateRange(context),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              _selectedDateRange == null
                  ? 'Select Date Range'
                  : '${_selectedDateRange!.start.toLocal()} - ${_selectedDateRange!.end.toLocal()}',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
