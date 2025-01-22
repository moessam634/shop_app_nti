import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/helper/navigation_helper.dart';
import 'package:shopping_app/core/style/size_app.dart';
import 'package:shopping_app/core/style/text_style.dart';
import 'package:shopping_app/feature/categories/view/widget/custom_category_image.dart';
import 'package:shopping_app/feature/home/view/screen/home_screen.dart';
import '../../../../core/style/color_app.dart';

class CustomCategoryTile extends StatelessWidget {
  const CustomCategoryTile(
      {super.key,
      required this.title,
      required this.endPoint,
      required this.image});

  final String title;
  final String endPoint;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeApp.s24.r),
        side: BorderSide(width: SizeApp.s3.w),
      ),
      selectedTileColor: ColorApp.kButtonColor,
      tileColor: ColorApp.kButtonColor,
      onTap: () {
        NavigationHelper.push(
            context: context, destination: HomeScreen(endPoint: endPoint));
      },
      title: Text(
        title,
        style: whiteBold16(),
      ),
      trailing: CustomCategoryImage(image: image),
    );
  }
}
