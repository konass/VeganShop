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
        child: DropdownButton(
            value: prefsData.returnValue(),
            items: dropDownItems.map(buildMenuItem).toList(),
            onChanged: (newValue) {
              prefsData.saveToSharedPreferences(newValue);
            }));
  }

  DropdownMenuItem buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item,
            style: TextStyle(
                fontSize: 12,
                color: AppColors.textColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold)),
      );
}
