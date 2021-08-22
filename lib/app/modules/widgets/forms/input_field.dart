import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/values/app_colors.dart';
import 'package:flutter_app/app/common/values/strings.dart';
import 'package:flutter_app/app/common/values/styles/dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget {
  final String title;
  final bool isPassword;
  final String equalToField;
  final controller;

  InputField({
    Key? key ,
    required this.controller,
    required this.title,
    this.equalToField = "",
    this.isPassword = false,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 5.w,
          ),
          TextFormField(
            controller: controller,
            validator: (value) { 
              if (value != null && value.isEmpty){
                return Strings.cantBeEmpty;
              }
              if (isPassword && (value != null && value.length < 3) ) { 
                return Strings.fieldGreaterThan;
              }
              if (equalToField.isNotEmpty) { 
                if(controller.text != equalToField)  { 
                  return Strings.confirmPasswordValidation;
                }
              }
              return null;
            },
              obscureText: isPassword,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(Dimens.radiusInput)),
                  borderSide: BorderSide(color: AppColors.kPrimaryColor, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimens.radiusInput),
                  borderSide: BorderSide(color: AppColors.lightGray, width: 1.0),
                ),
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(25),
                labelText: title.toUpperCase(),
                hintText: title.toUpperCase(),
                hintStyle: TextStyle(
                  color: AppColors.darkGray,
                  fontWeight: FontWeight.w800
                ),
                filled: true)
              )
        ],
      ),
    );
  }
}
