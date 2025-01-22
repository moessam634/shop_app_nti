import 'package:flutter/material.dart';
import 'package:shopping_app/feature/auth/view/widget/register_body.dart';
import '../../../../core/style/string_app.dart';
import '../widget/register_app_bar.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: registerAppBar(
        context: context,
        title: StringApp.register,
      ),
      body: RegisterBody(formKey: formKey),
    );
  }
}
