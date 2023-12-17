import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:romance_quotes/app/app.dart';
import 'package:romance_quotes/app/controller/quotes_controller.dart';
import 'package:romance_quotes/app/storage/app_shared.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppShared.init();
  Get.put(QuotesController());
  runApp(const MyApp());
}
