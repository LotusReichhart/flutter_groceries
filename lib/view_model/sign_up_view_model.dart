import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_groceries/common/globs.dart';
import 'package:flutter_groceries/view/login/login_view.dart';
import 'package:get/get.dart';

class SignUpViewModel extends GetxController {
  final textUsername = TextEditingController().obs;
  final textEmail = TextEditingController().obs;
  final textPassword = TextEditingController().obs;
  final isShowPassword = false.obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    if (kDebugMode) {
      print("SignUpViewModel onInit");
    }
    textEmail.value.text = "test@gmail.com";
    textPassword.value.text = "123456";
  }

  void serviceCallSignUp() async {
    Globs.showHUD();
    // ServiceCall.post(
    //   {"email": textEmail.value.text, "password": textPassword.value.text},
    //   SVKey.svLogin,
    //   withSuccess: (resObj) async {},
    //   failure: (err) async {
    //     Get.snackbar(Globs.appName, err.toString());
    //   },
    // );
    //
    // if (textEmail.value.text.contains("test@gmail.com") &&
    //     textPassword.value.text.contains("123456")) {
    // } else {
    //   Get.snackbar("Flutter Groceries", "");
    // }
    await Future.delayed(const Duration(seconds: 3));
    Globs.hideHUD();
    Get.to(() => const LoginView());
  }

  void goToLogin() {
    Get.to(() => const LoginView());
  }

  void goBack() {
    Get.back();
  }

  void showPassword() {
    isShowPassword.value = !isShowPassword.value;
  }
}
