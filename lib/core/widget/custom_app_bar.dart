import 'package:flutter/material.dart';
import 'package:shopping_app/core/style/size_app.dart';
import '../style/color_app.dart';
import '../style/text_style.dart';

AppBar customAppBar({required String title, List<Widget>? actions}) {
  return AppBar(
    backgroundColor: ColorApp.kButtonColor,
    elevation: 0,
    title: Text(
      title,
      style: white(),
    ),
    centerTitle: true,
    actions: actions,
    iconTheme: IconThemeData(color: Colors.white, size: SizeApp.s26),
  );
}
