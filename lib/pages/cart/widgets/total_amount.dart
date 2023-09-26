import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:task_online_shop/componets/getUserIdFunction.dart';
import 'package:task_online_shop/provider/shared_preferences_provider.dart';

import '../../../provider/cart.dart';
import '../../../theme/app_colors.dart';

class TotalAmount extends StatelessWidget {
  const TotalAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final prefsData = Provider.of<SharedPreferencesProvider>(context);
    return FutureBuilder(
        future: cart.totalAmount(getUserId(prefsData)),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error} "));
          } else if (snapshot.hasData) {
            return Text(("Итого: ${snapshot.data}"),
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold));
          } else {
            return Text(("Итого: 0"),
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold));
          }
        });
  }
}
