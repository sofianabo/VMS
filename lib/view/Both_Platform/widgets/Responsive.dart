import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveUI extends StatelessWidget {
  final Widget desktopScreen;
  final Widget tabletScreen;
  final Widget mobileScreen;

  static const double desktopBreakpoint = 1200; // Usually 1024 or 1200
  static const double tabletBreakpoint = 769; // Usually between 600-768

  const ResponsiveUI({
    Key? key,
    required this.desktopScreen,
    required this.tabletScreen,
    required this.mobileScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= desktopBreakpoint) {
          return desktopScreen;
        } else if (constraints.maxWidth >= tabletBreakpoint) {
          return tabletScreen;
        } else {
          return mobileScreen;
        }
      },
    );
  }
}
