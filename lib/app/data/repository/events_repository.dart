

import 'package:flutter_app/app/common/storage/storage.dart';
import 'package:flutter_app/app/data/model/event/event_model.dart';
import 'package:flutter_app/app/data/provider/events_provider.dart';
import 'package:get/get_connect.dart';

final EventsApiClient eventApiClient = EventsApiClient();

class EventsRepository { 

  Future<List<EventModel>> events() async{ 
    List<EventModel> events = [];
    if (Storage.getValue('gc-token') == null) return [];
    Response<dynamic> response =  await eventApiClient.getAllEvents();

    if(response.hasError) {
      print('events => ${response.statusCode}');
      return events;
    }
    response.body["data"].forEach((v)  { 
      events.add(new EventModel.fromJson(v));
    });
    return events;
  }
}