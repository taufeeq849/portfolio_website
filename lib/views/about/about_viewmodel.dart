import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutViewModel extends BaseViewModel {
  String url;

  navigateToSocials(String social) async {
    switch (social) {
      case 'github':
        url = 'https://github.com/taufeeq849';
        break;
      case 'linkedin':
        url = 'https://www.linkedin.com/in/taufeeq-razak-6202041b3';
        break;
      default:
        url = 'www.google.com';
        break;
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
