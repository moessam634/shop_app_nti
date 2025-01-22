import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/feature/home/model/model/home_model.dart';
import '../../../../core/style/color_app.dart';
import '../../../../core/style/size_app.dart';
import '../../../../core/style/text_style.dart';
import 'custom_image_product.dart';
import 'custom_text_widget.dart';

class CustomProductCardBody extends StatelessWidget {
  const CustomProductCardBody({super.key, required this.homeModel});

  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(SizeApp.s8.r),
      child: SizedBox(
        width: SizeApp.s225.w,
        child: Card(
          color: ColorApp.kButtonColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeApp.s16.h, horizontal: SizeApp.s16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: SizeApp.s16.h,
              children: [
                CustomImageProduct(
                  image: homeModel.image,
                ),
                CustomTextWidget(text: homeModel.title, style: whiteBold16()),
                CustomTextWidget(
                    text: homeModel.description, style: blueGrey()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                        text: "\$ ${homeModel.price}", style: white()),
                    IconButton(
                      color: Colors.white,
                      icon: Icon(
                        CupertinoIcons.plus_circle_fill,
                        size: 30,
                      ),
                      onPressed: () {
                        // AddCartCubit.get(context)
                        //     .addCartData.addCartData(productId: productId);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
