import 'package:flutter/material.dart';
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
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String label;
  final String hintText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hintText,
        labelStyle: TextStyle(color: Colors.grey),
        floatingLabelStyle: grey(),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffix: suffix,
        border: textFormFieldBorder(radius: SizeApp.s16, color: Colors.grey),
        enabledBorder: textFormFieldBorder(
          radius: SizeApp.s16,
          color: Colors.grey,
        ),
        focusedBorder:
            textFormFieldBorder(radius: SizeApp.s16, color: Colors.black),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
