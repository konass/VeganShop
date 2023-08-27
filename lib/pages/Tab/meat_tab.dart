import 'package:flutter/cupertino.dart';

import '../../model/Product.dart';
import '../product_page.dart';

class MeatTab extends StatelessWidget {

  List meatItems = [
    Product(title:"Веганская рыба", subtitle: "VeganFish" , price: "210 руб", urlToImage: "assets/vegan_fish.jpg", category: "Не мясо"),
    Product(title:"Веганские котлеты " ,subtitle: "VeganCutlets", price: "145 руб", urlToImage: "assets/vegan_cutlets.jpg", category: "Не мясо"),
    Product(title:"Веганские пельмени " ,subtitle: "VeganDumplings", price: "199 руб", urlToImage: "assets/vegan_dumplings.jpg", category: "Не мясо"),
    Product(title:"Веганские сосиски " ,subtitle: "Vegan sausages", price: "290 руб", urlToImage: "assets/vegan_sausages.jpg", category: "Не мясо"),
     ];




  @override
  Widget build(BuildContext context) {
    return  ProductPage(productItems: meatItems);
  }
}