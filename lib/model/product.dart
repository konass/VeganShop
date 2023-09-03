class Product {
  int? id;

  String? title;

  int? price;

  String? urlToImage;

  int? categoryId;

  String? subtitle;
  String? description;
  String? weight;


  Product({this.id,
    this.title,
    this.price,
    this.urlToImage,
    this.categoryId,
    this.subtitle,
    this.description,
    this.weight,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    urlToImage = json['urlToImage'];
    categoryId = json['categoryId'];
    subtitle = json['subtitle'];
    description = json['description'];
    weight = json['weight'];
  }
}
