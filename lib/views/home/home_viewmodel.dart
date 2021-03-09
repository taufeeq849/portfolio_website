import 'package:portfolio_website/models/data_models.dart';
import 'package:portfolio_website/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';

class HomeViewModel extends BaseViewModel {
  FirestoreService _firestoreService = locator<FirestoreService>();
  HomeData homeData;

  fetchHomeData() async {
    setBusy(true);
    var result = await _firestoreService.fetchHomeData();
    if (result is String) {
      setError('Error, try again later');
      return setBusy(false);
    } else {
      homeData = result;
      return setBusy(false);
    }
  }
}
