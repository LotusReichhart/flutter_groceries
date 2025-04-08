import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_groceries/common/color_extension.dart';
import 'package:get/get.dart';
import '../../common_widget/line_text_field.dart';
import '../../common_widget/round_button.dart';
import '../../view_model/sign_up_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final signUpViewModel = Get.put(SignUpViewModel());

  TextEditingController textUsername = TextEditingController();
  TextEditingController textEmail = TextEditingController();
  TextEditingController textPassword = TextEditingController();

  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            "assets/img/bg.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                signUpViewModel.goBack();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 25,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/img/carrot.png",
                            width: 45,
                          ),
                        ),
                        SizedBox(height: media.width * 0.12),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: AppColor.primaryText,
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: media.width * 0.03),
                        Text(
                          "Enter your credentials to continue",
                          style: TextStyle(
                            color: AppColor.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: media.width * 0.07),
                        LineTextField(
                          title: "Username",
                          placeholder: "Enter your username",
                          keyboardType: TextInputType.emailAddress,
                          controller: textUsername,
                        ),
                        SizedBox(height: media.width * 0.05),
                        LineTextField(
                          title: "Email",
                          placeholder: "Enter your email address",
                          keyboardType: TextInputType.emailAddress,
                          controller: textEmail,
                        ),
                        SizedBox(height: media.width * 0.05),
                        Obx(
                          () => LineTextField(
                            title: "Password",
                            placeholder: "Enter your password",
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: !signUpViewModel.isShowPassword.value,
                            controller: signUpViewModel.textPassword.value,
                            right: IconButton(
                              onPressed: () {
                                signUpViewModel.showPassword();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              icon: Icon(
                                signUpViewModel.isShowPassword.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 25,
                                color: AppColor.textTitle,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: media.width * 0.04),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: AppColor.secondaryText,
                              height: 1.5,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              const TextSpan(
                                text: "By continuing you agree to our ",
                              ),
                              TextSpan(
                                text: "Terms of Service",
                                style: TextStyle(color: AppColor.primary),
                                recognizer:
                                    TapGestureRecognizer()..onTap = () {},
                              ),
                              const TextSpan(text: " and "),
                              TextSpan(
                                text: "Privacy Policy.",
                                style: TextStyle(color: AppColor.primary),
                                recognizer:
                                    TapGestureRecognizer()..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: media.width * 0.04),
                        RoundButton(
                          title: "Sign Up",
                          onPressed: () {
                            signUpViewModel.serviceCallSignUp();
                          },
                        ),
                        SizedBox(height: media.width * 0.07),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                  color: AppColor.primaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(width: 5),
                              TextButton(
                                onPressed: () {
                                  signUpViewModel.goToLogin();
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: AppColor.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
