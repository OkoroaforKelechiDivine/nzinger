import 'package:nzinga/cores/locator/locator.dart';
import 'package:nzinga/views/auth/verify/verify.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  // Future<void> signUpWithGitHub() async {
  //   try {
  //     final bool result = await _supabaseClient.auth.signInWithOAuth(
  //       Provider.github,
  //       redirectTo: "http://schemas.android.com/apk/res/android"
  //     );
  //     snackbarService.success(message: "Account successfully signed in created with Github");
  //     navigationService.pushAndRemoveUntil(VerifyScreen());
  //   } on AuthException catch (authError) {
  //     snackbarService.error(message: authError.message);
  //   } catch (error) {
  //     snackbarService.error(message: error.toString());
  //   }
  // }

  //   Future<void> signUpWithGitHub() async {
  //   try {
  //     final bool result = await _supabaseClient.auth.signInWithOAuth(
  //       Provider.github,
  //     );
  //     if (!result) {
  //       snackbarService.error(message: 'Error signing in with GitHub');
  //       return;
  //     }
  //     User? currentUser = _supabaseClient.auth.currentUser;
  //     if (currentUser != null) {
  //       snackbarService.success(message: 'Account Created Successfully');
  //       return;
  //     }
  //     else {
  //       snackbarService.error(message: 'Error: Current user not available after sign-in');
  //     }
  //   } catch (error) {
  //     snackbarService.error(message: 'Error signing in with GitHub: $error');
  //   }
  // }

 Future<void> signUpWithEmailPassword(String email, String password) async {
    try {
      await _supabaseClient.auth.signUp(email: email, password: password);
      snackbarService.success(message: 'Account Created Successfully');
      navigationService.pushAndRemoveUntil(const VerifyScreen());
    } on AuthException catch (authError) {
      snackbarService.error(message: authError.message);
    } catch (error) {
      snackbarService.error(message: error.toString());
    }
  }
}