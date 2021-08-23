import 'package:flutter_app/app/data/authentication/authentication_controller.dart';
import 'package:flutter_app/app/data/authentication/authentication_state.dart';
import 'package:flutter_app/app/data/model/event/event_model.dart';
import 'package:flutter_app/app/data/repository/events_repository.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  
  final _eventProvider = Get.find<EventsRepository>();
  final _authController = Get.find<AuthenticationController>();

  final RxList<EventModel> _eventsList = RxList<EventModel>();
  List<EventModel> get eventsList => _eventsList;
  set eventsList(List<EventModel> eventsList) => _eventsList.addAll(eventsList);

  @override
  void onReady() {
    if(_authController.state is Authenticated) {
      getAllEvents();
    }
    super.onReady();
  }

  getAllEvents() async { 
    eventsList = await _eventProvider.events();
  }
  
}
