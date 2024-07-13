import 'package:get_it/get_it.dart';
import 'package:nzinga/services/navigation_service.dart';
import 'package:nzinga/services/snackbar.dart';

final locator = GetIt.instance;


Future<void> setupLocator() async {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<SnackbarService>(() => SnackbarService());
}

NavigationService navigationService = locator.get<NavigationService>();
SnackbarService snackbarService = locator.get<SnackbarService>();

