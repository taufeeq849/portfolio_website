import 'package:flutter/material.dart';
import 'package:portfolio_website/constants/app_colors.dart';
import 'package:portfolio_website/widgets/nav_bar/navbaritem_viewmodel.dart';
import 'package:stacked/stacked.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  final bool isWhite;

  const NavBarItem(this.title, this.navigationPath, this.isWhite);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NavBarItemViewModel>.reactive(
        viewModelBuilder: () => NavBarItemViewModel(),
        builder: (context, model, child) {
         //code use for potential down the line updating of nav bar items depending on which screen is currently active !
          // model.checkIndex(navigationPath);
          return GestureDetector(
            onTap: () {
              model.navigate(navigationPath);
            },
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18, color: isWhite ? Colors.white : Colors.black),
            ),
          );
        });
  }
}
