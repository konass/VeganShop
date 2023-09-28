import '../../../componets/drop_down_items.dart';
import '../../../model/product.dart';

List<Product>? sortProductByValue(
    List<Product> productList, ListSorting selectedValue) {
  switch (selectedValue) {
    case ListSorting.priceIncreasing:
      productList.sort((a, b) => a.price!.compareTo(b.price!));
      return productList;
    case ListSorting.priceDecreasing:
      productList.sort((a, b) => b.price!.compareTo(a.price!));
      return productList;
    case ListSorting.nameIncreasing:
      productList.sort((a, b) => a.title!.compareTo(b.title!));
      return productList;
    case ListSorting.nameDecreasing:
      productList.sort((a, b) => b.title!.compareTo(a.title!));
      return productList;
    default:
      return productList;
  }
}
