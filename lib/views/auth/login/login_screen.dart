import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzinga/app_themes/font_manager.dart';
import 'package:nzinga/cores/locator/locator.dart';
import 'package:nzinga/default_settings/app_text/app_text.dart';
import 'package:nzinga/default_settings/app_text_field/app_text_field.dart';
import 'package:nzinga/views/auth/register/register_screen.dart';
import 'package:nzinga/views/auth/widget/auth_text_buttons.dart';
import 'package:nzinga/view_models/auth/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:nzinga/views/auth/register/busy.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LoginViewmodel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Stack(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(20.sp),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 50.sp),
                      AppText(
                        text: "Let's continue from where you\n left off.",
                        fontSize: AppFontSize.s16.sp,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30.sp),
                      AppTextField(
                        controller: model.email,
                        labelText: 'Email',
                        fontSize: AppFontSize.s12.sp,
                      ),
                      SizedBox(height: 10.sp),
                      AppTextField(
                        labelText: 'Password',
                        controller: model.password,
                        obscureText: true,
                        fontSize: AppFontSize.s12.sp,
                      ),
                      SizedBox(height: 20.sp),
                      AuthTextButtons(
                        registerText: "Go to sign up",
                        backToLoginText: "Login",
                        onBackToLoginPressed: model.isBusy ? null : () async {
                          model.setBusy(true);
                          await model.signin();
                          model.setBusy(false);
                        },
                        onRegisterPressed: () {
                          navigationService.push(const RegisterScreen());
                        },
                      ),
                      SizedBox(height: 20.sp),
                    ],
                  ),
                ),
              ),
              CircularIndicator(show: model.isBusy),
            ],
          ),
        );
      },
    );
  }
}
