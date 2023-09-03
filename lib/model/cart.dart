import 'package:flutter/cupertino.dart';
import 'package:task_online_shop/model/product.dart';

class Cart with ChangeNotifier {
  List<Product> cartProducts = [];
  static final Cart _instance = Cart._internal();

  factory Cart() {
    return _instance;
  }

  Cart._internal();

  int totalAmount() {
    var sum = 0;
    for (var product in cartProducts) {
      sum += product.price!;
    }
    return sum;
  }

  void addToCart(Product product) {
    cartProducts.add(product);
    notifyListeners();
  }

  void clearCart() {
    cartProducts.clear();
    notifyListeners();
  }
}
