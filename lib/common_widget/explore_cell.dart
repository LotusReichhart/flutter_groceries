import 'package:flutter/material.dart';
import 'package:flutter_groceries/common/color_extension.dart';

class ExploreCell extends StatelessWidget {
  final Map pObj;
  final VoidCallback onPressed;

  const ExploreCell({super.key, required this.pObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var color = (pObj["color"] as Color? ?? AppColor.primary);
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.3),
          border: Border.all(color: color, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              pObj["image"],
              width: 90,
              height: 90,
              fit: BoxFit.contain,
            ),
            const Spacer(),
            Text(
              pObj["name"],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.primaryText,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
