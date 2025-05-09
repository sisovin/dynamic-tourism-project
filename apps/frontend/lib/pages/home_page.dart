import 'package:flutter/material.dart';
import 'package:dynamic_tourism_project/components/common/back_to_top.dart';
import 'package:dynamic_tourism_project/components/common/blog_card.dart';
import 'package:dynamic_tourism_project/components/common/booking_form.dart';
import 'package:dynamic_tourism_project/components/common/contact_form.dart';
import 'package:dynamic_tourism_project/components/common/destination_card.dart';
import 'package:dynamic_tourism_project/components/common/guide_card.dart';
import 'package:dynamic_tourism_project/components/common/newsletter_form.dart';
import 'package:dynamic_tourism_project/components/common/package_card.dart';
import 'package:dynamic_tourism_project/components/common/search_bar.dart';
import 'package:dynamic_tourism_project/components/common/testimonial_card.dart';
import 'package:dynamic_tourism_project/components/header/main_navbar.dart';
import 'package:dynamic_tourism_project/components/header/mobile_navbar.dart';
import 'package:dynamic_tourism_project/components/ui/carousel_slider.dart';
import 'package:dynamic_tourism_project/components/ui/filters.dart';
import 'package:dynamic_tourism_project/components/ui/google_map.dart';
import 'package:dynamic_tourism_project/components/ui/image_gallery.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainNavbar(),
            HeroCarousel(),
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
            PackageCard(
              title: 'Package 1',
              imageUrl: 'https://example.com/image2.jpg',
              description: 'Package description',
              price: 200.0,
              onBookNow: () {
                // Handle book now action
              },
            ),
            GuideCard(
              name: 'Guide 1',
              bio: 'Guide bio',
              languages: ['English', 'Spanish'],
            ),
            TestimonialCard(
              customerName: 'Customer 1',
              rating: 5.0,
              content: 'Testimonial content',
            ),
            BlogCard(
              title: 'Blog Post 1',
              author: 'Author 1',
              contentSnippet: 'Blog post snippet',
              onReadMore: () {
                // Handle read more action
              },
            ),
            BookingForm(),
            ContactForm(),
            NewsletterForm(),
            GoogleMapWidget(),
            ImageGallery(
              imageUrls: [
                'https://example.com/image1.jpg',
                'https://example.com/image2.jpg',
                'https://example.com/image3.jpg',
              ],
            ),
            BackToTopButton(),
          ],
        ),
      ),
    );
  }
}
