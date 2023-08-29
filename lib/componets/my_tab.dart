import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_online_shop/model/category.dart';

import '../theme/app_colors.dart';

class MyTab extends StatelessWidget {
  final ProductCategory category;

  const MyTab({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 44,
      child: Container(
        color: AppColors.primaryColor,
        child: Text(category.name!,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
