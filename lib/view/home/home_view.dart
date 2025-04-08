import 'package:flutter/material.dart';
import 'package:flutter_groceries/common_widget/product_cell.dart';
import 'package:flutter_groceries/common_widget/section_view.dart';
import 'package:flutter_groceries/view/home/product_detail_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/category_cell.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController textSearch = TextEditingController();

  List exclusiveOfferArr = [
    {
      "name": "Organic Bananas",
      "image": "assets/img/organic_banana.png",
      "quantity": "7",
      "unit": "pcs, Prices",
      "price": "\$4.99",
    },
    {
      "name": "Red Apple",
      "image": "assets/img/red_apple.png",
      "quantity": "1",
      "unit": "kg, Prices",
      "price": "\$4.99",
    },
    {
      "name": "Bell Pepper Red",
      "image": "assets/img/bell_pepper_red.png",
      "quantity": "5",
      "unit": "pcs, Prices",
      "price": "\$4.99",
    },
    {
      "name": "Ginger",
      "image": "assets/img/ginger.png",
      "quantity": "2",
      "unit": "pcs, Prices",
      "price": "\$1.99",
    },
  ];

  List categoriesOfferArr = [
    {
      "name": "Organic Bananas",
      "image": "assets/img/organic_banana.png",
    },
    {
      "name": "Red Apple",
      "image": "assets/img/red_apple.png",
    },
    {
      "name": "Bell Pepper Red",
      "image": "assets/img/bell_pepper_red.png",
    },
    {
      "name": "Ginger",
      "image": "assets/img/ginger.png",
    },
  ];

  bool isShow = false;

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
                        controller: textSearch,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 15),
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
                      itemCount: exclusiveOfferArr.length,
                      itemBuilder: (context, index) {
                        var pObj = exclusiveOfferArr[index] as Map? ?? {};
                        return ProductCell(
                          pObj: pObj,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProductDetailView(),
                              ),
                            );
                          },
                          onCart: () {},
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
                      itemCount: exclusiveOfferArr.length,
                      itemBuilder: (context, index) {
                        var pObj = exclusiveOfferArr[index] as Map? ?? {};
                        return ProductCell(
                          pObj: pObj,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProductDetailView(),
                              ),
                            );
                          },
                          onCart: () {},
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
                      itemCount: categoriesOfferArr.length,
                      itemBuilder: (context, index) {
                        var pObj = categoriesOfferArr[index] as Map? ?? {};
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
                      itemCount: exclusiveOfferArr.length,
                      itemBuilder: (context, index) {
                        var pObj = exclusiveOfferArr[index] as Map? ?? {};
                        return ProductCell(
                          pObj: pObj,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProductDetailView(),
                              ),
                            );
                          },
                          onCart: () {},
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
