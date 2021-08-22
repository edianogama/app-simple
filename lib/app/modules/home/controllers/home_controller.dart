import 'package:flutter_app/app/data/model/news/news_model.dart';
import 'package:flutter_app/app/data/repository/news_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final _newsProvider = Get.find<NewsRepository>();
  
  final RxList<News> _newsList = RxList<News>();
  List<News> get newsList => _newsList;
  set newsList(List<News> newsList) => _newsList.addAll(newsList);


  final RxList _dataList = RxList();
  List<dynamic> get dataList => _dataList;
  set dataList(List<dynamic> dataList) => _dataList.addAll(dataList);

  @override
  void onReady() {
    super.onReady();
    getAllNews();
  }
  
  getAllNews() async { 
    newsList = await _newsProvider.news();
  }
}
