import 'package:portfolio_website/locator.dart';
import 'package:portfolio_website/models/project.dart';
import 'package:portfolio_website/services/navigation_service.dart';
import 'package:portfolio_website/services/state_manager.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class SpecificProjectViewModel extends BaseViewModel {
  StateManager _stateManager = locator<StateManager>();
  NavigationService _navigationService = locator<NavigationService>();
  Project project;

  getProject() {
    project = _stateManager.project;
  }

  navigateBack() {
    _navigationService.goBack();
  }

  void navigatetoUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
