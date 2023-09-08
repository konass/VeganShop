import 'package:flutter/material.dart';
import 'package:task_online_shop/pages/cart/widgets/cart_button.dart';
import 'package:task_online_shop/pages/cart/widgets/cart_list_view.dart';
import '../../../model/cart.dart';
import '../../../theme/app_colors.dart';

class CartBody extends StatelessWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Cart();
    final int totalAmount = cart.totalAmount();
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(
            left: size.width / 10, right: size.width / 10, top: 10),
        padding: EdgeInsets.only(bottom: size.height * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Корзина",
                style: TextStyle(
                    fontSize: 32,
                    color: AppColors.textColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            CartListView(cart: cart),
            Divider(),
            Align(
              alignment: Alignment.centerRight,
              child: Text(("Итого: ${totalAmount}"),
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textColor,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold)),
            ),
            CartButton(),
            SizedBox(
              height: 20,
            )
          ],
        ));
  }
}
