import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task_online_shop/componets/getUserIdFunction.dart';
import 'package:task_online_shop/provider/shared_preferences_provider.dart';
import 'package:task_online_shop/theme/app_colors.dart';
import '../provider/cart.dart';
import '../pages/cart/cart_page.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    var prefsData = Provider.of<SharedPreferencesProvider>(context);
    return FutureBuilder(
        future: cart.getItemsCount(getUserId(prefsData)),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error} "));
          } else if (snapshot.hasData) {
            return IconButton(
              icon: Badge(
                label: Text(snapshot.data.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16)),
                child: SvgPicture.asset("assets/details_cart.svg"),
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage())),
            );
          } else {
            return IconButton(
              icon: Badge(
                label: Text("0",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16)),
                child: SvgPicture.asset("assets/details_cart.svg"),
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage())),
            );
          }
        });
  }
}
