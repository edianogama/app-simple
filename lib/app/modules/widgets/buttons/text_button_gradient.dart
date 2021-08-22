import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/values/app_colors.dart';
import 'package:flutter_app/app/common/values/styles/app_family_font.dart';
import 'package:flutter_app/app/common/values/styles/dimens.dart';

class TextButtonGradient extends StatelessWidget{

  final String title;
  final Function()? onPressed;

  TextButtonGradient({
    Key? key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final List<Color> colorGradient =  AppColors.primaryGradient;
    
    return  TextButton(
          onPressed: this.onPressed,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 25),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(Dimens.radiusInput)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: Dimens.radiusInput,
                      spreadRadius: 2)
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: colorGradient
                    )
              ),
              child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Icon(Icons.keyboard_arrow_right, color: Colors.white,),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child:  Text(
                              title.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: Dimens.fontSize20, color: Colors.white, fontFamily: AppFamilyFont().primaryFontFamily, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
            ),
      );
  } 
}