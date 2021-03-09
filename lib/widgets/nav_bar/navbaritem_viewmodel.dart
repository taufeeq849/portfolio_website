import 'package:portfolio_website/locator.dart';
import 'package:portfolio_website/routing/route_names.dart';
import 'package:portfolio_website/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class NavBarItemViewModel extends BaseViewModel {
  int index;
  bool isSelected = false;

  NavigationService _navigationService = locator<NavigationService>();

  void navigate(String navigationPath) {
    _navigationService.navigateTo(routeName: navigationPath);
    notifyListeners();
  }

  checkIndex(String navigationPath) {
    switch (navigationPath) {
      case homeRoute:
        index = 0;
        break;
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
