import 'package:nzinga/core/locator/locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<void> signUpWithGitHub() async {
    try {
      final bool result = await _supabaseClient.auth.signInWithOAuth(
        Provider.github,
      );

      if (!result) {
        snackbarService.error(message: 'Error signing in with GitHub');
        return;
      }

      User? currentUser = _supabaseClient.auth.currentUser;
      if (currentUser != null) {
        snackbarService.success(message: 'Account Created Successfully');
        return;
      }
      else {
        snackbarService.error(message: 'Error: Current user not available after sign-in');
      }
    } catch (error) {
      snackbarService.error(message: 'Error signing in with GitHub: $error');
    }
  }

  Future<void> signUpWithEmailPassword(String email, String password) async {
    try {
      final response = await _supabaseClient.auth.signUp(email: email, password: password);
      User? currentUser = _supabaseClient.auth.currentUser;
      if (currentUser != null) {
        snackbarService.success(message: 'Account created successfully');
        return;
      }
      else {
        snackbarService.error(message: 'Error: Current user not available after sign-in');
      }

    } on AuthException catch (authError) {
      snackbarService.error(message: 'Error signing up: ${authError.message}');
    } catch (error) {
      snackbarService.error(message: 'Error signing up: $error');
    }
  }

}
