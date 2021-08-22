import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/app/data/api_helper.dart';
import 'package:flutter_app/app/data/authentication/authentication_controller.dart';
import 'package:flutter_app/app/data/authentication/authentication_service.dart';
import 'package:flutter_app/app/data/interface_controller/api_interface_controller.dart';
import 'package:flutter_app/app/data/repository/news_repository.dart';
import 'package:flutter_app/app/data/repository/events_repository.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class Initializer {
  static final Initializer instance = Initializer._internal();
  factory Initializer() => instance;
  Initializer._internal();

  void init(VoidCallback runApp) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: Get.width,
        maxHeight: Get.height,
      ),
      designSize: Get.size,
    );

    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        printInfo(info: details.stack.toString());
      };

      await _initServices();
      runApp();
    }, (error, stack) {
      printInfo(info: 'runZonedGuarded: ${stack.toString()}');
    });
  }

  Future<void> _initServices() async {
    try {
      await _initStorage();
      _initFacebookProvider();
      _initScreenPreference();
      _initApis();
      _isAuthenticated();
      //start first get from here
      Get.put(EventsRepository());
      Get.put(NewsRepository());
    } catch (err) {
      rethrow;
    }
  }

  void _initApis() {
    Get.put<ApiHelper>(
      ApiHelper(),
    );

    Get.put<ApiInterfaceController>(
      ApiInterfaceController(),
    );
  }
  
  void _isAuthenticated() {
    Get.lazyPut(() => AuthenticationController(Get.put(AuthenticationService())),);
  }

  Future<void> _initStorage() async {
    await GetStorage.init();
  }

  void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _initFacebookProvider() {
    FacebookAuth.instance.webInitialize(
      appId: "331640502080875",
      cookie: true,
      xfbml: true,
      version: "v11.0",
    );
  }
}
