import 'package:flutter/material.dart';
import 'package:portfolio_website/routing/route_names.dart';
import 'package:portfolio_website/widgets/nav_bar/NavBarItem.dart';
import 'package:portfolio_website/widgets/nav_bar/NavBarLogo.dart';

class NavigationBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavBarItem('Home', homeRoute, true, ),
              SizedBox(
                width: 60,
              ),
              NavBarItem('Portfolio', portfolioRoute, true, ),
              SizedBox(
                width: 60,
              ),
              NavBarItem('About Me', aboutRoute, true, ),
              SizedBox(
                width: 60,
              ),
              NavBarItem('Resume', resumeRoute, true, ),
              SizedBox(
                width: 60,
              ),
              NavBarItem('Contact Me', contactRoute, true),
            ],
          )
        ],
      ),
    );
  }
}
