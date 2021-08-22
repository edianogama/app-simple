import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/values/app_colors.dart';
import 'package:flutter_app/app/common/values/strings.dart';
import 'package:flutter_app/app/modules/events/views/event_page.dart';
import 'package:flutter_app/app/modules/home/views/home_page.dart';
import 'package:flutter_app/app/modules/initial/controllers/initial_controller.dart';
import 'package:flutter_app/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';

class InitialPage extends GetView<InitialController> {
  final controller = Get.put(InitialController());

  @override
  Widget build(BuildContext context) {
          return Scaffold(
            bottomNavigationBar: Obx(() => BottomNavigationBar(
              currentIndex: controller.selectedPage,
              onTap: controller.changeTab,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Ínicio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.party_mode_sharp),
                  label: 'Eventos',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Perfil')
              ],
            )),
        body: Obx(() => IndexedStack(
              index: controller.selectedPage,
              children: [HomePage(), EventPage(), LoginView()],
            )));
  }
}
