import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveUI extends StatelessWidget {
  final Widget desktopScreen;
  final Widget tabletScreen;
  final Widget mobileScreen;

  static const double desktopBreakpoint = 1200; // Usually 1024 or 1200
  static const double tabletBreakpoint = 768; // Usually between 600-768

  const ResponsiveUI({
    Key? key,
    required this.desktopScreen,
    required this.tabletScreen,
    required this.mobileScreen,
  }) : super(key: key);

  // Helper methods to check screen size
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint &&
      MediaQuery.of(context).size.width < desktopBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopBreakpoint;

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
