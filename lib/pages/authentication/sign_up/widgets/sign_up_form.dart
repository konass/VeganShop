import 'package:flutter/material.dart';
import 'package:task_online_shop/pages/authentication/sign_up/widgets/sign_up_btn.dart';

import 'package:task_online_shop/pages/authentication/widgets/name_form_field.dart';
import 'package:task_online_shop/pages/authentication/widgets/password_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpForm createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpForm> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
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
            SizedBox(
              height: 26.0,
            ),
            SignUpFormButton(
                formKey: formKey,
                nameController: _nameController,
                passwordController: _passwordController)
          ]),
        ));
  }
}
