import 'package:get/get.dart';

class InitialController extends GetxController {
  
  RxInt _selectedPage = 0.obs;
  set selectedPage(int page) => _selectedPage.value = page;
  int get selectedPage => _selectedPage.value;

  @override
  void onReady() {
    super.onReady();
  }
  void changeTab(int index) =>  selectedPage = index;
 
}
