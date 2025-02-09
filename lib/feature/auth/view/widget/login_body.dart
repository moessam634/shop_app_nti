import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../core/helper/navigation_helper.dart';
import '../../../../core/style/color_app.dart';
import '../../../../core/style/size_app.dart';
import '../../../../core/style/string_app.dart';
import '../../../../core/style/text_style.dart';
import '../../../../core/validation/auth_validator.dart';
import '../../../../core/widget/custom_auth_text_field.dart';
import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';
import '../screen/register_screen.dart';
import 'bloc_listener.dart';
import 'custom_material_button.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
    // required this.passwordController,
    // required this.emailController,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: loginBlocListener,
      builder: (context, state) {
        AuthCubit cubit = BlocProvider.of(context);
        return Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeApp.s8.w),
                child: Column(
                  spacing: SizeApp.s16.h,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      label: StringApp.email,
                      hintText: StringApp.email,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.email),
                      validator: (value) {
                        return MyValidators.emailValidator(value);
                      },
                    ),
                    CustomTextFormField(
                      label: StringApp.password,
                      hintText: StringApp.password,
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          icon: obscure
                              ? Icon(CupertinoIcons.eye_slash)
                              : Icon(CupertinoIcons.eye)),
                      obscureText: obscure,
                      validator: (value) {
                        return MyValidators.passwordValidator(value);
                      },
                    ),
                    state is AuthLoadingState
                        ? SpinKitFadingCircle(
                            color: Colors.grey,
                            size: 35,
                          )
                        : CustomMaterialButton(
                            text: StringApp.login,
                            textStyle: whiteBold12(),
                            color: ColorApp.kButtonColor,
                            onPressed: () {
                              cubit.loginCubit(
                                  email: emailController.text,
                                  password: passwordController.text);
                            },
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringApp.doNotHaveAcc,
                          style: black18(),
                        ),
                        TextButton(
                            onPressed: () {
                              NavigationHelper.push(
                                  context: context,
                                  destination: RegisterScreen());
                            },
                            child: Text(
                              StringApp.registerNow,
                              style: norm16(),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
