import 'package:flutter/material.dart';
import 'package:task_for_qit/Theme/app_colors.dart';

class ProductHeader extends StatefulWidget {
  ProductHeader({Key? key, required this.averageRate}) : super(key: key);
  String? averageRate;
  @override
  State<ProductHeader> createState() => _ProductHeaderState();
}

class _ProductHeaderState extends State<ProductHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAverageReview(widget.averageRate.toString()),
        _buildFavoriteButton(true)
      ],
    );
  }

  Widget _buildFavoriteButton(bool isFavorite) {
    return IconButton(
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.white),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }

  Widget _buildAverageReview(
    String average,
  ) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: AppColors.background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              average,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const Center(
            child: Icon(
              Icons.star_rate_rounded,
              color: AppColors.starColor,
            ),
          )
        ],
      ),
    );
  }
}
