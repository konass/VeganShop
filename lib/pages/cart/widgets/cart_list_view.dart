import 'package:flutter/material.dart';
import 'package:task_online_shop/theme/app_colors.dart';

import '../../../model/cart.dart';
import 'cart_item.dart';

class CartListView extends StatelessWidget {
  final Cart cart;

  const CartListView({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: cart.cartProducts.isEmpty
          ? Text('Нет товаров в корзине',
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textColor,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.normal))
          : ListView.builder(
              itemCount: cart.cartProducts.length,
              itemBuilder: (context, index) {
                return CartItem(
                  product: cart.cartProducts.keys.toList()[index],
                  cartItems: cart,
                );
              }),
    );
  }
}
