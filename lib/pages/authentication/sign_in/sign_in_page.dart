import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_online_shop/pages/authentication/sign_in/widgets/body.dart';
import 'package:task_online_shop/pages/authentication/welcome/welcome_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset('assets/arrow_back_circle.svg'),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => WelcomePage()));
            },
          ),
        ),
        body: SafeArea(
          child: SignInBody(),
        ));
  }
}
