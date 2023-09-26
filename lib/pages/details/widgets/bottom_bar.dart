import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_online_shop/componets/getUserIdFunction.dart';
import '../../../model/cart_model.dart';
import '../../../model/user.dart';
import '../../../provider/cart.dart';
import '../../../model/product.dart';
import '../../../provider/shared_preferences_provider.dart';
import '../../../theme/app_colors.dart';

class BottomBarDetails extends StatelessWidget {
  final Product product;

  const BottomBarDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prefsData = Provider.of<SharedPreferencesProvider>(context);
    final cart = Cart();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("${product.price} руб",
            style: TextStyle(
                fontSize: 20,
                color: AppColors.textColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: () => cart.addToCart(CartModel(
              id: product.id!,
              title: product.title!,
              price: product.price!,
              urlToImage: product.urlToImage!,
              quantity: 1,
              userId: getUserId(prefsData))),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text("в корзину",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold)),
          ),
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              foregroundColor: Colors.white,
              elevation: 2,
              backgroundColor: AppColors.primaryColor),
        )
      ],
    );
  }
}
