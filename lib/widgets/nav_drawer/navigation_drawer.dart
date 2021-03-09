import 'package:flutter/material.dart';
import 'package:portfolio_website/routing/route_names.dart';
import 'package:portfolio_website/widgets/nav_drawer/drawer_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]),
      child: Column(
        children: <Widget>[
          DrawerItem('Home', Icons.home, homeRoute),
          DrawerItem(
            'Portfolio',
            Icons.code,
            portfolioRoute,
          ),
          DrawerItem(
            'About me ',
            Icons.info,
            aboutRoute,
          ),
          DrawerItem(
            'Resume',
            Icons.receipt,
            resumeRoute,
          ),
          DrawerItem(
            'Contact Me',
            Icons.phone,
            contactRoute,
          )
        ],
      ),
    );
  }
}
