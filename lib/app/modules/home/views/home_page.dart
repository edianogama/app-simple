import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/values/app_colors.dart';
import 'package:flutter_app/app/common/values/strings.dart';
import 'package:flutter_app/app/data/model/news/news_model.dart';
import 'package:flutter_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_app/app/modules/widgets/custom_appbar_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends GetView<HomeController> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppbarWidget(
        addBackButton: false,
        title: Strings.news,
      ),
      body: Container(
        child: Obx(
          () {
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemCount: controller.newsList.length,
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final News _news = controller.newsList[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title: ${_news.title}',
                      style: TextStyle(color: AppColors.kPrimaryColor),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Body: ${_news.description}',
                      style: TextStyle(color: AppColors.secondaryColor),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
