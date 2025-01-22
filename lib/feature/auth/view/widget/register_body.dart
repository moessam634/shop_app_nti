import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../core/style/color_app.dart';
import '../../../../core/style/size_app.dart';
import '../../../../core/style/string_app.dart';
import '../../../../core/style/text_style.dart';
import '../../../../core/validation/auth_validator.dart';
import '../../../../core/widget/custom_auth_text_field.dart';
import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';
import 'bloc_listener.dart';
import 'custom_drop_down_form_field.dart';
import 'custom_material_button.dart';

class RegisterBody extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const RegisterBody({super.key, required this.formKey});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  bool obscure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    nameController.dispose();
    tokenController.dispose();
    idController.dispose();
    imageController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: registerBlocListener,
      builder: (context, state) {
        AuthCubit cubit = BlocProvider.of(context);
        return Form(
          key: widget.formKey,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeApp.s8.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: SizeApp.s8.h,
                  children: [
                    cubit.image == null
                        ? MaterialButton(
                            onPressed: () {
                              cubit.addImage();
                            },
                            child: const Icon(
                              Icons.camera,
                              size: 80,
                            ))
                        : Container(
                            height: SizeApp.s60.h,
                            width: SizeApp.s100.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: FileImage(cubit.image!),
                                fit: BoxFit.cover,
                              ),
                            )),
                    CustomTextFormField(
                      label: StringApp.name,
                      hintText: StringApp.enterYourName,
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(Icons.person),
                      validator: (value) {
                        return MyValidators.displayNameValidator(value);
                      },
                    ),
                    CustomTextFormField(
                      label: StringApp.email,
                      hintText: StringApp.enterYourEmail,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.email),
                      validator: (value) {
                        return MyValidators.emailValidator(value);
                      },
                    ),
                    CustomTextFormField(
                      label: StringApp.phone,
                      hintText: StringApp.enterYourPhone,
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      prefixIcon: Icon(Icons.phone_android_rounded),
                      validator: (value) {
                        return MyValidators.phoneValidator(value);
                      },
                    ),
                    CustomTextFormField(
                      label: StringApp.nationalId,
                      hintText: StringApp.enterYourId,
                      controller: idController,
                      keyboardType: TextInputType.number,
                      prefixIcon: Icon(Icons.person),
                      validator: (value) {
                        return MyValidators.nationalIdValidator(value);
                      },
                    ),
                    GenderSelection(genderController: genderController),
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
                        icon: Icon(
                          obscure
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye_fill,
                        ),
                      ),
                      obscureText: obscure,
                      validator: (value) {
                        return MyValidators.passwordValidator(value);
                      },
                    ),
                    CustomTextFormField(
                      label: StringApp.token,
                      hintText: StringApp.token,
                      controller: tokenController,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(Icons.person),
                      validator: (value) {
                        return MyValidators.displayNameValidator(value);
                      },
                    ),
                    if (state is AuthLoadingState)
                      SpinKitFadingCircle(
                        color: Colors.grey,
                        size: 30,
                      ),
                    CustomMaterialButton(
                      text: StringApp.register,
                      textStyle: whiteBold16(),
                      color: ColorApp.kButtonColor,
                      onPressed: () {
                        cubit.registerData(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          nationalId: idController.text,
                          gender: genderController.text,
                          password: passwordController.text,
                          token: tokenController.text,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
