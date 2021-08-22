import 'package:flutter_app/app/data/authentication/authentication_controller.dart';
import 'package:flutter_app/app/data/repository/events_repository.dart';
import 'package:flutter_app/app/modules/events/controllers/event_controller.dart';
import 'package:get/get.dart';

class EventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventController>(
      () => EventController(),
    );
    Get.put(EventsRepository());
  }
}
