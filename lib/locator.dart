import 'package:get_it/get_it.dart';
import 'package:portfolio_website/services/firestore_service.dart';
import 'package:portfolio_website/services/navigation_service.dart';
import 'package:portfolio_website/services/state_manager.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => StateManager());
  locator.registerLazySingleton(() => FirestoreService());
}
