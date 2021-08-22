import 'package:flutter_app/app/data/repository/news_repository.dart';
import 'package:flutter_app/app/modules/initial/controllers/initial_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialController>(
      () => InitialController(),
    );  
     Get.lazyPut<NewsRepository>(
      () => NewsRepository(),
    );  
  }
}
