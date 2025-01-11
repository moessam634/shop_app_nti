import 'package:flutter/material.dart';
import 'package:shopping_app/core/style/string_app.dart';
import 'package:shopping_app/feature/categories/view/widget/category_body.dart';
import '../../../../core/widget/custom_app_bar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: StringApp.categories),
      body: CategoryBody(),
    );
  }
}
