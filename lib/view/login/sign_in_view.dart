import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_groceries/common/color_extension.dart';
import 'package:flutter_groceries/common_widget/round_button.dart';
import 'package:flutter_groceries/view_model/sign_in_view_model.dart';
import 'package:get/get.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final signInViewModel = Get.put(SignInViewModel());

  TextEditingController textMobile = TextEditingController();
  FlCountryCodePicker flCountryCodePicker = const FlCountryCodePicker();
  late CountryCode countryCode;

  @override
  void initState() {
    super.initState();
    countryCode = flCountryCodePicker.countryCodes.firstWhere(
      (element) => element.name == "United Kingdom",
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset("assets/img/sign_in_top.png", width: media.width),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: media.width * 0.5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Get your groceries\nwith nectar",
                      style: TextStyle(
                        color: AppColor.primaryText,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextField(
                          controller: textMobile,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            prefixIcon: GestureDetector(
                              onTap: () async {
                                final code = await flCountryCodePicker
                                    .showPicker(context: context);
                                if (code != null) {
                                  countryCode = code;
                                  if (mounted) {
                                    setState(() {});
                                  }
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 15),
                                    width: 40,
                                    height: 40,
                                    child: countryCode.flagImage(),
                                  ),
                                  Text(
                                    countryCode.dialCode,
                                    style: TextStyle(
                                      color: AppColor.primaryText,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(width: 15),
                                ],
                              ),
                            ),
                            prefixIconConstraints: BoxConstraints(
                              minWidth: 0,
                              minHeight: 0,
                            ),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: countryCode.name,
                            hintStyle: TextStyle(
                              color: AppColor.placeholder,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 1,
                          color: const Color(0xffE2E2E2),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RoundButton(
                      title: "Sign In With Email",
                      bgColor: const Color(0xff5383EC),
                      onPressed: () {
                        signInViewModel.signInWithEmail();
                      },
                    ),
                  ),

                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RoundButton(
                      title: "Sign Up With Email",
                      onPressed: () {
                        signInViewModel.signUpWithEmail();
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Or connect with social media",
                      style: TextStyle(
                        color: AppColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RoundIconButton(
                      title: "Continue with Google",
                      icon: "assets/img/gg_logo.png",
                      bgColor: Color(0xff4A66AC),
                      onPressed: () {
                        signInViewModel.signInWithGoogle();
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RoundIconButton(
                      title: "Continue with Facebook",
                      icon: "assets/img/fb_logo.png",
                      bgColor: Color(0xff4A66AC),
                      onPressed: () {
                        signInViewModel.signInWithFacebook();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
