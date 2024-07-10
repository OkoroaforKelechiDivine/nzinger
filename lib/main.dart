import 'package:flutter/material.dart';
import 'package:nzinga/app.dart';
import 'package:nzinga/core/locator/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  runApp(const MyApp());
}
