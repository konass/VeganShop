import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../model/product.dart';
import '../../../theme/app_colors.dart';

class CartItem extends StatelessWidget {
  final Product product;

  const CartItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0x75f5f5f5)),
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
                image: AssetImage(product.urlToImage!),
                fit: BoxFit.cover,
              )),
        ),
        title: Text(product.title!,
            style: TextStyle(
                fontSize: 12,
                color: AppColors.textColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.normal)),
        subtitle: Text("${product.price} руб",
            style: TextStyle(
                fontSize: 12,
                color: AppColors.textColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
