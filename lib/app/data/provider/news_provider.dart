
import 'package:flutter_app/app/common/constants.dart';
import 'package:get/get_connect.dart';

class NewsApiClient extends GetConnect{

  getNews() async { 
    return await get(Constants.BASE_URL + "news");
  }
}