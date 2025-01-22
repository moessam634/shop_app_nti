import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/style/image_app.dart';
import 'package:shopping_app/core/style/size_app.dart';
import 'package:shopping_app/core/style/string_app.dart';
import 'package:shopping_app/feature/categories/view/widget/custom_category_tile.dart';
import 'package:shopping_app/feature/lap_cart_screen/view/screen/lap_cart_screen.dart';

import '../../../../core/helper/navigation_helper.dart';
import '../../../../core/style/color_app.dart';
import '../../../../core/style/text_style.dart';
import 'custom_category_image.dart';

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
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeApp.s24.r),
              side: BorderSide(width: SizeApp.s3.w),
            ),
            selectedTileColor: ColorApp.kButtonColor,
            tileColor: ColorApp.kButtonColor,
            onTap: () {
              NavigationHelper.push(
                  context: context, destination: LapCartScreen());
            },
            title: Text(
              "Laptop Screen",
              style: whiteBold16(),
            ),
            trailing: CustomCategoryImage(
                image:
                    "https://res.cloudinary.com/dzh2hde2n/image/upload/v1684434230/hsincqjvphkmfbrcoc2b.png"),
          )
        ],
      ),
    );
  }
}
