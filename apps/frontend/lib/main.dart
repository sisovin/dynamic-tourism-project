import 'package:flutter/material.dart';
import 'widgets/destination_card.dart';

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
      body: DestinationCard(
        title: 'Beautiful Beach',
        imageUrl: 'https://example.com/beach.jpg',
        rating: 4.5,
        price: 200.0,
        discount: 10.0,
        onBookNow: () {
          // Handle book now action
        },
      ),
    );
  }
}
