import 'package:flutter/material.dart';
import 'package:nzinga/cores/locator/locator.dart';
import 'package:nzinga/services/auth_service.dart';
import 'package:stacked/stacked.dart';

class RegisterScreenViewModel extends BaseViewModel {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final AuthService _authService = AuthService();
  
  bool _isBusy = false;
  
  @override
  bool get isBusy => _isBusy;
  
  @override
  setBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  Future<void> signUp() async {
    if (email.text.isEmpty || password.text.isEmpty || confirmPassword.text.isEmpty) {
      snackbarService.error(message: 'Please fill in all fields');
      return;
    }
    if (!_isValidEmail(email.text)) {
      snackbarService.error(message: 'Please enter a valid email address');
      return;
    }
    if (!_isPasswordMatching()) {
      snackbarService.error(message: 'Passwords do not match');
      return;
    }
    await _authService.signUpWithEmailPassword(email.text, password.text);
  }

  bool _isPasswordMatching() {
    return password.text == confirmPassword.text;
  }

  bool _isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}