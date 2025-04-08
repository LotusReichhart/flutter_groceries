import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_groceries/common/globs.dart';
import 'package:flutter_groceries/common/service_call.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginViewModel extends GetxController {
  final textEmail = TextEditingController().obs;
  final textPassword = TextEditingController().obs;
  final isShowPassword = false.obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    if(kDebugMode){
      print("LoginViewModel onInit");
    }
    textEmail.value.text = "test@gmail.com";
    textPassword.value.text = "123456";
  }

  void serviceCallLogin(){

    Globs.showHUD();
    ServiceCall.post({
      "email": textEmail.value.text,
      "password": textPassword.value.text,
    }, SVKey.svLogin, withSuccess: (resObj) async {
      
    }, failure: (err) async{
      Get.snackbar("", message)
    });

    if(textEmail.value.text.contains("test@gmail.com") && textPassword.value.text.contains("123456") ){

    }else{
      Get.snackbar("Flutter Groceries", "");
    }
  }

  void showPassword() {
    isShowPassword.value = !isShowPassword.value;
  }
}
