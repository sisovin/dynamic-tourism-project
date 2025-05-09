import 'package:flutter/material.dart';
import 'package:dynamic_tourism_project/pages/home_page.dart';
import 'package:dynamic_tourism_project/pages/about_page.dart';
import 'package:dynamic_tourism_project/pages/blog_page.dart';
import 'package:dynamic_tourism_project/pages/booking_page.dart';
import 'package:dynamic_tourism_project/pages/contact_page.dart';
import 'package:dynamic_tourism_project/pages/destination_page.dart';
import 'package:dynamic_tourism_project/pages/error_page.dart';
import 'package:dynamic_tourism_project/pages/gallery_page.dart';
import 'package:dynamic_tourism_project/pages/guide_page.dart';
import 'package:dynamic_tourism_project/pages/package_page.dart';
import 'package:dynamic_tourism_project/pages/service_page.dart';
import 'package:dynamic_tourism_project/pages/testimonial_page.dart';
import 'package:dynamic_tourism_project/pages/tour_category_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Tourism Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/about': (context) => AboutPage(),
        '/blog': (context) => BlogPage(),
        '/booking': (context) => BookingPage(),
        '/contact': (context) => ContactPage(),
        '/destinations': (context) => DestinationPage(),
        '/gallery': (context) => GalleryPage(),
        '/guides': (context) => GuidePage(),
        '/packages': (context) => PackagePage(),
        '/services': (context) => ServicePage(),
        '/testimonials': (context) => TestimonialPage(),
        '/categories': (context) => TourCategoryPage(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => ErrorPage());
      },
    );
  }
}
