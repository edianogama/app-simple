import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/values/app_colors.dart';
import 'package:flutter_app/app/common/values/styles/app_text_style.dart';
import 'package:flutter_app/app/common/values/styles/dimens.dart';

class CustomRichTextWidget extends StatelessWidget {
  final String title, subtitle;
  final TextStyle? titleStyle, subtitleStyle;
  final TextAlign textAlign;

  const CustomRichTextWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        text: title,
        style: titleStyle ??
            AppTextStyle.regularStyle.copyWith(
              color: AppColors.darkGray,
              fontSize: Dimens.fontSize14,
            ),
        children: [
          TextSpan(
            text: ' $subtitle',
            style: subtitleStyle ??
                AppTextStyle.regularStyle.copyWith(
                  fontSize: Dimens.fontSize14,
                ),
          ),
        ],
      ),
    );
  }
}
