import 'package:flutter/material.dart';
import 'package:portfolio_website/routing/route_names.dart';
import 'package:portfolio_website/routing/router.dart';
import 'package:portfolio_website/services/navigation_service.dart';
import 'package:portfolio_website/services/state_manager.dart';
import 'package:portfolio_website/views/home/content/home_content_desktop.dart';
import 'package:portfolio_website/views/home/content/home_content_mobile.dart';
import 'package:portfolio_website/views/home/home_view.dart';
import 'package:portfolio_website/widgets/centered_view/centered_view.dart';
import 'package:portfolio_website/widgets/nav_bar/NavigationBar.dart';
import 'package:portfolio_website/widgets/nav_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../locator.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StateManager stateManager = locator<StateManager>();
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Scaffold(
        key: stateManager.scaffoldState,
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? NavigationDrawer()
            : null,
        backgroundColor: Colors.black,
        body: CenteredView(
          child: Column(
            children: <Widget>[
              NavigationBar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Navigator(
                    key: locator<NavigationService>().navigatorKey,
                    onGenerateRoute: generateRoute,
                    initialRoute: homeRoute,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
