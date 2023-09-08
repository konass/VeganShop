import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/cart.dart';
import '../../../model/product.dart';
import '../../../theme/app_colors.dart';

class PlusMinusButton extends StatelessWidget {
  final Product product;

  const PlusMinusButton({Key? key, required this.product}) : super(key: key);

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
            onPressed: () => cart.removeFromCart(product),
            icon: Icon(Icons.remove),
            color: AppColors.textColor,
          ),
          Text("${cart.cartProducts[product]}",
              style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textColor,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold)),
          IconButton(
            onPressed: () => cart.addToCart(product),
            icon: Icon(Icons.add),
            color: AppColors.textColor,
          ),
        ],
      ),
    );
  }
}
