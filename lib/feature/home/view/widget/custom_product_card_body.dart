import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      borderRadius: BorderRadius.circular(SizeApp.s8),
      child: SizedBox.fromSize(
        size: Size(SizeApp.s225, SizeApp.s360),
        child: Card(
          color: ColorApp.kButtonColor,
          child: Padding(
            padding: const EdgeInsets.all(SizeApp.s16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: SizeApp.s16,
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
                    Icon(
                      CupertinoIcons.plus_circle_fill,
                      color: Colors.white,
                      size: SizeApp.s26,
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
