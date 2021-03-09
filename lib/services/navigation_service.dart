import 'package:flutter/material.dart';
import 'package:portfolio_website/models/project.dart';
import 'package:portfolio_website/routing/route_names.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  int index;

  Future<dynamic> navigateTo({String routeName, Project project}) {
    navigatorKey.currentState.pushNamed(routeName, arguments: project);
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }

  updateIndex(routeName) {
    switch (routeName) {
      case homeRoute:
        index = 0;
        return;
      case portfolioRoute:
        index = 1;
        return;
      case aboutRoute:
        index = 2;
        return;
      case resumeRoute:
        index = 3;
        return;
      case contactRoute:
        index = 4;
        return;
      default:
        index = 0;
        return;
    }
  }
}
