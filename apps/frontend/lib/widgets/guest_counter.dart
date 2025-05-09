import 'package:flutter/material.dart';

class GuestCounter extends StatefulWidget {
  final int initialCount;
  final Function(int) onCountChanged;

  GuestCounter({required this.initialCount, required this.onCountChanged});

  @override
  _GuestCounterState createState() => _GuestCounterState();
}

class _GuestCounterState extends State<GuestCounter> {
  late int _guestCount;

  @override
  void initState() {
    super.initState();
    _guestCount = widget.initialCount;
  }

  void _incrementCount() {
    setState(() {
      _guestCount++;
    });
    widget.onCountChanged(_guestCount);
  }

  void _decrementCount() {
    if (_guestCount > 1) {
      setState(() {
        _guestCount--;
      });
      widget.onCountChanged(_guestCount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: _decrementCount,
        ),
        Text(
          '$_guestCount',
          style: TextStyle(fontSize: 18),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: _incrementCount,
        ),
      ],
    );
  }
}
