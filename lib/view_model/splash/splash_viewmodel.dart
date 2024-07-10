import 'package:nzinga/core/locator/locator.dart';
import 'package:nzinga/view/intro/intro_screen.dart';
import 'package:stacked/stacked.dart';

class SplashScreenViewModel extends BaseViewModel {
  Future<void> initializeSplashScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    navigationService.pushReplacement(const AuthenticationScreen());
  }
}
