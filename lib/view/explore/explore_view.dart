import 'package:flutter/material.dart';
import 'package:flutter_groceries/common_widget/explore_cell.dart';
import 'package:flutter_groceries/view/explore/explore_detail_view.dart';
import 'package:flutter_groceries/view/explore/search_view.dart';
import '../../common/color_extension.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  TextEditingController textSearch = TextEditingController();

  List categoriesOfferArr = [
    {
      "name": "Organic Bananas",
      "image": "assets/img/organic_banana.png",
      "color": const Color(0xff538175),
    },
    {
      "name": "Red Apple",
      "image": "assets/img/red_apple.png",
      "color": const Color(0xffF8A44C),
    },
    {
      "name": "Bell Pepper Red",
      "image": "assets/img/bell_pepper_red.png",
      "color": const Color(0xffF7A593),
    },
    {
      "name": "Ginger",
      "image": "assets/img/ginger.png",
      "color": const Color(0xffD3B0E0),
    },
  ];

  bool isShow = false;

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
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.95,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: categoriesOfferArr.length,
              itemBuilder: (context, index) {
                var pObj = categoriesOfferArr[index] as Map? ?? {};
                return ExploreCell(
                  pObj: pObj,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExploreDetailView(eObj: pObj),
                      ),
                    );
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
