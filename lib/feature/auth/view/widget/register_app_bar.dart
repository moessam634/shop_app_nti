import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/style/text_style.dart';
import '../../../../core/style/color_app.dart';

AppBar registerAppBar({required String title, required BuildContext context}) {
  return AppBar(
    backgroundColor: ColorApp.kButtonColor,
    elevation: 0.0,
    title: Text(
      title,
      style: white(),
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        CupertinoIcons.back,
      ),
      color: Colors.white,
    ),
  );
}
