import 'package:flutter/material.dart';
import 'package:shopping_app/feature/auth/view/widget/login_body.dart';
import '../../../../core/style/color_app.dart';
import '../../../../core/style/string_app.dart';
import '../../../../core/style/text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringApp.login,
          style: white(),
        ),
        centerTitle: true,
        backgroundColor: ColorApp.kButtonColor,
      ),
      body: LoginBody(
        passwordController: passwordController,
        emailController: emailController,
        formKey: formKey,
      ),
    );
  }
}
