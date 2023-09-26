import 'package:flutter/cupertino.dart';
import 'package:task_online_shop/data/database.dart';
import 'package:task_online_shop/model/cart_model.dart';

class Cart with ChangeNotifier {
  final Map<int, CartModel> _cartProducts = {};

  Map<int, CartModel> get cartProducts => _cartProducts;

  static final Cart _instance = Cart._internal();

  factory Cart() {
    return _instance;
  }

  Cart._internal();

  Future<int?> getItemsCount(int userId) async {
    var items = await DatabaseHandler.getItemsCount(userId);
    if (items != 0) {
      return items;
    } else {
      return 0;
    }
  }

  Future<CartModel?> getCartById(int id, int userId) async {
    final cartItem = await DatabaseHandler.getCartItemById(id, userId);
    return cartItem;
  }

  Future<List<CartModel>> getCart(int userId) async {
    final cart = await DatabaseHandler.getUserCartItems(userId);
    for (var item in cart) {
      _cartProducts.putIfAbsent(item.id, () => item);
    }
    return cart;
  }

  Future<int> totalAmount(int userId) async {
    final cart = await DatabaseHandler.getUserCartItems(userId);
    final sum = cart.fold(
        0,
        (previousValue, element) =>
            previousValue + element.price * element.quantity);
    return sum;
  }

  bool isInCart(id) => _cartProducts.containsKey(id);

  void addToCart(CartModel cartModel) async {
    if (isInCart(cartModel.id)) {
      _cartProducts.putIfAbsent(cartModel.id, () => cartModel);
      final updatedCart =
          CartModel.updateQuantity(cartModel, cartModel.quantity + 1);
      _cartProducts.update(cartModel.id, (cartModel) => updatedCart);
      notifyListeners();
      await DatabaseHandler.updateCartItem(updatedCart);
    } else {
      await DatabaseHandler.addToCart(cartModel);
      _cartProducts.putIfAbsent(cartModel.id, () => cartModel);
    }
    notifyListeners();
  }

  void removeFromCart(CartModel cartModel) async {
    var cartItem = _cartProducts[cartModel.id];
    if ((isInCart(cartModel.id)) && (cartItem!.quantity > 1)) {
      final updatedCart =
          CartModel.updateQuantity(cartModel, cartModel.quantity - 1);
      _cartProducts.update(cartModel.id, (cartModel) => updatedCart);
      notifyListeners();
      await DatabaseHandler.updateCartItem(updatedCart);
    }
    if ((isInCart(cartModel.id)) && (cartItem!.quantity == 1)) {
      _cartProducts.remove(cartModel.id);
      await DatabaseHandler.deleteCartItem(cartModel);
    }
    notifyListeners();
  }

  void clearCart(int userId) async {
    _cartProducts.clear();
    await DatabaseHandler.clearCart(userId);
    notifyListeners();
  }
}
