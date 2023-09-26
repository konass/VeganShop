import 'package:sqflite/sqflite.dart';

import 'package:task_online_shop/model/cart_model.dart';

import '../model/user.dart';

class DatabaseHandler {
  static const int _version = 1;
  static const String _dbName = "Plant.db";
  static const String _cartTable = "Cart";
  static const String _userTable = "User";
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

  static void onCreateDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $_cartTable (id INTEGER PRIMARY KEY, title TEXT, price INTEGER, urlToImage TEXT, quantity INTEGER , userId INTEGER);");
    await db.execute(
        "CREATE TABLE $_userTable (id INTEGER PRIMARY KEY, name TEXT, password TEXT );");
  }

  static Future<int> addNewUser(User user) async {
    return await db!.insert(_userTable, user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> addToCart(CartModel cartModel) async {
    return await db!.insert(_cartTable, cartModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateCartItem(CartModel cartModel) async {
    return await db!.update(_cartTable, cartModel.toJson(),
        where: 'id = ?',
        whereArgs: [cartModel.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteCartItem(CartModel cartModel) async {
    return await db!.delete(
      _cartTable,
      where: 'id = ?',
      whereArgs: [cartModel.id],
    );
  }

  static Future<List<CartModel>> getUserCartItems(int userId) async {
    final List<Map<String, dynamic>> maps = await db!.query(
      _cartTable,
      where: 'userId = ?',
      whereArgs: [userId],
    );
    return List.generate(
        maps.length, (index) => CartModel.fromJson(maps[index]));
  }

  static Future<int?> getItemsCount(int userId) async {
    var result = await db!.rawQuery(
        "SELECT SUM(quantity) FROM $_cartTable  WHERE userId = ?", [userId]);
    if (result.isNotEmpty) {
      return Sqflite.firstIntValue(result);
    } else {
      return 0;
    }
  }

  static Future<CartModel?> getCartItemById(int id, int userId) async {
    final List<Map<String, dynamic>> maps = await db!.query(
      _cartTable,
      where: 'id = ? AND userId = ?',
      whereArgs: [id, userId],
    );
    if (maps.isEmpty) {
      return null;
    } else {
      return CartModel.fromJson(maps.first);
    }
  }

  static Future<User?> getCurrentUserId(String name, String password) async {
    final List<Map<String, dynamic>> maps = await db!.query(
      _userTable,
      where: 'name = ? AND password = ?',
      whereArgs: [name, password],
    );
    if (maps.isEmpty) {
      return null;
    } else {
      return User.fromJson(maps.first);
    }
  }

  static Future<int> clearCart(int userId) async {
    return await db!.delete(
      _cartTable,
      where: 'userId = ?',
      whereArgs: [userId],
    );
  }
}
