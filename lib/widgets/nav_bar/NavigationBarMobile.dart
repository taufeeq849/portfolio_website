import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/services/state_manager.dart';
import 'package:portfolio_website/widgets/nav_bar/NavBarLogo.dart';

import '../../locator.dart';

class NavigationBarMobile extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    StateManager stateManager = locator<StateManager>();
    return Container(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              stateManager.scaffoldState.currentState.openDrawer();
            },
          ),
          NavBarLogo()
        ],
      ),
    );
  }
}
