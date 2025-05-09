import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;
  final Widget desktopLayout;

  const ResponsiveLayout({
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout,
  });

  static const int mobileBreakpoint = 600;
  static const int tabletBreakpoint = 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileBreakpoint) {
          return mobileLayout;
        } else if (constraints.maxWidth < tabletBreakpoint) {
          return tabletLayout;
        } else {
          return desktopLayout;
        }
      },
    );
  }
}
