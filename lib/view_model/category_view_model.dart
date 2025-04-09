import 'package:flutter_groceries/model/category_model.dart';
import 'package:get/get.dart';

class CategoryViewModel extends GetxController {
  final categoryList = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    categoryList.assignAll(CategoryModel.fakeData());
  }
}
