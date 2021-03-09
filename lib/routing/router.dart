import 'package:flutter/material.dart';
import 'package:portfolio_website/routing/route_names.dart';
import 'package:portfolio_website/views/about/about_view.dart';
import 'package:portfolio_website/views/contact_me/contact_view.dart';
import 'package:portfolio_website/views/home/home_view.dart';
import 'package:portfolio_website/views/portfolio/portfolio_view.dart';
import 'package:portfolio_website/views/resume/resume_view.dart';
import 'package:portfolio_website/views/specificProject/specific_project_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case homeRoute:
      return _getPageRoute(HomeView());
    case portfolioRoute:
      return _getPageRoute(PortfolioView());
    case aboutRoute:
      return _getPageRoute(AboutView());
    case resumeRoute:
      return _getPageRoute(ResumeView());
    case contactRoute:
      return _getPageRoute(ContactView());
    case specificProjectRoute:
      return _getPageRoute(SpecificProjectView());
    default:
      return _getPageRoute(HomeView());
  }
}

PageRoute _getPageRoute(Widget child) {
  return _FadeRoute(child: child);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;

  _FadeRoute({this.child})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
