
import 'package:flutter_app/app/common/constants.dart';
import 'package:flutter_app/app/common/storage/storage.dart';
import 'package:get/get_connect.dart';

class EventsApiClient extends GetConnect{

  getAllEvents() async { 
    var token = Storage.getValue('gc-token');
    var response = await get(Constants.BASE_URL + "events",
      headers: {
        'Authorization': 'Bearer '+ token,
      }
    );
    return response;
  }
}