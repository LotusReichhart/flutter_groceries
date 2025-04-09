import 'package:flutter_groceries/model/cart_model.dart';
import 'package:flutter_groceries/model/product_model.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  var cartItems = <CartModel>[].obs;

  void addToCart(ProductModel product, {int quantity = 1}) {
    final CartModel? existingCartItem = cartItems.firstWhereOrNull(
      (item) => item.productModel.id == product.id,
    );

    if (existingCartItem != null) {
      existingCartItem.quantity += quantity;
      cartItems.refresh();
    } else {
      cartItems.add(CartModel(quantity: quantity, productModel: product));
    }

    Get.snackbar("Success", "${product.name} added to cart");
  }

  void increaseQuantity(ProductModel product) {
    final CartModel? existingCartItem = cartItems.firstWhereOrNull(
      (item) => item.productModel.id == product.id,
    );

    if (existingCartItem != null &&
        existingCartItem.quantity < existingCartItem.productModel.quantity) {
      existingCartItem.quantity += 1;
      cartItems.refresh(); // Notify observers of the change
    }
  }

  void decreaseQuantity(ProductModel product) {
    final CartModel? existingCartItem = cartItems.firstWhereOrNull(
      (item) => item.productModel.id == product.id,
    );

    if (existingCartItem != null) {
      if (existingCartItem.quantity > 1) {
        existingCartItem.quantity -= 1;
        cartItems.refresh();
      } else {
        removeFromCart(existingCartItem);
      }
    }
  }

  void removeFromCart(CartModel cartModel) {
    cartItems.remove(cartModel);
    Get.snackbar("Success", "${cartModel.productModel.name} deleted from cart");
  }

  int get totalItems => cartItems.length;
}
