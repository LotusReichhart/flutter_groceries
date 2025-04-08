import 'package:get/get.dart';

import '../view/login/sign_in_view.dart';

class WelcomeViewModel extends GetxController {
  void goToSignIn() async {
    Get.to(() => const SignInView());
  }
}
