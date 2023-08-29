class ProductCategory {
  int? id;
  String? name;

  ProductCategory({this.id, this.name});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
