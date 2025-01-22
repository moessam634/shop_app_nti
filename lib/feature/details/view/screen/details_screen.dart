import 'package:flutter/material.dart';
import 'package:shopping_app/feature/home/model/model/home_model.dart';
import 'package:shopping_app/feature/details/view/widget/details_screen_body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.homeModel});

  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: DetailsScreenBody(
          image: homeModel.image,
          price: homeModel.price.toString(),
          title: homeModel.title,
          description: homeModel.description,
          rate: homeModel.homeRatingModel.rate.toString(),
        ));
  }
}
