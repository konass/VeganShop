import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/cart_model.dart';
import '../../../provider/cart.dart';
import '../../../model/product.dart';
import '../../../theme/app_colors.dart';

class PlusMinusButton extends StatelessWidget {
  final CartModel cartModel;

  const PlusMinusButton({Key? key, required this.cartModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0), color: Colors.white),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => cart.removeFromCart(cartModel),
            icon: Icon(Icons.remove),
            color: AppColors.textColor,
          ),
          Text("${cartModel.quantity}",
              style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textColor,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold)),
          IconButton(
            onPressed: () => cart.addToCart(cartModel),
            icon: Icon(Icons.add),
            color: AppColors.textColor,
          ),
        ],
      ),
    );
  }
}
