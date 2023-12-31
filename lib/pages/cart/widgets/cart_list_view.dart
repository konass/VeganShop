import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_online_shop/model/cart_model.dart';
import 'package:task_online_shop/theme/app_colors.dart';
import '../../../componets/getUserIdFunction.dart';
import '../../../provider/cart.dart';
import '../../../provider/shared_preferences_provider.dart';
import 'cart_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final prefsData = Provider.of<SharedPreferencesProvider>(context);
    return FutureBuilder(
        future: cart.getCart(getUserId(prefsData)),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error} "));
          } else if (snapshot.hasData) {
            var cartItems = snapshot.data as List<CartModel>;
            return Expanded(
              child: cartItems.isEmpty
                  ? Text('Нет товаров в корзине',
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textColor,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal))
                  : ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          cartModel: cartItems[index],
                        );
                      }),
            );
          } else {
            return Text('Нет товаров в корзине',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.normal));
          }
        });
  }
}
