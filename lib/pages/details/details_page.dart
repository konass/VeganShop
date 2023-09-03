import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_online_shop/pages/details/widgets/body.dart';
import 'package:task_online_shop/theme/app_colors.dart';

import '../../model/product.dart';

class DetailsPage extends StatelessWidget {
  final Product product;

  const DetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyDetails(product: product),
    );
  }
}
