import 'package:eazifly_student/core/component/account_data_appbar.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/notifications_controller/notification_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/notifications_controller/notification_state.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/notifications_view/widgets/bottom_sheet_message_type.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/notifications_view/widgets/notification_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<String> messageTypeList = ["SMS", "Whatsapp"];

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  void initState() {
    super.initState();

    NotificationCubit.get(context).initController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AccountDataAppbar(
        customContext: context,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          24.ph,
          BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
              var cubit = NotificationCubit.get(context);
              return Column(
                children: List.generate(
                  3,
                  (index) => InkWell(
                    onTap: () {
                      if (index != 0) {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => const CustomBottomSheetDesign(),
                        );
                      }
                    },
                    child: CustomNotificationListTile(
                      onChanged: (p0) {
                        cubit.changeSwitchState();
                      },
                      // widget: cubit.turnedOn
                      //     ? SizedBox(
                      //         child: Row(
                      //           children: List.generate(
                      //             3,
                      //             (index) => const Expanded(
                      //               child: WhatsAppContainer(),
                      //             ),
                      //           ),
                      //         ),
                      //       )
                      //     : 0.ph,
                      controller: ValueNotifier(false),
                      isTurned: cubit.turnedOn,
                      iconWidget: index != 0
                          ? Icon(
                              Icons.arrow_forward_ios,
                              size: 15.r,
                            )
                          : null,
                      icon: MyImages.iconsProfile, // todo
                      title: index == 2 ? "إختيار نوع المراسلة" : "الاشعارات",
                      isWhats: index == 2,
                      subTitle: "بيانات",
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomBottomSheetDesign extends StatelessWidget {
  final double? radius;
  final double? height;
  final double? width;
  final Widget? widget;

  const CustomBottomSheetDesign({
    super.key,
    this.height,
    this.radius,
    this.widget,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 277.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(radius ?? 16.r),
          topLeft: Radius.circular(radius ?? 16.r),
        ),
        color: Colors.white,
      ),
      child: widget ??
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: [
              24.ph,
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "نوع المراسلة",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 14,
                    ),
                  )),
              20.ph,
              Text(
                "أختر الطريقة المناسبة",
                style: MainTextStyle.mediumTextStyle(
                  fontSize: 12,
                ),
              ),
              16.ph,
              ...List.generate(
                messageTypeList.length,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: 8.w),
                  child: BottomSheetMessageTypeRow(
                    messageData: "بيانات",
                    messageType: messageTypeList[index],
                    onChange: (p0) {},
                    switchValue: true,
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
