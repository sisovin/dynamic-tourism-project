import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final String title;
  final String author;
  final String contentSnippet;
  final VoidCallback onReadMore;

  BlogCard({
    required this.title,
    required this.author,
    required this.contentSnippet,
    required this.onReadMore,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'by $author',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              contentSnippet,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: onReadMore,
              child: Text('Read More'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
