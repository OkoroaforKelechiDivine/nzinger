import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzinga/app_theme/font_manager.dart';
import 'package:nzinga/default_settings/app_text/app_text.dart';
import 'package:nzinga/default_settings/app_text_field/app_text_field.dart';
import 'package:nzinga/view/auth/widget/auth_text_buttons.dart';
import 'package:nzinga/view/auth/widget/sign_in_options.dart';
import 'package:nzinga/view_model/register/register_screen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => RegisterScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: AppText(
              text: 'Create Account',
              fontSize: AppFontSize.s24.sp,
            ),
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50.sp),
                  AppTextField(
                    controller: model.email,
                    labelText: 'Email',
                  ),
                  SizedBox(height: 10.sp),
                  AppTextField(
                    labelText: 'Password',
                    controller: model.password,
                    obscureText: true,
                  ),
                  SizedBox(height: 10.sp),
                  AppTextField(
                    labelText: 'Confirm Password',
                    obscureText: true,
                    controller: model.confirmPassword,
                  ),
                  SizedBox(height: 20.sp),
                  AuthTextButtons(
                    onRegisterPressed: model.signUp,
                    onBackToLoginPressed: () {},
                  ),
                  SizedBox(height: 20.sp),
                  SignInWithOptions(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
