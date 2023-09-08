import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_online_shop/componets/cart_icon.dart';

import '../../../theme/app_colors.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, top: 27, right: 20),
          child: Image.asset(
            'assets/vegan_logo.jpg',
            width: 81,
            height: 78,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text('Plant world',
                  style: TextStyle(
                      fontSize: 24,
                      color: AppColors.textColor,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 5,
            ),
            Text('Vegan online store',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.normal)),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        CartIcon()
      ],
    ));
  }
}
