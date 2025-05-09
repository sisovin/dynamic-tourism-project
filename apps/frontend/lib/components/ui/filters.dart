import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  final Function(String, double) onFilterChanged;

  Filters({required this.onFilterChanged});

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  String? _selectedLocation;
  double? _selectedRating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          hint: Text('Select Location'),
          value: _selectedLocation,
          items: ['Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania']
              .map((location) {
            return DropdownMenuItem<String>(
              value: location,
              child: Text(location),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedLocation = value;
            });
            widget.onFilterChanged(_selectedLocation!, _selectedRating ?? 0);
          },
        ),
        DropdownButton<double>(
          hint: Text('Select Rating'),
          value: _selectedRating,
          items: [1, 2, 3, 4, 5].map((rating) {
            return DropdownMenuItem<double>(
              value: rating.toDouble(),
              child: Text(rating.toString()),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedRating = value;
            });
            widget.onFilterChanged(_selectedLocation ?? '', _selectedRating!);
          },
        ),
      ],
    );
  }
}
