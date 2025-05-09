import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_tourism_project/widgets/[WidgetName].dart';

void main() {
  testWidgets('Test [WidgetName] default state', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: [WidgetName](
          title: 'Sample Title',
          imageUrl: 'https://example.com/image.jpg',
          rating: 4.5,
          price: 100,
          discount: 10,
          onBookNow: () {},
        ),
      ),
    ));

    expect(find.text('Sample Title'), findsOneWidget);
    expect(find.text('\$90.0'), findsOneWidget);
    expect(find.text('\$100.0'), findsOneWidget);
    expect(find.text('Book Now'), findsOneWidget);
  });

  testWidgets('Test [WidgetName] hover state', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: [WidgetName](
          title: 'Sample Title',
          imageUrl: 'https://example.com/image.jpg',
          rating: 4.5,
          price: 100,
          discount: 10,
          onBookNow: () {},
        ),
      ),
    ));

    final gesture = await tester.createGesture();
    await gesture.addPointer(location: Offset(0, 0));
    await tester.pump();

    expect(find.text('Sample Title'), findsOneWidget);
    expect(find.text('\$90.0'), findsOneWidget);
    expect(find.text('\$100.0'), findsOneWidget);
    expect(find.text('Book Now'), findsOneWidget);
  });

  testWidgets('Test [WidgetName] book now interaction', (WidgetTester tester) async {
    bool bookNowClicked = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: [WidgetName](
          title: 'Sample Title',
          imageUrl: 'https://example.com/image.jpg',
          rating: 4.5,
          price: 100,
          discount: 10,
          onBookNow: () {
            bookNowClicked = true;
          },
        ),
      ),
    ));

    await tester.tap(find.text('Book Now'));
    await tester.pump();

    expect(bookNowClicked, isTrue);
  });
}
