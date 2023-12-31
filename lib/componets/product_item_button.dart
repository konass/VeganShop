import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task_online_shop/componets/getUserIdFunction.dart';
import 'package:task_online_shop/provider/shared_preferences_provider.dart';
import '../model/cart_model.dart';
import '../model/product.dart';
import '../provider/cart.dart';

class ProductItemButton extends StatelessWidget {
  final Product product;

  const ProductItemButton(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final prefsData = Provider.of<SharedPreferencesProvider>(context);
    var userId = getUserId(prefsData);
    return FutureBuilder(
        future: cart.getCartById(product.id!, userId),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error} "));
          } else if (snapshot.hasData) {
            return IconButton(
              icon: SvgPicture.asset(
                "assets/cart.svg",
              ),
              onPressed: () => cart.addToCart(snapshot.data),
            );
          } else {
            return IconButton(
              icon: SvgPicture.asset(
                "assets/cart.svg",
              ),
              onPressed: () => cart.addToCart(CartModel(
                  id: product.id!,
                  title: product.title!,
                  price: product.price!,
                  urlToImage: product.urlToImage!,
                  quantity: 1,
                  userId: userId)),
            );
          }
        });
  }
}
