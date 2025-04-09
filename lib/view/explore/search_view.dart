import 'package:flutter/material.dart';
import 'package:flutter_groceries/common_widget/product_cell.dart';
import 'package:get/get.dart';
import '../../common/color_extension.dart';
import '../../view_model/product_view_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final productViewModel = Get.find<ProductViewModel>();
  final textSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          "Search",
          style: TextStyle(
            color: AppColor.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xffF2F3F2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: textSearch,
                onChanged: (value) {
                  productViewModel.findProductByName(value);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  prefixIcon: Icon(Icons.search, size: 30),
                  suffixIcon: IconButton(
                    onPressed: () {
                      textSearch.clear();
                      productViewModel.findProductByName("");
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    icon: Icon(Icons.cancel, size: 20, color: AppColor.placeholder),
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Search Store",
                  hintStyle: TextStyle(
                    color: AppColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Obx(() {
              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: productViewModel.productSearchList.length,
                itemBuilder: (context, index) {
                  final product = productViewModel.productSearchList[index];
                  return ProductCell(
                    productModel: product,
                    margin: 0,
                    weight: 1,
                    onPressed: () {
                      productViewModel.goToProductDetail(product.id);
                    },
                    onCart: () {},
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
