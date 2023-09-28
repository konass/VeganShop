import 'package:flutter/material.dart';
import 'package:task_online_shop/data/database.dart';

import '../model/user.dart';

class UserProvider with ChangeNotifier {
  void addNewUser(User user) async {
    await DatabaseHandler.addNewUser(user);
    notifyListeners();
  }

  Future<User?> getUser(String name, String password) async {
    return await DatabaseHandler.getCurrentUserId(name, password);
  }

  Future<User?> getCurrentUserByName(String name) async {
    return await DatabaseHandler.getCurrentUserByName(name);
  }

  Future<String?> getCurrentUserById(int id) async {
    return await DatabaseHandler.getCurrentUserById(id);
  }
}
