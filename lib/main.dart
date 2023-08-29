import 'package:flutter/material.dart';
import 'package:task_online_shop/pages/intro_page.dart';
import 'package:task_online_shop/theme/app_colors.dart';


void main() => runApp(const OnlineShop ());
class OnlineShop extends StatelessWidget {
  const OnlineShop ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroPage(),
      theme: ThemeData(primaryColor: AppColors.primaryColor),
    );
  }
}
