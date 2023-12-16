import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:romance_quotes/presentation/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //builder: EasyLoading.init(),
      home: HomePage(),
    );
  }
}
