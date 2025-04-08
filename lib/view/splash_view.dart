import 'package:flutter/material.dart';
import 'package:flutter_groceries/common/color_extension.dart';
import 'package:flutter_groceries/view/login/welcome_view.dart';
import 'package:flutter_groceries/view_model/splash_view_model.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final splashViewModel = Get.put(SplashViewModel());

  @override
  void initState() {
    super.initState();
    splashViewModel.loadView();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/img/splash_logo.png",
              width: media.width * 0.6,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
