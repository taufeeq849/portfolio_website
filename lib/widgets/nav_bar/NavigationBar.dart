import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/nav_bar/NavigationBarMobile.dart';
import 'package:portfolio_website/widgets/nav_bar/NavigationBarDesktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBar extends StatelessWidget {
  NavigationBar();

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(),
      desktop: NavigationBarDesktop(),
    );
  }
}
