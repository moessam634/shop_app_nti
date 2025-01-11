import 'package:flutter/material.dart';

class NavigationHelper {
  static Future<void> push(
      {required BuildContext context, required var destination}) async{
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => destination,
        ));
  }

  static Future<void> pushUntil(
      {required BuildContext context, required var destination}) async{
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => destination,
      ),
      (route) => false,
    );
  }

  static Future<void> pushReplacement(
      {required BuildContext context, var destination}) async {
    await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => destination,
        ));
  }
}
