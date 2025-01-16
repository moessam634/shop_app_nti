import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/style/color_app.dart';
import 'package:shopping_app/core/style/text_style.dart';
import 'package:shopping_app/core/validation/auth_validator.dart';
import 'package:shopping_app/feature/home/view/screen/home_screen.dart';
import 'package:shopping_app/feature/home/view/widget/home_screen_body.dart';
import 'package:shopping_app/feature/register/view/widget/custom_drop_down_form_field.dart';
import '../../../../core/style/size_app.dart';
import '../../../../core/style/string_app.dart';
import '../../cubit/register_cubit.dart';
import '../../cubit/register_state.dart';
import '../../../../core/widget/custom_auth_text_field.dart';
import '../widget/custom_material_button.dart';
import '../widget/custom_snack_bar.dart';
import '../widget/register_app_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    nameController.dispose();
    tokenController.dispose();
    idController.dispose();
    imageController.dispose();
    genderController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: registerAppBar(
          context: context,
          title: StringApp.register,
        ),
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              customSnackBar(context: context, text: state.userData["message"]);
            }
          },
          builder: (context, state) {
            RegisterCubit cubit = BlocProvider.of(context);
            return Form(
              key: formKey,
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              height: 80,
                              width: SizeApp.s100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: FileImage(cubit.image!),
                                  fit: BoxFit.fill,
                                ),
                              )),
                      CustomTextFormField(
                        label: "name",
                        hintText: "enter your name",
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        prefixIcon: Icon(Icons.person),
                        validator: (value) {
                          return MyValidators.displayNameValidator(value);
                        },
                      ),
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
                        label: "phone",
                        hintText: "phone",
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        prefixIcon: Icon(Icons.phone_android_rounded),
                        validator: (value) {
                          return MyValidators.phoneValidator(value);
                        },
                      ),
                      CustomTextFormField(
                        label: "national id",
                        hintText: "national id",
                        controller: idController,
                        keyboardType: TextInputType.number,
                        prefixIcon: Icon(Icons.person),
                        validator: (value) {
                          return MyValidators.nationalIdValidator(value);
                        },
                      ),
                      GenderSelection(genderController: genderController),
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
                      CustomTextFormField(
                        label: "token",
                        hintText: "token",
                        controller: tokenController,
                        keyboardType: TextInputType.text,
                        prefixIcon: Icon(Icons.person),
                        validator: (value) {
                          return MyValidators.displayNameValidator(value);
                        },
                      ),
                      CustomMaterialButton(
                        text: StringApp.register,
                        textStyle: whiteBold16(),
                        color: ColorApp.kButtonColor,
                        onPressed: () {
                          if (state is AuthSuccessState) {
                            customSnackBar(
                                context: context,
                                text: state.userData["message"]);
                          }
                          cubit.postData(
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// data:image/jpeg;base64,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
