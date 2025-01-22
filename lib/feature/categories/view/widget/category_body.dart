import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/style/image_app.dart';
import 'package:shopping_app/core/style/size_app.dart';
import 'package:shopping_app/core/style/string_app.dart';
import 'package:shopping_app/feature/categories/view/widget/custom_category_tile.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeApp.s16.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: SizeApp.s24.h,
        children: [
          CustomCategoryTile(
            title: StringApp.electronics,
            endPoint: StringApp.electronicsEndPoint,
            image: ImageApp.jewelryImage,
          ),
          CustomCategoryTile(
            title: StringApp.jewelry,
            endPoint: StringApp.jewelryEndPoint,
            image: ImageApp.jewelryImage,
          ),
          CustomCategoryTile(
            title: StringApp.men,
            endPoint: StringApp.menEndPoint,
            image: ImageApp.jewelryImage,
          ),
          CustomCategoryTile(
            title: StringApp.women,
            endPoint: StringApp.womenEndPoint,
            image: ImageApp.jewelryImage,
          ),
        ],
      ),
    );
  }
}
