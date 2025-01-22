import 'package:flutter/material.dart';

ScaffoldFeatureController customSnackBar({
  required BuildContext context,
  required String text,
  Color? backgroundColor
}) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: backgroundColor,
    ),
  );
}
