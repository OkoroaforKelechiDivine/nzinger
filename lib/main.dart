import 'package:flutter/material.dart';
import 'package:nzinga/app.dart';
import 'package:nzinga/cores/locator/locator.dart';
import 'package:nzinga/services/auth_service.dart';
import 'package:nzinga/views/home/home_sreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  await Supabase.initialize(
    url: 'https://fualrzgnbccbknludxcl.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ1YWxyemduYmNjYmtubHVkeGNsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjA3MjE3NTQsImV4cCI6MjAzNjI5Nzc1NH0.iDBtqtTsKR23vdkhDITRB156WwV1oZ2BJvxI25gn2iI',
  );

  // Check authentication status and set initial route
  bool isAuthenticated = await AuthService().checkAuthenticationStatus();
  Widget initialRoute = isAuthenticated ? const HomeScreen() : const MyApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: initialRoute,
  ));
}
