import 'package:flutter/material.dart';
import 'package:dynamic_tourism_project/components/common/package_card.dart';

class PackagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tour Packages'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PackageCard(
              title: 'Package 1',
              imageUrl: 'https://example.com/image1.jpg',
              description: 'Description of Package 1',
              price: 100.0,
              onBookNow: () {
                // Handle book now action
              },
            ),
            PackageCard(
              title: 'Package 2',
              imageUrl: 'https://example.com/image2.jpg',
              description: 'Description of Package 2',
              price: 200.0,
              onBookNow: () {
                // Handle book now action
              },
            ),
            PackageCard(
              title: 'Package 3',
              imageUrl: 'https://example.com/image3.jpg',
              description: 'Description of Package 3',
              price: 300.0,
              onBookNow: () {
                // Handle book now action
              },
            ),
          ],
        ),
      ),
    );
  }
}
