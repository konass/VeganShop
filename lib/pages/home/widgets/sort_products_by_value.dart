import '../../../componets/drop_down_items.dart';
import '../../../model/product.dart';

List<Product>? sortProductByValue(
    List<Product> productList, String selectedValue) {
  switch (selectedValue) {
    case priceIncreasing:
      productList.sort((a, b) => a.price!.compareTo(b.price!));
      return productList;
    case priceDecreasing:
      productList.sort((a, b) => b.price!.compareTo(a.price!));
      return productList;
    case nameIncreasing:
      productList.sort((a, b) => a.title!.compareTo(b.title!));
      return productList;
    case nameDecreasing:
      productList.sort((a, b) => b.title!.compareTo(a.title!));
      return productList;
    default:
      productList;
  }
  return null;
}
