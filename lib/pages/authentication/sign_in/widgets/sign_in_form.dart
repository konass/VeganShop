import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_online_shop/pages/authentication/sign_in/widgets/sign_in_btn.dart';
import 'package:task_online_shop/pages/authentication/widgets/name_form_field.dart';
import 'package:task_online_shop/pages/authentication/widgets/password_form_field.dart';
import '../../../../provider/shared_preferences_provider.dart';
import '../../../../provider/user_provider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInForm createState() => _SignInForm();
}

class _SignInForm extends State<SignInForm> {
  late TextEditingController _passwordController = TextEditingController();
  late TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(children: [
            NameFormField(nameController: _nameController),
            SizedBox(
              height: 26.0,
            ),
            PasswordFormField(passwordController: _passwordController),
            SizedBox(height: 20),
            SignInFormButton(
                formKey: formKey,
                nameController: _nameController,
                passwordController: _passwordController)
          ]),
        ));
  }
}
