import '../../../componets/drop_down_items.dart';
import '../../../model/product.dart';

List<Product>? sortProductByValue(
    List<Product> productList, String selectedValue) {
  var selectedValueInListSorting = getEnumFromName(selectedValue);
  switch (selectedValueInListSorting) {
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

ListSorting getEnumFromName(String name) {
  switch (name) {
    case "Цена по возврастанию":
      return ListSorting.priceIncreasing;
    case "Цена по убыванию":
      return ListSorting.priceDecreasing;
    case "Название по возврастанию":
      return ListSorting.nameIncreasing;
    case "Название по убыванию":
      return ListSorting.nameDecreasing;
    default:
      return ListSorting.priceIncreasing;
  }
}
