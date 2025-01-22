import 'package:flutter/material.dart';
import 'package:shopping_app/feature/auth/view/screen/login_screen.dart';
import '../../../../core/helper/navigation_helper.dart';
import '../../../categories/view/screen/category_screen.dart';
import '../../cubit/auth_state.dart';
import 'custom_snack_bar.dart';

void blocListener(context, state) {
  if (state is AuthSuccessState) {
    if (state.userData["status"] == "success") {
      customSnackBar(
          context: context,
          text: state.userData["message"],
          backgroundColor: Colors.green);
      NavigationHelper.pushUntil(
          context: context, destination: CategoryScreen());
    }
    if (state.userData["status"] == "error") {
      customSnackBar(
          context: context,
          text: state.userData["message"],
          backgroundColor: Colors.red);
    }
  }
}

void registerBlocListener(context, state) {
  if (state is AuthSuccessState) {
    if (state.userData["status"] == "success") {
      customSnackBar(
          context: context,
          text: state.userData["message"],
          backgroundColor: Colors.green);
      NavigationHelper.pushUntil(context: context, destination: LoginScreen());
    }
    if (state.userData["status"] == "error") {
      customSnackBar(
          context: context,
          text: state.userData["message"],
          backgroundColor: Colors.red);
    }
  }
}
