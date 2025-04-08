import 'package:get/get.dart';

import '../view/login/login_view.dart';
import '../view/login/signup_view.dart';
import '../view/login/verification_view.dart';

class SignInViewModel extends GetxController {
  void signInWithEmail() async {
    Get.to(() => const LoginView());
  }
  void signUpWithEmail() async {
    Get.to(() => const SignupView());
  }
  void signInWithGoogle() async {
    Get.to(() => const VerificationView());
  }
  void signInWithFacebook() async {
    Get.to(() => const VerificationView());
  }
}
