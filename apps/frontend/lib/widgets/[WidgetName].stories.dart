import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import '[WidgetName].dart';

void main() {
  runApp(StorybookApp());
}

class StorybookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('[WidgetName] Storybook'),
        ),
        body: Storybook(
          children: [
            Story(
              name: '[WidgetName] Default',
              builder: (_, k) => [WidgetName](
                title: k.text('Title', 'Sample Title'),
                imageUrl: k.text('Image URL', 'https://example.com/image.jpg'),
                rating: k.slider('Rating', initial: 4.5, min: 0, max: 5),
                price: k.slider('Price', initial: 100, min: 0, max: 500),
                discount: k.slider('Discount', initial: 10, min: 0, max: 100),
                onBookNow: () => print('Book Now clicked'),
              ),
            ),
            Story(
              name: '[WidgetName] Hovered',
              builder: (_, k) => [WidgetName](
                title: k.text('Title', 'Hovered Title'),
                imageUrl: k.text('Image URL', 'https://example.com/hovered_image.jpg'),
                rating: k.slider('Rating', initial: 4.8, min: 0, max: 5),
                price: k.slider('Price', initial: 150, min: 0, max: 500),
                discount: k.slider('Discount', initial: 20, min: 0, max: 100),
                onBookNow: () => print('Book Now clicked'),
              ),
            ),
            Story(
              name: '[WidgetName] Discounted',
              builder: (_, k) => [WidgetName](
                title: k.text('Title', 'Discounted Title'),
                imageUrl: k.text('Image URL', 'https://example.com/discounted_image.jpg'),
                rating: k.slider('Rating', initial: 4.0, min: 0, max: 5),
                price: k.slider('Price', initial: 200, min: 0, max: 500),
                discount: k.slider('Discount', initial: 50, min: 0, max: 100),
                onBookNow: () => print('Book Now clicked'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
