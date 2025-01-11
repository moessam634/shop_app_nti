// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopping_app/core/style/size_app.dart';

import '../../../../core/style/color_app.dart';

class CustomImageCard extends StatelessWidget {
  const CustomImageCard({super.key, required this.image});

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

// CachedNetworkImage(
// imageUrl: image,
// fit: BoxFit.cover,
// placeholder: (context, url) =>
// SpinKitFadingCircle(color: ColorApp.kButtonColor),
// errorWidget: (context, url, error) => Icon(Icons.error),
// ),