import 'package:flutter/material.dart';
import 'package:flutter_groceries/common/color_extension.dart';
import 'package:flutter_groceries/model/product_model.dart';

class ProductCell extends StatelessWidget {
  final ProductModel productModel;
  final VoidCallback onPressed;
  final VoidCallback onCart;
  final double margin;
  final double weight;

  const ProductCell({
    super.key,
    required this.productModel,
    required this.onPressed,
    required this.onCart,
    this.margin = 8,
    this.weight = 180,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: weight,
        margin: EdgeInsets.symmetric(horizontal: margin),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColor.placeholder, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                productModel.imageUrl,
                width: 100,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              productModel.name,
              style: TextStyle(
                color: AppColor.primaryText,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              productModel.unit,
              style: TextStyle(
                color: AppColor.secondaryText,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${productModel.price}",
                  style: TextStyle(
                    color: AppColor.primaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: onCart,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 25),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
