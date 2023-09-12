import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task_online_shop/model/cart_model.dart';

class DatabaseHandler {
  static const int _version = 1;
  static const String _dbName = "Cart.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async =>
        await db.execute(
            "CREATE TABLE Cart (id INTEGER PRIMARY KEY, title TEXT, price INTEGER, urlToImage TEXT, quantity INTEGER );"),
        version: _version);
  }

  static Future<int> addToCart(CartModel cartModel) async {
    final db = await _getDB();
    return await db.insert("Cart", cartModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateCartItem(CartModel cartModel) async {
    final db = await _getDB();
    return await db.update("Cart", cartModel.toJson(),
        where: 'id = ?',
        whereArgs: [cartModel.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteCartItem(CartModel cartModel) async {
    final db = await _getDB();
    return await db.delete(
      "Cart",
      where: 'id = ?',
      whereArgs: [cartModel.id],
    );
  }

  static Future<List<CartModel>?> getAllCartItems() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("Cart");
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(
        maps.length, (index) => CartModel.fromJson(maps[index]));
  }

  static Future<int?> getItems() async {
    final db = await _getDB();
    int quantity = 0;
    final List<Map<String, dynamic>> maps = await db.query("Cart");
    if (maps.isEmpty) {
      return null;
    }
    var cartList =
    List.generate(maps.length, (index) => CartModel.fromJson(maps[index]));
    for (var element in cartList) {
      quantity += element.quantity - 1;
    }
    return cartList.length + quantity;
  }

  static Future<CartModel?> getCartItemById(int id) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("Cart",
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) {
      return null;
    }
    else {
      return CartModel.fromJson(maps.first);
    }
  }

  static Future<int> clearCart() async {
    final db = await _getDB();
    return await db.delete(
      "Cart",
    );
  }
}
