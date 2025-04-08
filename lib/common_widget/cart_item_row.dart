import 'package:flutter/material.dart';
import 'package:flutter_groceries/common/color_extension.dart';

class CartItemRow extends StatelessWidget {
  final Map pObj;
  final VoidCallback onClear;

  const CartItemRow({super.key, required this.pObj, required this.onClear});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              pObj["image"],
              width: 70,
              height: 65,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pObj["name"],
                            style: TextStyle(
                              color: AppColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "${pObj["unit"]}",
                            style: TextStyle(
                              color: AppColor.secondaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: onClear,
                        child: Icon(
                          Icons.clear,
                          color: AppColor.secondaryText,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: AppColor.placeholder.withValues(
                                    alpha: 0.5,
                                  ),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              alignment: Alignment.center,
                              child: Icon(Icons.remove, size: 25),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "1",
                            style: TextStyle(
                              color: AppColor.primaryText,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 15),
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: AppColor.placeholder.withValues(
                                    alpha: 0.5,
                                  ),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.add,
                                size: 25,
                                color: AppColor.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "\$${pObj["price"]}",
                        style: TextStyle(
                          color: AppColor.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
