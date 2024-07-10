import 'package:get_it/get_it.dart';
import 'package:nzinga/services/navigation_service.dart';

final locator = GetIt.instance;


Future<void> setupLocator() async {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
}

NavigationService navigationService = locator.get<NavigationService>();