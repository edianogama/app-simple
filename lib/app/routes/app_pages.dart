import 'package:flutter_app/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_app/app/modules/home/views/home_page.dart';
import 'package:flutter_app/app/modules/initial/bindings/initial_binding.dart';
import 'package:flutter_app/app/modules/initial/views/initial_page.dart';
import 'package:flutter_app/app/modules/login/bindings/login_binding.dart';
import 'package:flutter_app/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INITIAL,
      page: () => InitialPage(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
