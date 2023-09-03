import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_online_shop/pages/cart/cart_page.dart';

class AppBarDetails extends StatelessWidget {
  const AppBarDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 8,
        left: 15,
        right: 15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                "assets/arrow_back_circle.svg",
              ),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/details_cart.svg",
              ),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage())),
            )
          ],
        ));
  }
}
