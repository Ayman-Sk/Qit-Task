import 'package:flutter/material.dart';
import 'package:task_for_qit/Theme/app_colors.dart';

class ProductTail extends StatefulWidget {
  ProductTail({Key? key, required this.price, required this.title})
      : super(key: key);
  String? title;
  String? price;
  @override
  State<ProductTail> createState() => _ProductTailState();
}

class _ProductTailState extends State<ProductTail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height / 5,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        color: Color.fromARGB(255, 57, 64, 73),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 20.0, left: 8.0, right: 8.0, bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.title.toString(),
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              '\$ ${widget.price}',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
