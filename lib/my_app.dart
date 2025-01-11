import 'package:flutter/material.dart';
import 'package:shopping_app/feature/home/view/screen/home_screen.dart';
import 'core/style/color_app.dart';
import 'feature/categories/view/screen/category_screen.dart';
import 'feature/splash/view/screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,

      ),
      home: CategoryScreen(),
    );
  }
}
