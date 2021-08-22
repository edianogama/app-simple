import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/values/app_colors.dart';
import 'package:flutter_app/app/common/values/styles/app_text_style.dart';

class CustomTitleColumnWidget extends StatelessWidget {
  final String title, subtitle;
  final TextStyle? richStyle;

  const CustomTitleColumnWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.richStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: richStyle ?? AppTextStyle.titleStyle.copyWith(
                color: AppColors.darkGray,
              ),
        children: [
          TextSpan(text: title.padRight(10)),
          TextSpan(text: subtitle, style: TextStyle(fontWeight: FontWeight.bold))
        ]
      ));
  }
}
