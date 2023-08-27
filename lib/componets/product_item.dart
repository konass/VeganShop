import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/Product.dart';
import '../theme/AppColors.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({
  super.key,
  required this.product,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 151,
      height: 800,
      decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
        BoxShadow(
        blurRadius: 4.0,
      ),
    ],
      ),
      margin: EdgeInsets.all(10),
     // padding: EdgeInsets.all(20),
      child: Expanded(
     child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 18,),
          Container(
            width: 82,
            height:  103,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(product.urlToImage),
                  fit: BoxFit.cover,
     )
          ),
          ),
        SizedBox(height: 5,),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Text(
                    product.title,
                    style: TextStyle(
                        fontSize: 10,
                        color: AppColors.textColor,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal
                    )
                ),
                // Text(
                //     product.subtitle,
                //     style: TextStyle(
                //         fontSize: 10,
                //         color: AppColors.textColor,
                //         fontFamily: 'Montserrat',
                //         fontWeight: FontWeight.normal
                //     )
                // ),
                Text(
                    product.price,
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.textColor,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    )
                ),
                SizedBox(height: 10,)
              ]

            )
        )
        ],
     ),
      ),
    );
  }
}
