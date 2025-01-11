import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/style/color_app.dart';
import 'package:shopping_app/core/style/size_app.dart';
import 'package:shopping_app/core/style/text_style.dart';
import 'package:shopping_app/feature/home/model/model/home_model.dart';
import 'package:shopping_app/feature/home/view/screen/details_screen.dart';
import 'package:shopping_app/feature/home/view/widget/custom_text_widget.dart';
import '../../../../core/helper/navigation_helper.dart';
import 'custom_image_card.dart';

class CardBuilder extends StatelessWidget {
  const CardBuilder({
    super.key,
    required this.homeModel,
  });

  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationHelper.push(
            context: context, destination: DetailsScreen(homeModel: homeModel));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(SizeApp.s8),
        child: SizedBox.fromSize(
          size: Size(SizeApp.s225, SizeApp.s325),
          child: Card(
            color: ColorApp.kButtonColor,
            child: Padding(
              padding: const EdgeInsets.all(SizeApp.s16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: SizeApp.s16,
                children: [
                  CustomImageCard(
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
      ),
    );
  }
}
