import 'package:flutter/material.dart';

InputBorder textFormFieldBorder(
    {required double radius, required Color color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(color: color),
  );
}
