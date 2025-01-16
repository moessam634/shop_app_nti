import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/feature/home/view/screen/home_screen.dart';
import 'package:shopping_app/feature/login/view/screen/login_screen.dart';
import 'package:shopping_app/feature/register/view/screen/Register_screen.dart';
import 'core/style/color_app.dart';
import 'feature/categories/view/screen/category_screen.dart';
import 'feature/splash/view/screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
          ),
          home: LoginScreen(),
        );
      },
    );
  }
}
