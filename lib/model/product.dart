class Product {
  int? id;

  String? title;

  String? price;

  String? urlToImage;

  int? categoryId;

  String? subtitle;

  Product(
      {this.id,
      this.title,
      this.price,
      this.urlToImage,
      this.categoryId,
      this.subtitle});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    urlToImage = json['urlToImage'];
    categoryId = json['categoryId'];
    subtitle = json['subtitle'];
  }
}
