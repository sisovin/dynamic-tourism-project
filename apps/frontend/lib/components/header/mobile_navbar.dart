import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';

class MobileNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 40,
              ),
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ],
          ),
          Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                _buildDrawerItem('Home'),
                _buildDrawerItem('Destinations'),
                _buildDrawerItem('Packages'),
                _buildDrawerItem('Testimonials'),
                _buildDrawerItem('Blog'),
                _buildDrawerItem('Contact'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        // Handle navigation
      },
    );
  }
}
