import 'package:flutter/material.dart';
import 'package:shopping_app/core/style/image_app.dart';
import 'package:shopping_app/core/style/size_app.dart';
import 'package:shopping_app/core/style/text_style.dart';
import 'package:shopping_app/feature/home/model/model/home_model.dart';
import 'package:shopping_app/feature/home/view/widget/custom_text_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.homeModel});

  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.5,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(SizeApp.s24)),
                child: Image.network(
                  ImageApp.jewelryImage,
                  fit: BoxFit.cover,
                )),
          ),
          CustomTextWidget(text: "\$ ${homeModel.price}", style: whiteBold16()),
          Row(
            children: [
              CustomTextWidget(text: homeModel.title, style: whiteBold16()),
              CustomTextWidget(
                text: homeModel.homeRatingModel.rate.toString(),
                style: whiteBold16(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
