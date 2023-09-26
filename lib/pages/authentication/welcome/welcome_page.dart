import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:task_online_shop/pages/authentication/welcome/widgets/auth_btn.dart';

import '../../../theme/app_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: const Text('Добро пожаловать!',
                          style: TextStyle(
                              fontSize: 36,
                              color: AppColors.textColor,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold)),
                    )),
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    AuthButton()
                  ]),
            )));
  }
}
