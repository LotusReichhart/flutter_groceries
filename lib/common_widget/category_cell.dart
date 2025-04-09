import 'package:flutter/material.dart';
import 'package:flutter_groceries/common/color_extension.dart';
import 'package:flutter_groceries/model/category_model.dart';

class CategoryCell extends StatelessWidget {
  final CategoryModel categoryModel;
  final VoidCallback onPressed;

  const CategoryCell({
    super.key,
    required this.categoryModel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 280,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: (categoryModel.color as Color? ?? AppColor.primary).withValues(
            alpha: 0.3,
          ),
          border: Border.all(color: AppColor.placeholder, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  categoryModel.imageUrl,
                  width: 70,
                  height: 70,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    categoryModel.name,
                    style: TextStyle(
                      color: AppColor.primaryText,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
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
