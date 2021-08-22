

import 'package:flutter_app/app/data/model/news/news_model.dart';
import 'package:flutter_app/app/data/provider/news_provider.dart';
import 'package:get/get_connect/http/src/response/response.dart';

final NewsApiClient newsApiClient = NewsApiClient();

class NewsRepository { 

  Future<List<News>> news() async{ 
    List<News> news = [];
    Response<dynamic> response =  await newsApiClient.getNews();
    
    if(response.hasError) {
      print('news => ${response.statusCode}');
      return news;
    }

    response.body["data"].forEach((v)  { 
      news.add(new News.fromJson(v));
    });
    return news;
  }
}