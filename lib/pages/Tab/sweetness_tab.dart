import 'package:flutter/cupertino.dart';

import '../../model/Product.dart';
import '../product_page.dart';

class SweetnessTab extends StatelessWidget {

  List sweetnessItems = [
    Product(title:"Веганский шоколад" ,subtitle: "VeganSweetness", price: "130 руб", urlToImage: "assets/vegan_chocolate.jpg", category: "Сладости"),
    Product(title:"Веганское овсяное печенье" ,subtitle: "Oatmeal", price: "110 руб", urlToImage: "assets/vegan_oatmeal_cookies.jpg", category: "Сладости"),
    Product(title:"Веганский чизкейк" ,subtitle: "Vegan cheesecake", price: "110 руб", urlToImage: "assets/cheesecakes.jpg", category: "Сладости"),
    ];




  @override
  Widget build(BuildContext context) {
    return  ProductPage(productItems:sweetnessItems);
  }
}