import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/style/size_app.dart';
import 'package:shopping_app/core/widget/custom_app_bar.dart';
import 'package:shopping_app/feature/categories/view/widget/category_body.dart';
import 'package:shopping_app/feature/home/cubit/home_cubit.dart';
import 'package:shopping_app/feature/home/model/data/home_product_data.dart';
import 'package:shopping_app/feature/home/view/widget/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.endPoint,
  });

  final HomeProductData homeProductData = HomeProductData();
  final String endPoint;

  @override
  Widget build(BuildContext context) {
    // HomeCubit cubit = BlocProvider.of(context);
    return BlocProvider(
      create: (context) => HomeCubit(endPoint: endPoint)..getProduct(),
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.transparent,
          child: CategoryBody(),
        ),
        appBar: customAppBar(title: "cubit.title", actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: SizeApp.s16),
            child: Icon(
              CupertinoIcons.cart_badge_plus,
              size: SizeApp.s26,
              color: Colors.white,
            ),
          )
        ]),
        body: HomeScreenBody(),
      ),
    );
  }
}
