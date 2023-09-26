import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_online_shop/componets/drop_down_items.dart';
import 'package:task_online_shop/componets/getUserIdFunction.dart';
import 'package:task_online_shop/provider/shared_preferences_provider.dart';

import '../../../../provider/cart.dart';
import '../../../home/home_page.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    var prefsData = Provider.of<SharedPreferencesProvider>(context);
    return TextButton(
        onPressed: () {
          prefsData.clearPreferences();
          prefsData.saveUserId(-1);
          cart.clearCart(-1);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Text("Пропустить",
            style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(188, 193, 189, 100),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold)));
  }
}
