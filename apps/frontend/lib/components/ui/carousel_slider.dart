import 'package:flutter/material.dart';

class HeroCarousel extends StatefulWidget {
  @override
  _HeroCarouselState createState() => _HeroCarouselState();
}

class _HeroCarouselState extends State<HeroCarousel> {
  final PageController _pageController = PageController();
  final List<String> _imageUrls = [
    'https://example.com/image1.jpg',
    'https://example.com/image2.jpg',
    'https://example.com/image3.jpg',
  ];
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoRotation();
  }

  void _startAutoRotation() {
    Future.delayed(Duration(seconds: 3), () {
      if (_pageController.hasClients) {
        _currentPage = (_currentPage + 1) % _imageUrls.length;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        _startAutoRotation();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _imageUrls.length,
        itemBuilder: (context, index) {
          return Image.network(
            _imageUrls[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
