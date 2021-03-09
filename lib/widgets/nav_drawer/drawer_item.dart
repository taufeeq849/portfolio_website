import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/nav_bar/NavBarItem.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  final IconData icon;

  const DrawerItem(this.title, this.icon, this.navigationPath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(icon),
          SizedBox(width: 30),
          NavBarItem(title, navigationPath, false),
        ],
      ),
    );
  }
}
