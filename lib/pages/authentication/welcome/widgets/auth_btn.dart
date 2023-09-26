import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_online_shop/pages/authentication/welcome/widgets/sign_in_btn.dart';
import 'package:task_online_shop/pages/authentication/welcome/widgets/sign_up_btn.dart';
import 'package:task_online_shop/pages/authentication/welcome/widgets/skip_btn.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SignUpButton(),
      SizedBox(
        height: 20,
      ),
      SignInButton(),
      SizedBox(
        height: 20,
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: SkipButton(),
      )
    ]);
  }
}
