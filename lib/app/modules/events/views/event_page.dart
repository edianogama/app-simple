import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/values/app_colors.dart';
import 'package:flutter_app/app/common/values/strings.dart';
import 'package:flutter_app/app/data/authentication/authentication_controller.dart';
import 'package:flutter_app/app/data/authentication/authentication_state.dart';
import 'package:flutter_app/app/data/model/event/event_model.dart';
import 'package:flutter_app/app/modules/events/controllers/event_controller.dart';
import 'package:flutter_app/app/modules/login/views/login_view.dart';
import 'package:flutter_app/app/modules/widgets/buttons/text_button_gradient.dart';
import 'package:flutter_app/app/modules/widgets/custom_appbar_widget.dart';
import 'package:flutter_app/app/modules/widgets/text/custom_column_text_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventPage extends GetView<EventController> {
  final eventController = Get.lazyPut(() => EventController());
  final authController = Get.find<AuthenticationController>();

  Widget isNotAuthenticatedWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomColumnTextWidget(
            title: 'Parece que você não está logado!',
            subtitle: 'Realize o Login e não perca nenhum conteúdo.',
          ),
          SizedBox(height: 50.h),
          TextButtonGradient(
            title: Strings.comeTologIn,
            onPressed: () => Get.off(() => LoginView()),
          )
        ],
      ),
    );
  }

  Widget listEvents() {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemCount: controller.eventsList.length,
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final EventModel _event = controller.eventsList[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${_event.name}',
              style: TextStyle(color: AppColors.kPrimaryColor),
            ),
            SizedBox(height: 5.h),
            Text(
              '${_event.resume}',
                style: TextStyle(color: AppColors.midGray),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
        addBackButton: false,
        title: Strings.events,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Obx(() =>  (authController.state is Authenticated) ? GestureDetector(
                  onTap: () => authController.signOut(),
                  child: Icon(
                    Icons.exit_to_app,
                    color: AppColors.white,
                  ),
                ): Container()),
          )
        ],
      ),
      body: Container(
        child: Obx(
          () {
            print(authController.state is Authenticated);
            if (authController.state is Authenticated) {
              return listEvents();
            }
            if (authController.state is UnAuthenticated) {
              return isNotAuthenticatedWidget();
            }
            return isNotAuthenticatedWidget();
          },
        ),
      ),
    );
  }
}
