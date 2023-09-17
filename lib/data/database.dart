import 'package:sqflite/sqflite.dart';

import 'package:task_online_shop/model/cart_model.dart';

class DatabaseHandler {
  static const int _version = 1;
  static const String _dbName = "Cart.db";
  static const String _tableName = "Cart";
  static Database? db;

  static Future<void> initDB() async {
    if (db != null) {
      return;
    }
    try {
      String path = await getDatabasesPath() + _dbName;
      db = await openDatabase(path, version: _version, onCreate: onCreateDb);
    } catch (ex) {
      print(ex);
    }
  }

  static void onCreateDb(Database db, int version) async => await db.execute(
      "CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, title TEXT, price INTEGER, urlToImage TEXT, quantity INTEGER );");

  static Future<int> addToCart(CartModel cartModel) async {
    return await db!.insert(_tableName, cartModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateCartItem(CartModel cartModel) async {
    return await db!.update(_tableName, cartModel.toJson(),
        where: 'id = ?',
        whereArgs: [cartModel.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteCartItem(CartModel cartModel) async {
    return await db!.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [cartModel.id],
    );
  }

  static Future<List<CartModel>> getAllCartItems() async {
    final List<Map<String, dynamic>> maps = await db!.query(_tableName);
    return List.generate(
        maps.length, (index) => CartModel.fromJson(maps[index]));
  }

  static Future<int?> getItemsCount() async {
    var result = await db!.rawQuery('SELECT SUM(quantity) FROM $_tableName');
    if (result.isNotEmpty) {
      return Sqflite.firstIntValue(result);
    } else {
      return 0;
    }
  }

  static Future<CartModel?> getCartItemById(int id) async {
    final List<Map<String, dynamic>> maps = await db!.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) {
      return null;
    } else {
      return CartModel.fromJson(maps.first);
    }
  }

  static Future<int> clearCart() async {
    return await db!.delete(
      _tableName,
    );
  }
}
