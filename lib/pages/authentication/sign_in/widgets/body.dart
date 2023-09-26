import 'package:flutter/material.dart';
import 'package:task_online_shop/pages/authentication/sign_in/widgets/sign_in_form.dart';

import '../../../../theme/app_colors.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 16),
                  child: Text("Вход",
                      style: TextStyle(
                          fontSize: 32,
                          color: AppColors.textColor,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SignInForm()
            ])));
  }
}
