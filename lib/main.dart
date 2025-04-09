import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_groceries/common/app_http_overrides.dart';
import 'package:flutter_groceries/common/color_extension.dart';
import 'package:flutter_groceries/view/splash_view.dart';
import 'package:flutter_groceries/view_model/cart_view_model.dart';
import 'package:flutter_groceries/view_model/category_view_model.dart';
import 'package:flutter_groceries/view_model/product_view_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

void main() async {
  HttpOverrides.global = AppHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  Get.put<CartViewModel>(CartViewModel());
  Get.put<ProductViewModel>(ProductViewModel());
  Get.put<CategoryViewModel>(CategoryViewModel());

  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 5.0
    ..progressColor = AppColor.primaryText
    ..backgroundColor = AppColor.primary
    ..indicatorColor = Colors.orangeAccent
    ..textColor = AppColor.primaryText
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return GetMaterialApp(
      title: 'Flutter Groceries',
      theme: ThemeData(
        fontFamily: "Gilroy",
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
      builder: (context, child) {
        return FlutterEasyLoading(child: child);
      },
    );
  }
}
