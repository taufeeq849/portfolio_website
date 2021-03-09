import 'package:portfolio_website/locator.dart';
import 'package:portfolio_website/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class ContactViewModel extends BaseViewModel {
  bool hasSent = false;
  FirestoreService _database = locator<FirestoreService>();

  Future submitData(String name, email, message) {
    _database.uploadData(name, email, message);
    hasSent = true;
    notifyListeners();
  }
}
