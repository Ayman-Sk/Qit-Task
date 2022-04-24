import 'package:flutter/material.dart';
import 'package:task_for_qit/Theme/app_colors.dart';
import 'package:task_for_qit/Widgets/product_body.dart';
import 'package:task_for_qit/Widgets/product_header.dart';
import 'package:task_for_qit/Widgets/product_tail.dart';

class ProductItem extends StatefulWidget {
  String? title;
  String? price;
  String? averageRate;
  String? imagePath;
  ProductItem({
    Key? key,
    required this.title,
    required this.price,
    required this.averageRate,
    required this.imagePath,
  }) : super(key: key);
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width / 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Card(
          child: Stack(
            children: [
              // Center(child: _buildPRoductImage()),
              Column(children: [
                Expanded(
                    flex: 1,
                    child: ProductHeader(averageRate: widget.averageRate)),
                Expanded(
                    flex: 3, child: ProductBody(imagePath: widget.imagePath)),
                Expanded(
                    flex: 2,
                    child:
                        ProductTail(title: widget.title, price: widget.price))
              ]),
              _buildAddToCartButton(MediaQuery.of(context).size.height / 10,
                  MediaQuery.of(context).size.width / 21),
            ],
          ),
          color: AppColors.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }

  Widget _buildAddToCartButton(double posX, double posY) {
    return Positioned(
        bottom: posX,
        right: posY,
        child: Card(
          color: AppColors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_shopping_cart_sharp,
                color: Colors.white,
              )),
        ));
  }
}
