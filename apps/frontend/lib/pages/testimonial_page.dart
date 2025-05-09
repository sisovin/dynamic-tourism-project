import 'package:flutter/material.dart';
import 'package:dynamic_tourism_project/components/common/testimonial_card.dart';

class TestimonialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Testimonials'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'What Our Customers Say',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TestimonialCard(
              customerName: 'John Doe',
              rating: 5.0,
              content: 'This was the best vacation ever! Highly recommend.',
            ),
            TestimonialCard(
              customerName: 'Jane Smith',
              rating: 4.5,
              content: 'Amazing experience, beautiful destinations, and great service.',
            ),
            TestimonialCard(
              customerName: 'Alice Johnson',
              rating: 4.0,
              content: 'A trip to remember! Everything was perfect.',
            ),
          ],
        ),
      ),
    );
  }
}
