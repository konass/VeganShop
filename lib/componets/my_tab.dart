import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_online_shop/theme/AppColors.dart';
class MyTab extends StatelessWidget {
  final String tabsText;
  const MyTab({super.key, required this.tabsText});

  @override
  Widget build(BuildContext context) {
    return  Tab(
      height: 44,
      child: Container(
        color: AppColors.primaryColor,
        child: Text(
          tabsText,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            )
        ),
      ),
    );
  }
}
