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