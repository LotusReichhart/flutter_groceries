import 'package:flutter/material.dart';
import 'package:flutter_groceries/common/color_extension.dart';
import 'package:flutter_groceries/view/login/signup_view.dart';
import 'package:flutter_groceries/view/main_tabview/main_tabview.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../common_widget/line_text_field.dart';
import '../../common_widget/round_button.dart';
import '../../view_model/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginViewModel = Get.put(LoginViewModel());

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
                Navigator.pop(context);
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
                          "Login",
                          style: TextStyle(
                            color: AppColor.primaryText,
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: media.width * 0.03),
                        Text(
                          "Enter your emails and password",
                          style: TextStyle(
                            color: AppColor.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: media.width * 0.07),
                        LineTextField(
                          title: "Email",
                          placeholder: "Enter your email address",
                          keyboardType: TextInputType.emailAddress,
                          controller: loginViewModel.textEmail.value,
                        ),
                        SizedBox(height: media.width * 0.05),
                        Obx(
                          () => LineTextField(
                            title: "Password",
                            placeholder: "Enter your password",
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: !loginViewModel.isShowPassword.value,
                            controller: loginViewModel.textPassword.value,
                            right: IconButton(
                              onPressed: () {
                                loginViewModel.showPassword();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              icon: Icon(
                                loginViewModel.isShowPassword.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 25,
                                color: AppColor.textTitle,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: media.width * 0.05),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: AppColor.primaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: media.width * 0.1),
                        RoundButton(
                          title: "Log In",
                          onPressed: () {
                            loginViewModel.serviceCallLogin();
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
                                "Don't have an account?",
                                style: TextStyle(
                                  color: AppColor.primaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 5),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignupView(),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  "Signup",
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
