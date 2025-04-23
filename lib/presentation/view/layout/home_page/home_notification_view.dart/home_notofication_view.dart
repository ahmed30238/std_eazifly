import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_notification_view.dart/widgets.dart/home_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeNotificationView extends StatelessWidget {
  const HomeNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(     context,
        isCenterTitle: true,
        mainTitle: lang.notifications,
        leadingText: lang.back,
        onLeadinTap: () => back(context),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(
          top: 16.h,
        ),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => HomeNotificationItem(
          onTap: () {},
        ),
        itemCount: 12,
      ),
    );
  }
}


