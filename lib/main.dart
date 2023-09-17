import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_online_shop/data/database.dart';
import 'package:task_online_shop/pages/intro/intro_page.dart';
import 'package:task_online_shop/provider/shared_preferences_provider.dart';
import 'package:task_online_shop/theme/app_colors.dart';

import 'provider/cart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHandler.initDB();
  runApp(OnlineShop());
}

class OnlineShop extends StatelessWidget {
  const OnlineShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(
            create: (context) => SharedPreferencesProvider()),
      ],
      child: MaterialApp(
        home: IntroPage(),
        theme: ThemeData(primaryColor: AppColors.primaryColor),
      ),
    );
  }
}
