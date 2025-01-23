import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/feature/auth/cubit/auth_cubit.dart';
import 'package:shopping_app/feature/favorite/cubit/favorite_cubit.dart';
import 'package:shopping_app/feature/lap_cart_screen/view/screen/lap_cart_screen.dart';
import 'package:shopping_app/feature/profile/view/screen/profile_drawer.dart';
import 'core/style/color_app.dart';
import 'feature/auth/view/screen/login_screen.dart';
import 'feature/cart/cubit/add_cart_cubit.dart';
import 'feature/categories/view/screen/category_screen.dart';
import 'feature/lap_cart_screen/cubit/laptop_category_cubit.dart';
import 'feature/splash/view/screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthCubit(),
            ),
            BlocProvider(
              create: (context) => AddCartCubit(),
            ),
            BlocProvider(
              create: (context) => LaptopCategoryCubit()..getLapCubit(),
            ),
            BlocProvider(
              create: (context) => FavoriteCubit(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
            ),
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}
