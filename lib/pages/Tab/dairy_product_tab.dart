import 'package:flutter/cupertino.dart';
import 'package:task_online_shop/pages/product_page.dart';

import '../../model/Product.dart';

class DairyProductsTab extends StatelessWidget {

List dairyProductItems = [
  Product(title:"Миндальное молоко", subtitle: "PlantMilk", price: "89 руб", urlToImage: "assets/plant_milk.jpg",category: "Не молочная продукция"),
  Product(title:"Сыр Тофу" , subtitle: "Vegan Cheese",price: "140 руб", urlToImage: "assets/vegan_cheese.jpg", category: "Не молочная продукция"),
  Product(title:"Веганское масло" , subtitle: "Vegan butter",price: "127 руб", urlToImage: "assets/vegan_butter.jpg", category: "Не молочная продукция"),
  Product(title:"Веганский йогурт" , subtitle: "Vegan yogurt",price: "56 руб", urlToImage: "assets/vegan_yogurt.jpg", category: "Не молочная продукция"),
  Product(title:"Веганское мороженое" , subtitle: "Vegan Ice Cream",price: "99 руб", urlToImage: "assets/ice_cream.jpg", category: "Не молочная продукция"),
  Product(title:"Веганская сметана" , subtitle: "Vegan sour",price: "179 руб", urlToImage: "assets/vegan_sour_cream.jpg", category: "Не молочная продукция"),
  ];

  @override
  Widget build(BuildContext context) {
    return  ProductPage(productItems: dairyProductItems);
  }
}
