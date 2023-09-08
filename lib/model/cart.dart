import 'package:flutter/cupertino.dart';
import 'package:task_online_shop/model/product.dart';

class Cart with ChangeNotifier {
  final Map<Product, int> _cartProducts = {};

  Map<Product, int> get cartProducts => _cartProducts;
  int _items = 0;
  static final Cart _instance = Cart._internal();

  factory Cart() {
    return _instance;
  }

  Cart._internal();

  int get items => _items;

  int totalAmount() {
    var sum = 0;
    for (var product in _cartProducts.keys) {
      sum += (product.price!) * _cartProducts[product]!;
    }
    return sum;
  }

  void addToCart(Product product) {
    _items++;

    if (_cartProducts.containsKey(product)) {
      _cartProducts[product] = _cartProducts[product]! + 1;
    } else {
      _cartProducts[product] = 1;
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    if (_cartProducts[product]! > 0) {
      _cartProducts[product] = _cartProducts[product]! - 1;
      _items--;
    }
    if (_cartProducts[product]! == 0) {
      _cartProducts.remove(product);
    }
    notifyListeners();
  }

  void clearCart() {
    _items = 0;
    _cartProducts.clear();
    notifyListeners();
  }
}
