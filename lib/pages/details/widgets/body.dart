import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_online_shop/pages/details/widgets/app_bar.dart';
import 'package:task_online_shop/pages/details/widgets/bottom_bar.dart';
import 'package:task_online_shop/pages/details/widgets/image_details.dart';
import 'package:task_online_shop/pages/details/widgets/text_details.dart';

import '../../../model/product.dart';

class BodyDetails extends StatelessWidget {
  final Product product;

  const BodyDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(
            height: size.height,
            child: Stack(
              children: [
                ImageDetails(size: size, product: product),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.5 + 10),
                      padding: EdgeInsets.only(
                          top: size.height / 20,
                          left: size.width * 0.05,
                          right: size.width * 0.05,
                          bottom: size.height * 0.05),
                      // height: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        children: [
                          TextDetails(product: product),
                          SizedBox(
                            height: 50,
                          ),
                          BottomBarDetails(product: product),
                        ],
                      )),
                ),
                AppBarDetails(),
                SizedBox(
                  height: 30,
                )
              ],
            ))
      ],
    );
  }
}
