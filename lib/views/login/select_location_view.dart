import 'package:flutter/material.dart';
import 'package:flutter_groceries/common/color_extension.dart';

import '../../common_widget/dropdown.dart';
import '../../common_widget/round_button.dart';
import 'login_view.dart';

class SelectLocationView extends StatefulWidget {
  const SelectLocationView({super.key});

  @override
  State<SelectLocationView> createState() => _SelectLocationViewState();
}

class _SelectLocationViewState extends State<SelectLocationView> {
  TextEditingController textOTP = TextEditingController();

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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/img/location.png",
                          width: media.width * 0.6,
                        ),
                        SizedBox(height: media.width * 0.1),
                        Text(
                          "Select Your Location",
                          style: TextStyle(
                            color: AppColor.primaryText,
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: media.width * 0.03),
                        Text(
                          "Switch on your location to stay in tune with"
                          "\nwhat’s happening in your area",
                          style: TextStyle(
                            color: AppColor.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: media.width * 0.1),
                        Dropdown(
                          title: "Your Zone",
                          placeholder: "Select your zone",
                          valueList: const ["Zone 1", "Zone 2", "Zone 3"],
                          didChange: (sObj) {},
                        ),
                        SizedBox(height: media.width * 0.07),
                        Dropdown(
                          title: "Your Area",
                          placeholder: "Types of your area",
                          valueList: const ["Area 1", "Area 2", "Area 3"],
                          didChange: (sObj) {},
                        ),
                        SizedBox(height: media.width * 0.1),
                        RoundButton(
                          title: "Submit",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginView(),
                              ),
                            );
                          },
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
