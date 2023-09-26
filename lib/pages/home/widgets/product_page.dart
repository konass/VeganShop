import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:task_online_shop/componets/product_item.dart';
import 'package:task_online_shop/model/category.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:task_online_shop/pages/details/details_page.dart';
import 'package:task_online_shop/pages/home/widgets/sort_products_by_value.dart';
import 'package:task_online_shop/provider/shared_preferences_provider.dart';

import '../../../model/product.dart';

class ProductPage extends StatelessWidget {
  final ProductCategory category;

  const ProductPage({required this.category});

  Future<List<Product>> loadProductFromJson() async {
    final String data =
        await rootBundle.rootBundle.loadString('assets/data.json');
    final Map<String, dynamic> jsonData = json.decode(data);
    List<dynamic> productList = jsonData['products'];
    return productList
        .map((product) => Product.fromJson(product))
        .toList()
        .where((product) => product.categoryId == category.id)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var prefsData = Provider.of<SharedPreferencesProvider>(context);
    return Scaffold(
        body: FutureBuilder(
            future: loadProductFromJson(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              } else if (snapshot.hasData) {
                var productList = snapshot.data as List<Product>;
                var sortedProductList = sortProductByValue(
                        productList, prefsData.getListSorting()) ??
                    productList;
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return ProductItem(
                        product: sortedProductList[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                      product: productList[index],
                                    ))),
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
