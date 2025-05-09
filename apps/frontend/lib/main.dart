import 'package:flutter/material.dart';
import 'widgets/destination_card.dart';
import 'widgets/hero_carousel.dart';
import 'widgets/search_bar.dart';
import 'widgets/featured_destinations_grid.dart';
import 'widgets/testimonials_section.dart';
import 'widgets/newsletter_signup.dart';
import 'widgets/responsive_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Tourism Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Tourism Project'),
      ),
      body: ResponsiveLayout(
        mobileLayout: Column(
          children: [
            HeroCarousel(),
            SearchBar(),
            Expanded(child: FeaturedDestinationsGrid()),
            TestimonialsSection(),
            NewsletterSignup(),
          ],
        ),
        tabletLayout: Column(
          children: [
            HeroCarousel(),
            SearchBar(),
            Expanded(child: FeaturedDestinationsGrid()),
            TestimonialsSection(),
            NewsletterSignup(),
          ],
        ),
        desktopLayout: Column(
          children: [
            HeroCarousel(),
            SearchBar(),
            Expanded(child: FeaturedDestinationsGrid()),
            TestimonialsSection(),
            NewsletterSignup(),
          ],
        ),
      ),
    );
  }
}
