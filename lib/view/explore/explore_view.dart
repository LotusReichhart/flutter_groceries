import 'package:flutter/material.dart';
import 'package:flutter_groceries/common_widget/explore_cell.dart';
import 'package:flutter_groceries/view/explore/explore_detail_view.dart';
import 'package:flutter_groceries/view/explore/search_view.dart';
import 'package:get/get.dart';
import '../../common/color_extension.dart';
import '../../view_model/category_view_model.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  TextEditingController textSearch = TextEditingController();
  bool isShow = false;

  final categoryViewModel = Get.find<CategoryViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Find Products",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchView()),
                );
              },
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 46,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xffF2F3F2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(Icons.search, size: 30),
                      Text(
                        "Search Store",
                        style: TextStyle(
                          color: AppColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.95,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: categoryViewModel.categoryList.length,
              itemBuilder: (context, index) {
                final category = categoryViewModel.categoryList[index];
                return ExploreCell(
                  categoryModel: category,
                  onPressed: () {
                    Get.to(() => ExploreDetailView(categoryModel: category));
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
