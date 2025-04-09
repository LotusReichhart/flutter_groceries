import 'package:flutter_groceries/model/product_model.dart';
import 'package:get/get.dart';

import '../view/home/product_detail_view.dart';

class ProductViewModel extends GetxController {
  final productList = <ProductModel>[].obs;
  final productSearchList = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    productList.assignAll(ProductModel.fakeData());
    productSearchList.assignAll(ProductModel.fakeData());
  }

  ProductModel? getProductById(int id) {
    return productList.firstWhere((product) => product.id == id);
  }

  List<ProductModel> getProductsByCategoryId(int categoryId) {
    return productList
        .where((product) => product.categoryId == categoryId)
        .toList();
  }

  void goToProductDetail(int id) {
    Get.to(() => ProductDetailView(id: id));
  }

  void findProductByName(String query) {
    if (query.isEmpty) {
      productSearchList.assignAll(ProductModel.fakeData());
    } else {
      productSearchList.assignAll(
        ProductModel.fakeData().where(
          (product) => product.name.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
  }
}
