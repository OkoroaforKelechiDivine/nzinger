import 'package:flutter/material.dart';
import 'package:nzinga/cores/locator/locator.dart';
import 'package:nzinga/services/auth_service.dart';
import 'package:stacked/stacked.dart';

class LoginViewmodel extends BaseViewModel{
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final AuthService _authService = AuthService();

  Future<void>signin() async {
     if (email.text.isEmpty || password.text.isEmpty) {
      snackbarService.error(message: 'Please fill in all fields');
      return;
    }
    await _authService.signInWithEmailPassword(email.text, password.text);
  }
}