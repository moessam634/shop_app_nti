import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/style/size_app.dart';
import 'package:shopping_app/core/widget/custom_app_bar.dart';
import 'package:shopping_app/feature/categories/view/widget/category_body.dart';
import 'package:shopping_app/feature/home/cubit/home_cubit.dart';
import 'package:shopping_app/feature/home/cubit/home_state.dart';
import 'package:shopping_app/feature/home/view/widget/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.endPoint,
  });

  final String endPoint;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(endPoint: endPoint)..getProduct(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          HomeCubit homeCubit = BlocProvider.of(context);
          return Scaffold(
            drawer: Drawer(
              backgroundColor:
                  Colors.transparent.withAlpha(SizeApp.s50.toInt()),
              child: CategoryBody(),
            ),
            appBar: customAppBar(title: homeCubit.endPoint, actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizeApp.s16),
                child: Icon(
                  CupertinoIcons.cart_badge_plus,
                  size: SizeApp.s26,
                  color: Colors.white,
                ),
              )
            ]),
            body: HomeScreenBody(
              state: state,
            ),
          );
        },
      ),
    );
  }
}
