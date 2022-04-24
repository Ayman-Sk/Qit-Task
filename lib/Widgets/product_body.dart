import 'package:flutter/material.dart';

class ProductBody extends StatefulWidget {
  ProductBody({Key? key, required this.imagePath}) : super(key: key);
  String? imagePath;
  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.imagePath.toString(),
      // 'https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_.jpg',
      fit: BoxFit.cover,
    );
  }
}
