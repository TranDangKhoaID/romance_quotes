import 'package:flutter/material.dart';
import 'package:romance_quotes/presentation/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //builder: EasyLoading.init(),
      home: HomePage(),
    );
  }
}
