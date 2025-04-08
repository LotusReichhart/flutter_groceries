import 'package:flutter/material.dart';
import 'package:flutter_groceries/common_widget/cart_item_row.dart';
import 'package:flutter_groceries/common_widget/round_button.dart';
import 'package:flutter_groceries/view_model/cart_view_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common/color_extension.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final cartViewModel = Get.find<CartViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "My Cart",
          style: TextStyle(
            color: AppColor.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Obx(
            () => ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: cartViewModel.cartItems.length,
              separatorBuilder:
                  (context, index) =>
                      const Divider(color: Colors.black26, height: 1),
              itemBuilder: (context, index) {
                var pObj = cartViewModel.cartItems[index] as Map? ?? {};
                Map<String, dynamic> product = pObj.cast<String, dynamic>();
                return CartItemRow(
                  pObj: product,
                  onClear: () {
                    cartViewModel.removeFromCart(product);
                  },
                );
              },
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: RoundButton(
                title: "Go to Checkout",
                onPressed: () {
                  //Get.to(() => const MainTabview());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
