import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopping_app/core/style/size_app.dart';

class CustomImageProduct extends StatelessWidget {
  const CustomImageProduct({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(SizeApp.s20.r),
      child: SizedBox.fromSize(
        size: Size(SizeApp.s150.w, SizeApp.s200.h),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
          placeholder: (context, url) => SpinKitFadingCircle(color: Colors.grey),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}