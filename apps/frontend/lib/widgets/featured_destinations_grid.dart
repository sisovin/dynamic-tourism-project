import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class FeaturedDestinationsGrid extends StatefulWidget {
  @override
  _FeaturedDestinationsGridState createState() => _FeaturedDestinationsGridState();
}

class _FeaturedDestinationsGridState extends State<FeaturedDestinationsGrid> {
  List<dynamic> featuredDestinations = [];

  @override
  void initState() {
    super.initState();
    fetchFeaturedDestinations();
  }

  Future<void> fetchFeaturedDestinations() async {
    try {
      final response = await Dio().get('http://localhost:8000/api/destinations/');
      setState(() {
        featuredDestinations = response.data;
      });
    } catch (e) {
      print('Error fetching featured destinations: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemCount: featuredDestinations.length,
      itemBuilder: (context, index) {
        final destination = featuredDestinations[index];
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                destination['images'][0],
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination['title'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '\$${destination['price']}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Rating: ${destination['rating']}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
