import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../core/style/size_app.dart';

class CustomImageStack extends StatelessWidget {
  const CustomImageStack({super.key, required this.image, required this.onPressed});

  final String image;
  final void Function() onPressed;


  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        CachedNetworkImage(
          imageUrl: image,
          placeholder: (context, url) => SpinKitFadingCircle(
            color: Colors.grey,
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
          height: SizeApp.s200.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              CupertinoIcons.heart_fill,
              color:  Colors.red ,
              size: 35,
            )),
      ],
    );
  }
}
