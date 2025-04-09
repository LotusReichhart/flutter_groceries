import 'package:flutter_groceries/model/product_model.dart';

class CartModel {
  final ProductModel productModel;
  late int quantity;

  CartModel({required this.productModel, required this.quantity});

  get product => null;
}
