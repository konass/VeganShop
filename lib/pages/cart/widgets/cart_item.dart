import 'package:flutter/material.dart';
import 'package:task_online_shop/pages/cart/widgets/plus_minus_button.dart';
import '../../../model/cart_model.dart';
import '../../../provider/cart.dart';
import '../../../model/product.dart';
import '../../../theme/app_colors.dart';

class CartItem extends StatelessWidget {
  final CartModel cartModel;

  const CartItem({
    Key? key,
    required this.cartModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0xfff5f5f5)),
      margin: EdgeInsets.only(bottom: 14),
      padding: EdgeInsets.only(left: 5, right: 5),
      child: ListTile(
        contentPadding: EdgeInsets.all(5),
        leading: Container(
          width: 45,
          height: 57,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(cartModel.urlToImage),
                fit: BoxFit.cover,
              )),
        ),
        title: Text(cartModel.title,
            style: TextStyle(
                fontSize: 12,
                color: AppColors.textColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.normal)),
        subtitle: Text("${cartModel.price} руб",
            style: TextStyle(
                fontSize: 12,
                color: AppColors.textColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold)),
        trailing: PlusMinusButton(
          cartModel: cartModel,
        ),
      ),
    );
  }
}
