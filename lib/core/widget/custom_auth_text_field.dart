import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/style/size_app.dart';
import 'package:shopping_app/core/style/text_style.dart';
import 'package:shopping_app/core/widget/text_form_field_border.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    required this.label,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffix,
    this.keyboardType,
    this.obscureText = false,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String label;
  final String hintText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hintText,
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffix: suffix,
        border: textFormFieldBorder(radius: SizeApp.s16.r, color: Colors.grey),
        enabledBorder: textFormFieldBorder(
          radius: SizeApp.s16.r,
          color: Colors.grey,
        ),
        focusedBorder:
            textFormFieldBorder(radius: SizeApp.s16.r, color: Colors.black),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
