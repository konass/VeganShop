import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task_online_shop/theme/app_colors.dart';
import '../model/cart.dart';
import '../pages/cart/cart_page.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return IconButton(
      icon: Badge(
        label: Text(cart.items.toString(),
            textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
        child: SvgPicture.asset("assets/details_cart.svg"),
        backgroundColor: AppColors.primaryColor,
      ),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => CartPage())),
    );
  }
}
