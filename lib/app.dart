import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:nzinga/app_theme/theme_manager.dart';
import 'package:nzinga/view/splash/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(microseconds: 40),
      debugShowCheckedModeBanner: false,
      title: 'Nzinga',
      theme: getApplicationTheme(),
      initialRoute: "/",
      routes: {
       "/": (context) => const SplashView(),
      },
    );
  }
}