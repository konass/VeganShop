import 'package:flutter/cupertino.dart';
import 'package:task_online_shop/model/product.dart';

class ImageDetails extends StatelessWidget {
  final Size size;
  final Product product;

  const ImageDetails({Key? key, required this.size, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      child: Container(
        width: double.maxFinite,
        height: size.height / 1.8,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(product.urlToImage.toString()))),
      ),
    );
  }
}
