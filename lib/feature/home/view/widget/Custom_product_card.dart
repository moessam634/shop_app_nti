import 'package:flutter/material.dart';
import 'package:shopping_app/feature/home/model/model/home_model.dart';
import 'package:shopping_app/feature/details/view/screen/details_screen.dart';
import 'package:shopping_app/feature/home/view/widget/custom_product_card_body.dart';
import '../../../../core/helper/navigation_helper.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
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
      child: CustomProductCardBody(homeModel: homeModel),
    );
  }
}
