import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/product.dart';
import '../../../theme/app_colors.dart';

class TextDetails extends StatelessWidget {
  final Product product;

  const TextDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Row(children: [
            Text(product.title!,
                style: TextStyle(
                    fontSize: 20,
                    color: AppColors.textColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold)),
            Text(product.weight!,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold)),
          ]),
        ),
        SizedBox(
          height: 14,
        ),
        Center(
          child: Text(product.description!,
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textColor,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.normal)),
        )
      ],
    );
  }
}
