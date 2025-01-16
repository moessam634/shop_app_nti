import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopping_app/core/helper/navigation_helper.dart';
import 'package:shopping_app/feature/categories/view/screen/category_screen.dart';
import 'package:shopping_app/feature/login/cubit/login_cubit.dart';
import 'package:shopping_app/feature/login/cubit/login_state.dart';
import '../../../../core/style/color_app.dart';
import '../../../../core/style/string_app.dart';
import '../../../../core/style/text_style.dart';
import '../../../../core/validation/auth_validator.dart';
import '../../../../core/widget/custom_auth_text_field.dart';
import '../../../register/view/widget/custom_material_button.dart';
import '../../../register/view/widget/custom_snack_bar.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Login",
            style: white(),
          ),
          centerTitle: true,
          backgroundColor: ColorApp.kButtonColor,
        ),
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              if (state.userData["status"]=="success") {
                customSnackBar(
                    context: context, text: state.userData["message"]);
                NavigationHelper.pushUntil(
                  context: context,
                  destination: CategoryScreen(),
                );
              }
              if (state.userData["status"]=="error") {
                customSnackBar(
                  context: context,
                  text: state.userData["message"],
                );
              }
            }
          },
          builder: (context, state) {
            LoginCubit cubit = BlocProvider.of(context);
            return Form(
              key: formKey,
              child: Column(
                spacing: 16.h,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    label: "email",
                    hintText: "email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.email),
                    validator: (value) {
                      return MyValidators.emailValidator(value);
                    },
                  ),
                  CustomTextFormField(
                    label: "password",
                    hintText: "password",
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: Icon(Icons.person),
                    validator: (value) {
                      return MyValidators.passwordValidator(value);
                    },
                  ),
                  if (state is LoginLoadingState)
                    SpinKitRing(color: Colors.grey),
                  CustomMaterialButton(
                    text: StringApp.register,
                    textStyle: whiteBold16(),
                    color: ColorApp.kButtonColor,
                    onPressed: () {
                      cubit.loginCubit(
                          email: emailController.text,
                          password: passwordController.text);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
