import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/home/product_detail_view.dart';

class HomeViewModel extends GetxController {
  final textSearch = TextEditingController();

  final exclusiveOfferList = <Map<String, dynamic>>[].obs;
  final categoriesOfferList = <Map<String, dynamic>>[].obs;

  final isShow = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    exclusiveOfferList.assignAll([
      {
        "name": "Organic Bananas",
        "image": "assets/img/organic_banana.png",
        "quantity": "7",
        "unit": "pcs, Prices",
        "price": 4.99,
      },
      {
        "name": "Red Apple",
        "image": "assets/img/red_apple.png",
        "quantity": "1",
        "unit": "kg, Prices",
        "price": 4.99,
      },
      {
        "name": "Bell Pepper Red",
        "image": "assets/img/bell_pepper_red.png",
        "quantity": "5",
        "unit": "pcs, Prices",
        "price": 4.99,
      },
      {
        "name": "Ginger",
        "image": "assets/img/ginger.png",
        "quantity": "2",
        "unit": "pcs, Prices",
        "price": 1.99,
      },
    ]);

    categoriesOfferList.assignAll([
      {"name": "Organic Bananas", "image": "assets/img/organic_banana.png"},
      {"name": "Red Apple", "image": "assets/img/red_apple.png"},
      {"name": "Bell Pepper Red", "image": "assets/img/bell_pepper_red.png"},
      {"name": "Ginger", "image": "assets/img/ginger.png"},
    ]);
  }

  void goToProductDetail(int index) {
    final pObj = exclusiveOfferList[index];
    Get.to(() => ProductDetailView(pObj: pObj));
  }
}
