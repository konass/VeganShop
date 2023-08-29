import 'dart:convert';
import 'package:task_online_shop/componets/my_tab.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:task_online_shop/model/category.dart';

Future<List<ProductCategory>> loadCategoriesFromJson() async {
  final String data =
      await rootBundle.rootBundle.loadString('assets/data.json');
  final Map<String, dynamic> jsonData = json.decode(data);
  List<dynamic> categoryList = jsonData['categories'];
  return categoryList
      .map((category) => ProductCategory.fromJson(category))
      .toList();
}

List<MyTab> createTabs(List<ProductCategory> categories) {
  return categories.map((category) => MyTab(category: category)).toList();
}
