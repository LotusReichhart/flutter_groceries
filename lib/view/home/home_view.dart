import 'package:flutter/material.dart';
import 'package:flutter_groceries/common_widget/product_cell.dart';
import 'package:flutter_groceries/common_widget/section_view.dart';
import 'package:flutter_groceries/view/home/product_detail_view.dart';
import 'package:flutter_groceries/view_model/home_view_model.dart';
import 'package:get/get.dart';

import '../../common/color_extension.dart';
import '../../common_widget/category_cell.dart';
import '../../view_model/cart_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeViewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset("assets/img/carrot.png", width: 25),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 22,
                        color: AppColor.darkGray,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Dhaka, Banassre",
                        style: TextStyle(
                          color: AppColor.darkGray,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
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
                        controller: homeViewModel.textSearch,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          prefixIcon: Icon(Icons.search, size: 30),
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
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/img/banner.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SectionView(
                    title: "Exclusive Offer",
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemCount: homeViewModel.exclusiveOfferList.length,
                      itemBuilder: (context, index) {
                        var pObj =
                            homeViewModel.exclusiveOfferList[index] as Map? ??
                            {};
                        return ProductCell(
                          pObj: pObj,
                          onPressed: () {
                            homeViewModel.goToProductDetail(index);
                          },
                          onCart: () {
                            Map<String, dynamic> product =
                                pObj.cast<String, dynamic>();
                            Get.find<CartViewModel>().addToCart(product);
                          },
                        );
                      },
                    ),
                  ),

                  SectionView(
                    title: "Best Selling",
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemCount: homeViewModel.exclusiveOfferList.length,
                      itemBuilder: (context, index) {
                        var pObj =
                            homeViewModel.exclusiveOfferList[index] as Map? ??
                            {};
                        return ProductCell(
                          pObj: pObj,
                          onPressed: () {
                            homeViewModel.goToProductDetail(index);
                          },
                          onCart: () {
                            Map<String, dynamic> product =
                                pObj.cast<String, dynamic>();
                            Get.find<CartViewModel>().addToCart(product);
                          },
                        );
                      },
                    ),
                  ),

                  SectionView(
                    title: "Groceries",
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 105,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemCount: homeViewModel.categoriesOfferList.length,
                      itemBuilder: (context, index) {
                        var pObj =
                            homeViewModel.categoriesOfferList[index] as Map? ??
                            {};
                        return CategoryCell(pObj: pObj, onPressed: () {});
                      },
                    ),
                  ),
                  const SizedBox(height: 15),

                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemCount: homeViewModel.exclusiveOfferList.length,
                      itemBuilder: (context, index) {
                        var pObj =
                            homeViewModel.exclusiveOfferList[index] as Map? ??
                            {};
                        return ProductCell(
                          pObj: pObj,
                          onPressed: () {
                            homeViewModel.goToProductDetail(index);
                          },
                          onCart: () {
                            Map<String, dynamic> product =
                                pObj.cast<String, dynamic>();
                            Get.find<CartViewModel>().addToCart(product);
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
