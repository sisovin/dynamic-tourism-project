import 'package:flutter/material.dart';
import 'package:dynamic_tourism_project/components/common/destination_card.dart';
import 'package:dynamic_tourism_project/components/common/search_bar.dart';
import 'package:dynamic_tourism_project/components/ui/filters.dart';
import 'package:dynamic_tourism_project/components/ui/google_map.dart';

class DestinationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destinations'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(),
            Filters(onFilterChanged: (location, rating) {
              // Handle filter changes
            }),
            DestinationCard(
              title: 'Destination 1',
              imageUrl: 'https://example.com/image1.jpg',
              rating: 4.5,
              price: 100.0,
              discount: 10.0,
              onBookNow: () {
                // Handle book now action
              },
            ),
            DestinationCard(
              title: 'Destination 2',
              imageUrl: 'https://example.com/image2.jpg',
              rating: 4.0,
              price: 150.0,
              discount: 5.0,
              onBookNow: () {
                // Handle book now action
              },
            ),
            GoogleMapWidget(),
          ],
        ),
      ),
    );
  }
}
