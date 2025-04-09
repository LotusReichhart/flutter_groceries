import 'package:flutter/material.dart';
import 'package:flutter_groceries/common_widget/product_cell.dart';
import 'package:flutter_groceries/model/category_model.dart';
import 'package:get/get.dart';
import '../../common/color_extension.dart';
import '../../view_model/cart_view_model.dart';
import '../../view_model/product_view_model.dart';

class ExploreDetailView extends StatefulWidget {
  final CategoryModel categoryModel;

  const ExploreDetailView({super.key, required this.categoryModel});

  @override
  State<ExploreDetailView> createState() => _ExploreDetailViewState();
}

class _ExploreDetailViewState extends State<ExploreDetailView> {
  final productViewModel = Get.find<ProductViewModel>();
  final cartViewModel = Get.find<CartViewModel>();

  @override
  Widget build(BuildContext context) {
    final productList = productViewModel.getProductsByCategoryId(widget.categoryModel.id);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, size: 25, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/img/filter.png", width: 25, height: 25),
          ),
        ],
        title: Text(
          widget.categoryModel.name,
          style: TextStyle(
            color: AppColor.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: SizedBox(
              height: 230,
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  final product = productList[index];
                  return ProductCell(
                    productModel: product,
                    margin: 0,
                    weight: double.maxFinite,
                    onPressed: () {
                      productViewModel.goToProductDetail(product.id);
                    },
                    onCart: () {
                      cartViewModel.addToCart(product);
                    },
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
