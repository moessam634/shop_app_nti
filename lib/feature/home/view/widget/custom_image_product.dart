import 'package:flutter/material.dart';
import 'package:shopping_app/core/style/size_app.dart';

class CustomImageProduct extends StatelessWidget {
  const CustomImageProduct({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(SizeApp.s20),
      child: SizedBox.fromSize(
        size: Size(SizeApp.s150, SizeApp.s200),
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
