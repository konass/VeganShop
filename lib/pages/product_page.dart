import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_online_shop/componets/product_item.dart';
import 'package:task_online_shop/model/category.dart';
import 'package:flutter/services.dart' as rootBundle;

import '../model/product.dart';

class ProductPage extends StatelessWidget {
  final ProductCategory category;

  const ProductPage({required this.category});

  Future<List<Product>> loadProductFromJson() async {
    final String data =
        await rootBundle.rootBundle.loadString('assets/data.json');
    final Map<String, dynamic> jsonData = json.decode(data);
    List<dynamic> productList = jsonData['products'];
    return productList.map((product) => Product.fromJson(product)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: loadProductFromJson(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              } else if (snapshot.hasData) {
                var productList = snapshot.data as List<Product>;
                List<Product> productListByCategory = productList
                    .where((product) => product.categoryId == category.id)
                    .toList();
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: productListByCategory.length,
                    itemBuilder: (context, index) {
                      return ProductItem(product: productListByCategory[index]);
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
