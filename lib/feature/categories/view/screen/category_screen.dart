import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileCubit(),
      child: Scaffold(
        appBar: customAppBar(title: StringApp.categories),
        drawer: ProfileDrawer(),
        body: CategoryBody(),
      ),
    );
  }
}
