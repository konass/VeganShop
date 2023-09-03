import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_online_shop/model/product.dart';
import '../model/cart.dart';
import '../theme/app_colors.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final VoidCallback press;

  const ProductItem({
    super.key,
    required this.product,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Cart();
    return GestureDetector(
        onTap: press,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
              ),
            ],
          ),
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 12),
              Container(
                width: 69,
                height: 86,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(product.urlToImage!),
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(product.title!,
                            style: TextStyle(
                                fontSize: 10,
                                color: AppColors.textColor,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.normal)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${product.price} руб",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: AppColors.textColor,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                )),
                            IconButton(
                              icon: SvgPicture.asset(
                                "assets/cart.svg",
                              ),
                              onPressed: () => cart.addToCart(product),
                            )
                          ],
                        ),
                      ]))
            ],
          ),
        ));
  }
}
