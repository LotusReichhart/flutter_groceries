import 'package:flutter/material.dart';
import 'package:flutter_groceries/common/color_extension.dart';
import 'package:flutter_groceries/view/cart/cart_view.dart';
import 'package:flutter_groceries/view/explore/explore_view.dart';
import 'package:flutter_groceries/view/home/home_view.dart';

class MainTabview extends StatefulWidget {
  const MainTabview({super.key});

  @override
  State<MainTabview> createState() => _MainTabviewState();
}

class _MainTabviewState extends State<MainTabview>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectTab = 0;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 5, vsync: this);
    tabController?.addListener(() {
      selectTab = tabController?.index ?? 0;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: [
          const HomeView(),
          const ExploreView(),
          const CartView(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 1,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: TabBar(
            controller: tabController,
            indicatorColor: Colors.transparent,
            indicatorWeight: 1,
            labelColor: AppColor.primary,
            labelStyle: TextStyle(
              color: AppColor.primary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelColor: AppColor.primaryText,
            unselectedLabelStyle: TextStyle(
              color: AppColor.primaryText,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            tabs: [
              Tab(
                text: "Shop",
                icon: Image.asset(
                  "assets/img/shop.png",
                  width: 25,
                  height: 25,
                  color:
                      selectTab == 0 ? AppColor.primary : AppColor.primaryText,
                ),
              ),
              Tab(
                text: "Explore",
                icon: Image.asset(
                  "assets/img/explore.png",
                  width: 25,
                  height: 25,
                  color:
                      selectTab == 1 ? AppColor.primary : AppColor.primaryText,
                ),
              ),
              Tab(
                text: "Cart",
                icon: Image.asset(
                  "assets/img/cart.png",
                  width: 25,
                  height: 25,
                  color:
                      selectTab == 2 ? AppColor.primary : AppColor.primaryText,
                ),
              ),
              Tab(
                text: "Favourite",
                icon: Image.asset(
                  "assets/img/favorite.png",
                  width: 25,
                  height: 25,
                  color:
                      selectTab == 3 ? AppColor.primary : AppColor.primaryText,
                ),
              ),
              Tab(
                text: "Account",
                icon: Image.asset(
                  "assets/img/account.png",
                  width: 25,
                  height: 25,
                  color:
                      selectTab == 4 ? AppColor.primary : AppColor.primaryText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
