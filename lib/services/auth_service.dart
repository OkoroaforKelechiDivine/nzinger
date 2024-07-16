import 'package:nzinga/cores/locator/locator.dart';
import 'package:nzinga/view_models/home/home_viewmodel.dart';
import 'package:nzinga/views/auth/login/login_screen.dart';
import 'package:nzinga/views/home/home_sreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<void> signUpWithEmailPassword(String email, String password) async {
    try {
      await _supabaseClient.auth.signUp(email: email, password: password);
      snackbarService.success(message: 'Account Created Successfully');
      navigationService.pushAndRemoveUntil(const LoginScreen());
    } on AuthException catch (authError) {
      snackbarService.error(message: authError.message);
    } catch (error) {
      snackbarService.error(message: error.toString());
    }
  }

  Future<void> signInWithEmailPassword(String email, String password) async {
    try {
      final AuthResponse res = await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      String token = res.session!.accessToken;
      snackbarService.success(message: 'Sign In Successful');
      await HomeViewModel.saveTokenGlobally(token);
      navigationService.pushAndRemoveUntil(const HomeScreen());
    } on AuthException catch (authError) {
      snackbarService.error(message: authError.message);
    } catch (error) {
      snackbarService.error(message: error.toString());
    }
  }

  Future<String?> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<bool> checkAuthenticationStatus() async {
  String? token = await loadToken();
  if (token != null) {
    navigationService.pushAndRemoveUntil(const HomeScreen());
    return true; // Return true indicating authenticated
  } else {
    navigationService.pushAndRemoveUntil(const LoginScreen());
    return false;
  }
}

}
