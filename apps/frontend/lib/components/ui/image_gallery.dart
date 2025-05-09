import 'package:flutter/material.dart';

class ImageGallery extends StatelessWidget {
  final List<String> imageUrls;

  ImageGallery({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                child: Container(
                  child: Image.network(imageUrls[index]),
                ),
              ),
            );
          },
          child: Image.network(imageUrls[index]),
        );
      },
    );
  }
}
