import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_online_shop/data/database.dart';
import 'package:task_online_shop/pages/intro/intro_page.dart';
import 'package:task_online_shop/theme/app_colors.dart';

import 'provider/cart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHandler.initDB();
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const OnlineShop(),
    ),
  );
}

class OnlineShop extends StatelessWidget {
  const OnlineShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroPage(),
      theme: ThemeData(primaryColor: AppColors.primaryColor),
    );
  }
}
