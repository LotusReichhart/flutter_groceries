import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class Dropdown extends StatelessWidget {
  final String title;
  final String placeholder;
  final List valueList;
  final Function(Object?) didChange;

  const Dropdown({
    super.key,
    required this.title,
    required this.placeholder,
    required this.valueList,
    required this.didChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColor.textTitle,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 60,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              onChanged: didChange,
              icon: Icon(Icons.expand_more, color: AppColor.textTitle),
              hint: Text(
                placeholder,
                style: TextStyle(
                  color: AppColor.placeholder,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              isExpanded: true,
              items:
                  valueList.map((obj) {
                    return DropdownMenuItem(
                      value: obj,
                      child: Text(
                        obj.toString(),
                        style: TextStyle(
                          color: AppColor.primaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }).toList(),
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 1,
          color: const Color(0xffE2E2E2),
        ),
      ],
    );
  }
}
