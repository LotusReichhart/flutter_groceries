import 'package:flutter/material.dart';
import 'package:flutter_groceries/common_widget/explore_cell.dart';
import 'package:flutter_groceries/common_widget/product_cell.dart';
import '../../common/color_extension.dart';

class ExploreDetailView extends StatefulWidget {
  final Map eObj;

  const ExploreDetailView({super.key, required this.eObj});

  @override
  State<ExploreDetailView> createState() => _ExploreDetailViewState();
}

class _ExploreDetailViewState extends State<ExploreDetailView> {
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
          widget.eObj["name"],
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
                  var eObj = exclusiveOfferArr[index] as Map? ?? {};
                  return ProductCell(
                    pObj: eObj,
                    margin: 0,
                    weight: double.maxFinite,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExploreDetailView(eObj: eObj),
                        ),
                      );
                    },
                    onCart: () {},
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
