import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/values/app_colors.dart';
import 'package:flutter_app/app/common/values/styles/app_text_style.dart';

class CustomRowTextWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextStyle? titleStyle, subtitleStyle;
  final MainAxisAlignment mainAxisAlignment;
  final TextAlign? textAlign;

  const CustomRowTextWidget({
    Key? key,
    required this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.textAlign = TextAlign.center,
    
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Flexible(
          child: Text(
            title,
            textAlign: textAlign,
            style: titleStyle ??
                AppTextStyle.regularStyle.copyWith(
                  color: AppColors.darkGray,
                  
                ),
          ),
        ),
        Text(
          subtitle ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: subtitleStyle ??
              AppTextStyle.regularStyle.copyWith(
                color: Colors.black,
              ),
        ) 
      ],
    );
  }
}
