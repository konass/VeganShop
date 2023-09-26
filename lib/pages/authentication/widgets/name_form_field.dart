import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class NameFormField extends StatelessWidget {
  final TextEditingController nameController;

  const NameFormField({Key? key, required this.nameController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.formBackgroundColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Введите имя",
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                      color: AppColors.formTextColor,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
                validator: (value) {
                  if ((value == null) || (value.isEmpty)) {
                    return 'Введите имя';
                  }
                  return null;
                })),
      ),
    );
  }
}
