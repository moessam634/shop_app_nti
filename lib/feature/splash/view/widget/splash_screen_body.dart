import 'package:flutter/material.dart';
import 'package:shopping_app/core/style/image_app.dart';
import 'package:shopping_app/core/style/size_app.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: SizeApp.s60,
        backgroundImage: NetworkImage(ImageApp.splashImage),
      ),
    );
  }
}
