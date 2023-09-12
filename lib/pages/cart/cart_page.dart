import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task_online_shop/pages/cart/widgets/body.dart';
import '../../provider/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset('assets/arrow_back_circle.svg'),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Consumer<Cart>(
          builder: (BuildContext context, Cart value, Widget? child) {
            return CartBody();
          },
        ));
  }
}
