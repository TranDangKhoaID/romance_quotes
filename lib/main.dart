import 'package:flutter/material.dart';
import 'package:romance_quotes/app/app.dart';
import 'package:romance_quotes/app/storage/app_shared.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppShared.init();
  runApp(const MyApp());
}
