import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class PasswordFormField extends StatelessWidget {
  final TextEditingController passwordController;

  const PasswordFormField({Key? key, required this.passwordController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.formBackgroundColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
                obscureText: true,
                controller: passwordController,
                cursorColor: AppColors.formTextColor,
                decoration: InputDecoration(
                  hintText: "Введите пароль",
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                      color: AppColors.formTextColor,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
                validator: (value) {
                  if ((value == null) || (value.isEmpty)) {
                    return 'Введите пароль';
                  }
                  return null;
                })),
      ),
    );
  }
}
