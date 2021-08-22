import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/values/app_colors.dart';
import 'package:flutter_app/app/common/values/styles/app_family_font.dart';

import 'dimens.dart';

class AppTextStyle {
  const AppTextStyle._();

  static final TextStyle semiBoldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle boldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize22,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle regularStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize18,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle buttonTextStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle titleStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize26,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle _textStyle = AppFamilyFont().textStyleRegularFont.copyWith(
    color:  AppColors.darkGray,
    fontSize: Dimens.fontSize14,
  );

}
