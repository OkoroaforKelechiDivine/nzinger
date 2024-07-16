import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzinga/app_themes/font_manager.dart';
import 'package:nzinga/cores/locator/locator.dart';
import 'package:nzinga/default_settings/app_text/app_text.dart';
import 'package:nzinga/default_settings/app_text_field/app_text_field.dart';
import 'package:nzinga/view_models/auth/register/register_viewmodel.dart';
import 'package:nzinga/views/auth/login/login_screen.dart';
import 'package:nzinga/views/auth/register/busy.dart';
import 'package:nzinga/views/auth/widget/auth_text_buttons.dart';
import 'package:stacked/stacked.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => RegisterScreenViewModel(),
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
                        text: "You are Welcome to Nzinger, create an account to get started",
                        fontSize: AppFontSize.s16.sp,
                        fontWeight: AppFontWeight.bold,
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
                      SizedBox(height: 10.sp),
                      AppTextField(
                        labelText: 'Confirm Password',
                        obscureText: true,
                        controller: model.confirmPassword,
                        fontSize: AppFontSize.s12.sp,
                      ),
                      SizedBox(height: 20.h),
                      AuthTextButtons(
                        registerText: "Register",
                        backToLoginText: "< Back to Login",
                        onRegisterPressed: model.isBusy ? null : () async {
                          model.setBusy(true);
                          await model.signUp();
                          model.setBusy(false);
                        },
                        onBackToLoginPressed: () {
                          navigationService.pushReplacement(const LoginScreen());
                        },
                      ),
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
