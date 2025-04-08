import 'package:get/get.dart';

class CartViewModel extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs;

  void addToCart(Map<String, dynamic> product) {
    cartItems.add(product);
    Get.snackbar(
      "Success",
      "${product["name"]} added to cart",
    );
  }

  void removeFromCart(Map<String, dynamic> product) {
    cartItems.removeWhere((element) => element["name"] == product["name"]);
    Get.snackbar(
      "Success",
      "${product["name"]} deleted from cart",
    );
  }

  int get totalItems => cartItems.length;
}
