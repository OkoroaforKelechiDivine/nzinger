import 'package:flutter/material.dart';
import 'package:nzinga/app_theme/font_manager.dart';
import 'package:nzinga/default_settings/app_text/app_text.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppText(
          text: 'Nzinga',
          fontSize: AppFontSize.s38,
          fontWeight: AppFontWeight.bold,
        ),
      ),
    );
  }
}
