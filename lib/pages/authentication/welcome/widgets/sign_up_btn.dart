import 'package:flutter/material.dart';

import '../../../../theme/app_colors.dart';
import '../../sign_up/sign_up_page.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: 196,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(30.0)),
        child: Center(
            child: TextButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
          },
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text("Регистрация",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold)),
          ),
        )));
  }
}
