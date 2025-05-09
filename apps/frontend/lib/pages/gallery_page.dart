import 'package:flutter/material.dart';
import 'package:dynamic_tourism_project/components/ui/image_gallery.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageGallery(
              imageUrls: [
                'https://example.com/image1.jpg',
                'https://example.com/image2.jpg',
                'https://example.com/image3.jpg',
              ],
            ),
          ],
        ),
      ),
    );
  }
}
