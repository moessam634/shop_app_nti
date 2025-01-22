import 'package:flutter/material.dart';

class CustomProfileListTile extends StatelessWidget {
  const CustomProfileListTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon});

  final String title;
  final String subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}
