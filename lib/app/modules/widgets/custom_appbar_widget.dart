import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/values/app_colors.dart';
import 'package:flutter_app/app/common/values/styles/app_text_style.dart';
import 'package:flutter_app/app/common/values/styles/dimens.dart';
import 'package:flutter_app/app/modules/widgets/buttons/custom_back_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbarWidget extends PreferredSize {
  final String title;
  final Color? backgroundColor, backbuttonColor, textColor;
  final TextStyle? textStyle;
  final List<Widget>? actions;
  final Function()? onActionButtonTap, onBackPress;
  final double? actionButtonWidth;
  final Widget? leading, bottom;
  final bool addBackButton;

  CustomAppbarWidget({
    Key? key,
    required this.title,
    this.leading,
    this.addBackButton = true,
    this.onBackPress,
    this.backgroundColor = AppColors.kPrimaryColor,
    // this.backgroundColor = const AppColors().getValue('primaryColor'),
    this.backbuttonColor = AppColors.white,
    this.textColor,
    this.textStyle,
    this.actions,
    this.onActionButtonTap,
    this.actionButtonWidth = 100,
    this.bottom,
  })  : assert(
          textColor == null || textStyle == null,
          'Cannot provide both a textColor and a textStyle\n'
          'To provide both, use "textStyle: TextStyle(color: color)".',
        ),
        super(
          key: key,
          child: const SizedBox.shrink(),
          preferredSize:
              Size.fromHeight(bottom == null ? kToolbarHeight : 98.h),
        );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: actions,
      actionsIconTheme: IconThemeData(
        size: 30.w,
      ),
      bottom: bottom == null
          ? null
          : PreferredSize(
              preferredSize: Size.fromHeight(100.h),
              child: bottom!,
            ),
      leading: addBackButton
          ? CustomBackButton(
              leading: leading,
              onBackTap: onBackPress,
            )
          : null,
      leadingWidth: 45.w,
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: textStyle ??
            AppTextStyle.boldStyle.copyWith(
              color: textColor ??
                  (backgroundColor == Colors.white
                      ? AppColors.darkGray
                      : Colors.white),
              fontSize: Dimens.fontSize18,
            ),
      ),
    );
  }
}
