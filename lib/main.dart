import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/util/initializer.dart';
import 'package:flutter_app/app/common/values/strings.dart';
import 'package:flutter_app/app/common/values/styles/theme.dart';
import 'package:flutter_app/app/data/authentication/authentication_controller.dart';
import 'package:flutter_app/app/modules/initial/views/initial_page.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
void main() {
  Initializer.instance.init(() {
    runApp(MyApp());
  });
}

class MyApp extends GetWidget<AuthenticationController> {

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: InitialPage(),
        getPages: AppPages.routes,
    );
  }
}
