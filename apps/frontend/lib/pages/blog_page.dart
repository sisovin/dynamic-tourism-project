import 'package:flutter/material.dart';
import 'package:dynamic_tourism_project/components/common/blog_card.dart';
import 'package:dynamic_tourism_project/components/common/back_to_top.dart';
import 'package:dynamic_tourism_project/components/header/main_navbar.dart';
import 'package:dynamic_tourism_project/components/header/mobile_navbar.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainNavbar(),
            BlogCard(
              title: 'Blog Post 1',
              author: 'Author 1',
              contentSnippet: 'Blog post snippet',
              onReadMore: () {
                // Handle read more action
              },
            ),
            BlogCard(
              title: 'Blog Post 2',
              author: 'Author 2',
              contentSnippet: 'Blog post snippet',
              onReadMore: () {
                // Handle read more action
              },
            ),
            BlogCard(
              title: 'Blog Post 3',
              author: 'Author 3',
              contentSnippet: 'Blog post snippet',
              onReadMore: () {
                // Handle read more action
              },
            ),
            BackToTopButton(),
          ],
        ),
      ),
    );
  }
}
