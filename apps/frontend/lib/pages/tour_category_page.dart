import 'package:flutter/material.dart';
import 'package:dynamic_tourism_project/components/common/tour_category_card.dart';
import 'package:dynamic_tourism_project/components/common/search_bar.dart';

class TourCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tour Categories'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(),
            TourCategoryCard(
              title: 'Adventure Tours',
              description: 'Experience thrilling adventures',
              imageUrl: 'https://example.com/adventure.jpg',
              onExplore: () {
                // Handle explore action
              },
            ),
            TourCategoryCard(
              title: 'Cultural Tours',
              description: 'Immerse yourself in different cultures',
              imageUrl: 'https://example.com/cultural.jpg',
              onExplore: () {
                // Handle explore action
              },
            ),
            TourCategoryCard(
              title: 'Luxury Tours',
              description: 'Indulge in luxury experiences',
              imageUrl: 'https://example.com/luxury.jpg',
              onExplore: () {
                // Handle explore action
              },
            ),
            TourCategoryCard(
              title: 'Wildlife Tours',
              description: 'Discover the beauty of wildlife',
              imageUrl: 'https://example.com/wildlife.jpg',
              onExplore: () {
                // Handle explore action
              },
            ),
          ],
        ),
      ),
    );
  }
}
