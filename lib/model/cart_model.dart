import 'package:flutter/cupertino.dart';

class CartModel with ChangeNotifier {
  final int id;
  final String title;
  final int price;
  final String urlToImage;
  final int quantity;

  CartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.urlToImage,
    required this.quantity,
  });

  factory CartModel.updateQuantity(CartModel cartModel, int newQuantity) =>
      CartModel(
          id: cartModel.id,
          title: cartModel.title,
          urlToImage: cartModel.urlToImage,
          price: cartModel.price,
          quantity: newQuantity);

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'],
        title: json['title'],
        urlToImage: json['urlToImage'],
        price: json['price'],
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'urlToImage': urlToImage,
        'price': price,
        'quantity': quantity,
      };
}
