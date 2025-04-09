import 'package:flutter/material.dart';
import 'package:flutter_groceries/common/color_extension.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../common_widget/round_button.dart';
import '../../view_model/cart_view_model.dart';
import '../../view_model/product_view_model.dart';

class ProductDetailView extends StatefulWidget {
  final int id;

  const ProductDetailView({super.key, required this.id});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  final productViewModel = Get.find<ProductViewModel>();
  final cartViewModel = Get.find<CartViewModel>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    final product = productViewModel.getProductById(widget.id);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: media.width * 0.8,
                      decoration: BoxDecoration(
                        color: const Color(0xffF2F2F2),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(
                        product != null ? product.imageUrl : "",
                        width: media.width * 1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SafeArea(
                      child: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.file_upload_outlined,
                              size: 25,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              product != null ? product.name : "",
                              style: TextStyle(
                                color: AppColor.primaryText,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/img/favorite.png",
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        product != null ? product.unit : "",
                        style: TextStyle(
                          color: AppColor.secondaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(20),
                            child: Icon(Icons.remove, size: 25),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: const Color(0xffF2F2F2),
                              border: Border.all(
                                color: AppColor.placeholder.withValues(
                                  alpha: 0.5,
                                ),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "1",
                              style: TextStyle(
                                color: AppColor.primaryText,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(20),
                            child: Icon(
                              Icons.add,
                              size: 25,
                              color: AppColor.primary,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            product != null
                                ? "\$${product.price.toStringAsFixed(2)}"
                                : "\$0.00",
                            style: TextStyle(
                              color: AppColor.primaryText,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(color: Colors.black26, height: 1),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "Product Detail",
                              style: TextStyle(
                                color: AppColor.primaryText,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: 25,
                              color: AppColor.primaryText,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        product != null ? product.detail : "",
                        style: TextStyle(
                          color: AppColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(color: Colors.black26, height: 1),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "Nutritions",
                              style: TextStyle(
                                color: AppColor.primaryText,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 9,
                            ),
                            height: 25,
                            decoration: BoxDecoration(
                              color: AppColor.placeholder.withValues(
                                alpha: 0.3,
                              ),
                              border: Border.all(
                                color: AppColor.placeholder.withValues(
                                  alpha: 0.5,
                                ),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "100gr",
                              style: TextStyle(
                                color: AppColor.secondaryText,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.navigate_next_rounded,
                              size: 25,
                              color: AppColor.primaryText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Divider(color: Colors.black26, height: 1),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "Review",
                              style: TextStyle(
                                color: AppColor.primaryText,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          IgnorePointer(
                            ignoring: true,
                            child: RatingBar.builder(
                              initialRating: 5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 18,
                              itemPadding: EdgeInsets.symmetric(
                                horizontal: 1.0,
                              ),
                              itemBuilder:
                                  (context, _) => const Icon(
                                    Icons.star,
                                    color: Color(0xffF3603F),
                                  ),
                              onRatingUpdate: (rating) {},
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.navigate_next_rounded,
                              size: 25,
                              color: AppColor.primaryText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      RoundButton(
                        title: "Add To Basket",
                        onPressed: () {
                          product != null
                              ? cartViewModel.addToCart(product)
                              : {};
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
