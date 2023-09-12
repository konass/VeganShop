import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/cart.dart';
import '../../../theme/app_colors.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        if (context.read<Cart>().cartProducts.isNotEmpty) {
          context.read<Cart>().clearCart();
          final snackBar = SnackBar(content: Text("Успешно"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Text("купить",
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold)),
      ),
      style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          foregroundColor: Colors.white,
          elevation: 2,
          backgroundColor: AppColors.primaryColor),
    ));
  }
}
