import 'package:flutter/material.dart';
import 'package:dynamic_tourism_project/components/common/guide_card.dart';

class GuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tour Guides'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GuideCard(
              name: 'John Doe',
              bio: 'Experienced tour guide with a passion for adventure.',
              languages: ['English', 'Spanish'],
            ),
            GuideCard(
              name: 'Jane Smith',
              bio: 'Expert in local culture and history.',
              languages: ['English', 'French'],
            ),
            GuideCard(
              name: 'Alice Johnson',
              bio: 'Nature enthusiast and wildlife expert.',
              languages: ['English', 'German'],
            ),
          ],
        ),
      ),
    );
  }
}
