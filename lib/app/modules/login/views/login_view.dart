import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/values/app_colors.dart';
import 'package:flutter_app/app/common/values/strings.dart';
import 'package:flutter_app/app/common/values/styles/dimens.dart';
import 'package:flutter_app/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_app/app/modules/widgets/buttons/facebook_button.dart';
import 'package:flutter_app/app/modules/widgets/buttons/text_button_gradient.dart';
import 'package:flutter_app/app/modules/widgets/custom_inkwell_widget.dart';
import 'package:flutter_app/app/modules/widgets/forms/input_field.dart';
import 'package:flutter_app/app/modules/widgets/text/custom_column_text_widget.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class LoginView extends GetView<LoginController> {
  final controller = LoginController();
  
  Widget _formCompose() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: <Widget>[
          InputField(title: Strings.userName, controller: controller.usernameController, ),
          InputField(title: Strings.password, isPassword: true, controller: controller.passwordController, )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    CustomColumnTextWidget(title: 'Login', subtitle: 'Log in to your account',),
                    SizedBox(height: 50.h),
                    _formCompose(),
                    TextButtonGradient(title: Strings.logIn, onPressed: () => controller.login()),
                    InkWell(
                      onTap: () => {
                        controller.loginWithFacebook()
                      },
                      child: FacebookButton(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomInkwellWidget(
                            onTap: () {
                                Get.toNamed(Routes.INITIAL);
                              }, 
                              child: Text(Strings.back,
                                style: TextStyle(
                                  color: AppColors.kPrimaryColor,
                                    fontSize: Dimens.fontSize14, fontWeight: FontWeight.w500)
                                ),
                              )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
  }
}
