import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_online_shop/componets/drop_down_items.dart';
import '../../../provider/shared_preferences_provider.dart';
import '../../../theme/app_colors.dart';

class DropDownButton extends StatelessWidget {
  const DropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prefsData = Provider.of<SharedPreferencesProvider>(context);

    return Padding(
        padding: EdgeInsets.only(right: 20),
        child: DropdownButton<ListSorting>(
            value: prefsData.getListSorting(),
            items: ListSorting.values.map((name) {
              return buildMenuItem(name);
            }).toList(),
            onChanged: (newValue) {
              if (newValue != null) {
                prefsData.saveListSorting(newValue);
              }
            }));
  }

  DropdownMenuItem<ListSorting> buildMenuItem(ListSorting item) =>
      DropdownMenuItem(
        value: item,
        child: Text(getNameOfItems(item),
            style: TextStyle(
                fontSize: 12,
                color: AppColors.textColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold)),
      );

  String getNameOfItems(ListSorting name) {
    switch (name) {
      case ListSorting.priceIncreasing:
        return 'Цена по возврастанию';
      case ListSorting.priceDecreasing:
        return 'Цена по убыванию';
      case ListSorting.nameIncreasing:
        return 'Название по возврастанию';
      case ListSorting.nameDecreasing:
        return 'Название по убыванию';
      default:
        return '';
    }
  }
}
