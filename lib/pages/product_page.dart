import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:task_online_shop/componets/product_item.dart';


class ProductPage extends StatelessWidget {
  final List productItems;
  const ProductPage({required this.productItems});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
        itemCount: productItems.length,
        itemBuilder: (context, index){
          return ProductItem(product: productItems[index]);
        });
  }
}
