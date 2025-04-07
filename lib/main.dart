import 'package:flutter/material.dart';
import 'package:flutter_groceries/common/color_extension.dart';
import 'package:flutter_groceries/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Gilroy",
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
