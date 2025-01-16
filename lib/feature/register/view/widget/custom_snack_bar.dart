import 'package:flutter/material.dart';

ScaffoldFeatureController customSnackBar({
  required BuildContext context,
  required String text,
}) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
