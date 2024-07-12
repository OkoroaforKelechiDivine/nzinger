import 'package:flutter/material.dart';
import 'package:nzinga/app.dart';
import 'package:nzinga/core/locator/locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  await Supabase.initialize(
    url: 'https://fualrzgnbccbknludxcl.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ1YWxyemduYmNjYmtubHVkeGNsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjA3MjE3NTQsImV4cCI6MjAzNjI5Nzc1NH0.iDBtqtTsKR23vdkhDITRB156WwV1oZ2BJvxI25gn2iI',
  );
  runApp(const MyApp());
}
