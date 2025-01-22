import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/style/color_app.dart';
import 'package:shopping_app/core/style/string_app.dart';
import 'package:shopping_app/feature/categories/view/widget/category_body.dart';
import 'package:shopping_app/feature/profile/cubit/profile_cubit.dart';
import 'package:shopping_app/feature/profile/view/screen/profile_drawer.dart';
import '../../../../core/widget/custom_app_bar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final int index;
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileCubit(),
      child: Scaffold(
        appBar: customAppBar(title: StringApp.categories),
        // bottomNavigationBar: CurvedNavigationBar(
        //   color: ColorApp.kButtonColor,
        //   items: [
        //     Icon(
        //       Icons.category_outlined,
        //       size: 30,
        //       color: Colors.white,
        //     ),
        //     Icon(
        //       Icons.laptop_mac_sharp,
        //       size: 30,
        //       color: Colors.white,
        //     ),
        //     Icon(
        //       CupertinoIcons.cart_badge_plus,
        //       size: 30,
        //       color: Colors.white,
        //     ),
        //   ],
        //   onTap: (value) {},
        //   backgroundColor: Colors.white,
        // ),
        drawer: ProfileDrawer(),
        body: CategoryBody(),
      ),
    );
  }
}
