import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/style/size_app.dart';

class CustomCategoryImage extends StatelessWidget {
  const CustomCategoryImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size:  Size.fromRadius(SizeApp.s40.r),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(SizeApp.s24.r),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          )),
    );
  }
}
