import 'package:flutter/material.dart';
import 'package:flutter_groceries/common_widget/explore_cell.dart';
import 'package:flutter_groceries/common_widget/product_cell.dart';
import 'package:flutter_groceries/view/explore/explore_detail_view.dart';
import '../../common/color_extension.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
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

  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
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
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  prefixIcon: Icon(Icons.search, size: 30),
                  suffixIcon: IconButton(
                    onPressed: () {
                      textSearch.text == "";
                      FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {});
                    },
                    icon: Icon(Icons.cancel, size: 20,color: AppColor.placeholder,),
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
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: exclusiveOfferArr.length,
              itemBuilder: (context, index) {
                var pObj = exclusiveOfferArr[index] as Map? ?? {};
                return ProductCell(
                  pObj: pObj,
                  margin: 0,
                  weight: 1,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExploreDetailView(eObj: pObj),
                      ),
                    );
                  },
                  onCart: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
