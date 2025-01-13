import 'package:flutter/material.dart';
import 'package:shopping_app/core/style/size_app.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.text,
    required this.textStyle,
    this.onPressed, required this.color,
  });

  final String text;
  final TextStyle textStyle;
  final void Function()? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16,left: 16,right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeApp.s16),
        color: color,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
